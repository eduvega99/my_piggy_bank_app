import 'package:flutter/material.dart';


class TransactionCategorySelector extends StatelessWidget {
  
  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Salud e higiene',
      'icon': Icons.local_hospital,
      'iconColor': Colors.green,
      'backgroundColor': Colors.green[100]!,
      'isSelected': false,
    },
    {
      'name': 'Alimentación',
      'icon': Icons.restaurant,
      'iconColor': Colors.orange,
      'backgroundColor': Colors.orange[100]!,
      'isSelected': false,
    },
    {
      'name': 'Transporte',
      'icon': Icons.directions_car,
      'iconColor': Colors.purple,
      'backgroundColor': Colors.purple[100]!,
      'isSelected': false,
    },
    {
      'name': 'Supermercado',
      'icon': Icons.shopping_cart,
      'iconColor': Colors.indigo,
      'backgroundColor': Colors.indigo[100]!,
      'isSelected': true,
    },
    {
      'name': 'Cuentas y pagos',
      'icon': Icons.receipt,
      'iconColor': Colors.blue,
      'backgroundColor': Colors.blue[100]!,
      'isSelected': false,
    },
    {
      'name': 'Compras',
      'icon': Icons.shopping_bag,
      'iconColor': Colors.brown,
      'backgroundColor': Colors.brown[100]!,
      'isSelected': false,
    },
    {
      'name': 'Ocio',
      'icon': Icons.interests_rounded,
      'iconColor': Colors.pink,
      'backgroundColor': Colors.pink[100]!,
      'isSelected': false,
    },
    {
      'name': 'Otros',
      'icon': Icons.more_horiz,
      'iconColor': Colors.teal,
      'backgroundColor': Colors.teal[100]!,
      'isSelected': false,
    },
  ];

  TransactionCategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final halfSizeArray = (_categories.length / 2).ceil();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _getRow(_categories.sublist(0, halfSizeArray)),
          const SizedBox(height: 5),
          _getRow(_categories.sublist(halfSizeArray, _categories.length)),
        ],
      ),
    );
  }

  Row _getRow(List<Map<String, dynamic>> categories) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        categories.length, 
        (index) {
          final category = categories[index];
          return _Button(
            tooltip: category['name'],
            icon: category['icon'],
            iconColor: category['iconColor'],
            backgroundColor: category['backgroundColor'],
            isSelected: category['isSelected']
          );
        }
      )
    );
  }

}

class _Button extends StatelessWidget {
  
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final bool isSelected;
  final String? tooltip;
  
  const _Button({
    Key? key, 
    required this.icon, 
    required this.iconColor, 
    required this.backgroundColor,
    this.isSelected = false, 
    this.tooltip 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: _getBorderDecoration(),
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: backgroundColor,
        child: IconButton(
          icon: Icon(icon, size: 20),
          color: iconColor,
          splashRadius: 20,
          tooltip: tooltip,
          onPressed: () {
            print('Hola mundo');
          },
        ),
      ),
    );
  }

  BoxDecoration _getBorderDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: isSelected ? const Color(0xffD4D4D4) : Colors.transparent,
        width: 2
      )
    );
  }
}