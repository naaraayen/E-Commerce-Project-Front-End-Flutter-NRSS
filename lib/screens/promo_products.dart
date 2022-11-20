import 'package:e_commerce_project/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../provider/product.dart' as pm;
import '../widgets/product_item.dart' as pitem;
import '../provider/banner.dart' as banner;

// ignore: must_be_immutable
class PromoProducts extends StatelessWidget {
  static const routeName = '/PromoProduct';
  const PromoProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final bannerId = arguments['bannerId'].toString();
    final loadedProducts =
        Provider.of<banner.Banner>(context, listen: false).findById(bannerId);
    final productList = Provider.of<Product>(context, listen: false)
        .deriveProduct(loadedProducts.productList);

    return Scaffold(
      appBar: AppBar(elevation: 1.0, title: Text(loadedProducts.title)),
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
            itemCount: productList.length,
            itemBuilder: (ctx, index) {
              return ChangeNotifierProvider.value(
                  value: productList[index], child: pitem.ProductItem());
            }),
      ),
    );
  }
}
