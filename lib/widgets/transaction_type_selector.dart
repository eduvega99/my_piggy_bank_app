import 'package:flutter/material.dart';


class TransactionTypeSelector extends StatefulWidget {

  const TransactionTypeSelector({Key? key}) : super(key: key);

  @override
  State<TransactionTypeSelector> createState() => _TransactionTypeSelectorState();
  
}

class _TransactionTypeSelectorState extends State<TransactionTypeSelector> {

  final Color _greyColor  = const Color(0xffADADAD); 
  List<bool> selectedList = [true, false];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LayoutBuilder(builder: ( _ , constraints) {
        return ToggleButtons(
          selectedBorderColor: _isOutlay() ? Colors.red : Colors.green,
          fillColor: _isOutlay() ? Colors.red[50] : Colors.green[50],
          isSelected: selectedList,
          constraints: BoxConstraints.expand(width: (constraints.maxWidth - 6) / 2),
          children: [
            _ToggleButton(
              text: 'GASTO', 
              icon: Icons.arrow_drop_down_outlined, 
              color: _isOutlay() ? Colors.red : _greyColor
            ),
            _ToggleButton(
              text: 'INGRESO', 
              icon: Icons.arrow_drop_up_outlined, 
              color: !_isOutlay() ? Colors.green : _greyColor
            )
          ],
          onPressed: (index) {
            setState(() {
              selectedList = [false, false];
              selectedList[index] = true;
            });
          }
        );
      }),
    );
  }

  bool _isOutlay() {
    return selectedList[0];
  }

}

class _ToggleButton extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;
  
  const _ToggleButton({
    required this.text,
    required this.icon,
    required this.color,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(text, style: TextStyle(color: color)),
        ]
      )
    );
  }

}