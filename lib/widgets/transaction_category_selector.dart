import 'package:flutter/material.dart';

import 'package:my_piggy_bank_app/models/category.dart';
import 'package:my_piggy_bank_app/providers/categories_provider.dart';


class TransactionCategorySelector extends StatelessWidget {
  
  List<Category> _categories = [];

  TransactionCategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final provider = CategoriesProvider();
    return FutureBuilder(
      future: provider.getCategories(),
      builder: ( _ , AsyncSnapshot<List<Category>> snapshot) {
        _categories = snapshot.hasData ? snapshot.data! : [];
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
      },
    );
  }

  Row _getRow(List<Category> categories) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        categories.length, 
        (index) {
          final category = categories[index];
          return _Button(
            category: category, 
            isSelected: false
          );
        }
      )
    );
  }

}

class _Button extends StatelessWidget {
  
  final Category category;
  final bool isSelected;
  
  const _Button({
    Key? key, 
    required this.category, 
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: _getBorderDecoration(),
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: category.backgroundColor,
        child: IconButton(
          icon: Icon(category.icon, size: 20),
          color: category.iconColor,
          splashRadius: 20,
          tooltip: category.name,
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