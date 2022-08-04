import 'package:my_piggy_bank_app/helpers/json_data.dart';
import 'package:my_piggy_bank_app/models/category.dart';

class CategoriesProvider {
  
  static final Map<int, Category> _categories = {};
  static bool _isCategoriesLoaded = false;

  Future<Category?> getCategory(int id) async {
    if (!_isCategoriesLoaded) {
      await _loadCategories();
    }
    return _categories[id];
  }

  Future<List<Category>> getCategories() async {
    if (!_isCategoriesLoaded) {
      await _loadCategories();
    }
    return List.generate(_categories.length, (index) => _categories[index]!);
  }

  Future<void> _loadCategories() async {
    final List<dynamic> data = await getJsonData('categories');
    for (final json in data) {
      final category = Category.fromJson(json);
      _categories[category.id] = category;
    }
    _isCategoriesLoaded = true;
  }

}