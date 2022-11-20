import 'package:flutter/material.dart';

class ProductItem with ChangeNotifier {
  String id;
  String title;
  double price;
  double discountPercentage;
  double ratings;
  String description;
  String imageUrl;
  String category;
  bool isFavorite;
  int initQuantity;
  ProductItem({
    required this.id,
    required this.price,
    required this.discountPercentage,
    this.ratings = 0.0,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.category = 'C5',
    this.isFavorite = false,
    this.initQuantity = 1,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Product with ChangeNotifier {
  final List<ProductItem> _items = [
    ProductItem(
        id: 'P1',
        title: 'Apple',
        price: 250,
        discountPercentage: 10,
        description: 'Apple from Mustang',
        imageUrl:
            'https://img.freepik.com/premium-photo/fresh-red-apple-fruit-with-sliced-green-leaves-isolated-white-background_252965-9.jpg?w=996',
        category: 'C1'),
    ProductItem(
        id: 'P2',
        title: 'Orange',
        price: 150,
        discountPercentage: 15,
        description: 'Fresh Oranges From Ramechhap',
        imageUrl:
            'https://img.freepik.com/free-photo/cut-whole-orange-fruits-with-green-leaves_74855-5380.jpg?t=st=1657976310~exp=1657976910~hmac=35ddf8ff4e1782efa9361803bb2556a67b061ced8cea57439c7d8ad150a95344&w=996',
        category: 'C1'),
    ProductItem(
        id: 'P3',
        title: 'Banana',
        price: 180,
        discountPercentage: 10,
        description: 'Malpu Kera',
        imageUrl:
            'https://img.freepik.com/premium-photo/banch-bananas-yellow-background_264197-18957.jpg?w=996',
        category: 'C1'),
    ProductItem(
        id: 'P4',
        title: 'Tomato',
        price: 60,
        discountPercentage: 5,
        description: 'Local Tomato',
        imageUrl:
            'https://img.freepik.com/free-vector/fresh-tomatoes-whole-slices-realistic-composition-with-basil-oregano-rosemary-herbs-aromatic-clove-spice_1284-31937.jpg?t=st=1657976414~exp=1657977014~hmac=de31c7c420f1861f4b461d36c4f1c294c1a5c7870bd862d5c71971cb85bb13df&w=826',
        category: 'C2'),
    ProductItem(
        id: 'P5',
        title: 'Brocolli',
        price: 250,
        discountPercentage: 15,
        description: 'Fresh Brocolli',
        imageUrl:
            'https://img.freepik.com/premium-photo/bowl-broccoli-white-surface-fresh-vegetable_185193-14253.jpg?w=996',
        category: 'C2'),
    ProductItem(
        id: 'P6',
        title: 'Chicken',
        price: 400,
        discountPercentage: 10,
        description: 'Fresh Chicken. ',
        imageUrl:
            'https://img.freepik.com/free-photo/top-view-fresh-raw-chicken-with-green-leaves-dark-background-chicken-meal-animal-meat-photo-food-color-kitchen_179666-46060.jpg?t=st=1657976581~exp=1657977181~hmac=9e9639d48fce9486fea16ca707612e06fe44d283039dc10417bf8e05334aa7fa&w=996',
        category: 'C3'),
    ProductItem(
        id: 'P7',
        title: 'Sidra Fish',
        price: 550,
        discountPercentage: 10,
        description: 'Fresh water fish of Majhikuna',
        imageUrl:
            'https://img.freepik.com/free-photo/raw-mackerel-with-spices_1205-2127.jpg?t=st=1657976635~exp=1657977235~hmac=c5c218b1ede39a19fe560d3342306b63427d844add4a78fc93ef3bb3b168b47f&w=996',
        category: 'C4'),
  ];

  List<ProductItem> get item {
    return [..._items];
  }

  List<ProductItem> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  ProductItem findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  List<ProductItem> deriveProduct(List getList) {
    return _items.where((item) => getList.contains(item.id)).toList();
  }

  List<ProductItem> deriveByCatId(catId) {
    return _items.where((item) => item.category == catId).toList();
  }
}
