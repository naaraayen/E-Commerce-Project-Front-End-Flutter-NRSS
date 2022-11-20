import 'package:flutter/cupertino.dart';

class BannerItem {
  String id;
  String title;
  String description;
  String imageUrl;
  List<String> productList;

  BannerItem(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.productList});
}

class Banner with ChangeNotifier {
  final List<BannerItem> _items = [
    BannerItem(
        id: 'B1',
        title: 'Tasty & Healthy Organic Food',
        description: 'Get 100% Fresh Food',
        imageUrl:
            'https://img.freepik.com/free-photo/top-view-fresh-vegetables-with-greens-dark-blue-background-salad-snack-vegetable-food_140725-40264.jpg?t=st=1657986449~exp=1657987049~hmac=a99a56f3fd957816cef36f3f77de1ceaf98bda81caf823c27516d0bd170c07ec&w=996',
        productList: ['P1', 'P2', 'P3', 'P4']),
    BannerItem(
        id: 'B2',
        title: 'Sweetness At Its Best',
        description: 'Get Fruits at healthy discount',
        imageUrl:
            'https://img.freepik.com/free-photo/assorted-fruit-yellow-background_23-2148145132.jpg?t=st=1657959415~exp=1657960015~hmac=b9f004b2c232550386f108e531ed361e9dea61dcde321206d396b0b66b7d439f&w=996',
        productList: ['P1', 'P2']),
    BannerItem(
        id: 'B3',
        title: 'Seasonal Freshness',
        description: 'Eat Healthy Eat Seasonal',
        imageUrl:
            'https://img.freepik.com/free-photo/vegetables-arrangement-with-copy-space_23-2148949685.jpg?t=st=1657901996~exp=1657902596~hmac=19bc7503dd6647ab45e3582ac9a27921baa26402e112a6925a8eab2fd45dc086&w=1060',
        productList: ['P1', 'P2', 'P3', 'P4']),
    BannerItem(
        id: 'B4',
        title: 'Organic Salad',
        description: 'Make your digestion better with Salad',
        imageUrl:
            'https://img.freepik.com/free-photo/greek-salad-with-fresh-vegetables-feta-cheese-kalamata-olives_2829-10854.jpg?t=st=1657904294~exp=1657904894~hmac=0c02001132673f2387e294148e907a4ed4f15f53ca800ddd48bff5d9ef588ec8&w=1060',
        productList: ['P4', 'P5']),
  ];

  List<BannerItem> get items {
    return _items;
  }

  BannerItem findById(String id) {
    return _items.firstWhere((banner) => banner.id == id);
  }

  
}
