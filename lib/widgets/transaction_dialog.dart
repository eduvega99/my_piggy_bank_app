import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionDialog extends StatelessWidget {
  
  const TransactionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 5,
      child: const _PopupContent(),
    );
  }

}

class _PopupContent extends StatelessWidget {
  
  const _PopupContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      width: size.width * 0.95,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: _TransactionForm()
    );
  }

}

class _TransactionForm extends StatelessWidget {
  
  final dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); 
  late BuildContext _context;

  _TransactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Form(
      key: _formKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 15),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: dateController,
            onTap: () => _pickDateTime(),
            decoration: const InputDecoration(
              labelText: 'Fecha'
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Cantidad',
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Concepto',
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            child: const Text('Guardar'),
            onPressed: () => _formKey.currentState?.validate()
          )
        ],
      ),
    );
  }

  void _pickDateTime() async {
    FocusScope.of(_context).requestFocus(FocusNode());
    final dateTime = await _selectDateTime();
    if (dateTime != null) {
      final dateFormat = DateFormat('dd-MM-yyyy hh:mm');
      dateController.text = dateFormat.format(dateTime);
    }
  }

  Future<DateTime?> _selectDateTime() async {
    final date = await showDatePicker(context: _context, firstDate: DateTime(2021), lastDate: DateTime(2100), initialDate: DateTime.now());
    if (date == null ) return null;
    final time = await showTimePicker(context: _context, initialTime: TimeOfDay.now());
    if (time == null) return null;
    return DateTime(date.year, date.month, date.day, time.hour, time.hour); 
  }

}