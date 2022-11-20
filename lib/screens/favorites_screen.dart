import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../widgets/product_item.dart' as pi;

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final favProducts = Provider.of<Product>(context).favoriteItems;
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            'WISHLIST',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black, fontSize: 18.0),
          ),
          toolbarHeight: 35,
          leadingWidth: 500,
        ),
        body: favProducts.isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: favProducts.length,
                    itemBuilder: ((context, index) {
                      return ChangeNotifierProvider.value(
                          value: favProducts[index],
                          child: const pi.ProductItem());
                    })),
              )
            : const Center(
                child: Text('No items in the Wishlist'),
              ));
  }
}
