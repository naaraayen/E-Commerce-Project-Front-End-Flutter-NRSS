import 'package:flutter/cupertino.dart';

class CategoryItem {
  String id;
  String categoryTitle;
  String categoryIcon;
  CategoryItem({
    required this.id,
    required this.categoryTitle,
    this.categoryIcon = 'assets/images/shopping-bag.png',
  });
}

class Category with ChangeNotifier {
  final List<CategoryItem> _items = [
    CategoryItem(
      id: 'C1',
      categoryTitle: 'Fruits',
    ),
    CategoryItem(
      id: 'C2',
      categoryTitle: 'Vegetables',
    ),
    CategoryItem(
      id: 'C3',
      categoryTitle: 'Fresh Meat',
    ),
    CategoryItem(id: 'C4', categoryTitle: 'Fish & Seafood'),
    CategoryItem(
      id: 'C5',
      categoryTitle: 'Others',
    ),
  ];

  List<CategoryItem> get items {
    return [..._items];
  }

  String deriveCategory(String catId) {
    return _items.firstWhere((cat) => cat.id == catId).categoryTitle;
  }
}
