import 'package:e_commerce_project/provider/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../widgets/product_item.dart' as pitem;

class CategoryProducts extends StatelessWidget {
  static const routeName = '/CategoryProducts';
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final catId = ModalRoute.of(context)!.settings.arguments as String;
    final catName = Provider.of<Category>(context).deriveCategory(catId);
    final catProducts = Provider.of<Product>(context).deriveByCatId(catId);
    return Scaffold(
      appBar: AppBar(elevation: 1.0, title: Text(catName)),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
        child: GridView.builder(
            padding: const EdgeInsets.all(5.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.85,
            ),
            itemCount: catProducts.length,
            itemBuilder: (ctx, index) {
              return ChangeNotifierProvider.value(
                  value: catProducts[index], child: pitem.ProductItem());
            }),
      ),
    );
  }
}
