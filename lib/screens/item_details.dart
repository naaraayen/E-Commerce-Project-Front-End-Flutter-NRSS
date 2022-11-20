import 'package:e_commerce_project/provider/quantity_handler.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../provider/category.dart';
import '../provider/product.dart';

class ItemDetails extends StatelessWidget {
  static const routeName = '/ItemDetails';
  const ItemDetails({Key? key}) : super(key: key);

  Widget buildTextButton(
      {required HeroIcons getIcon,
      required String getLabel,
      required Color getButtonColor,
      required VoidCallback onPressed}) {
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(getButtonColor)),
      icon: HeroIcon(
        getIcon,
        color: Colors.white,
      ),
      label: FittedBox(
        child: Text(
          getLabel,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final productId = productData['productId'].toString();
    final loadedProduct =
        Provider.of<Product>(context, listen: false).findById(productId);
    final catData = Provider.of<Category>(context, listen: false);
    final cartData = Provider.of<Cart>(context, listen: false);
    final qtyData = Provider.of<QuantityHandler>(context, listen: false);

    const snackBar = SnackBar(
      backgroundColor: Color(0xFFFF5B4F),
      content: Text(
        'Item successfully added to the Cart',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 1),
    );

    return ChangeNotifierProvider.value(
      value: loadedProduct,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          actions: [
            Consumer<ProductItem>(
              builder: (context, product, _) => IconButton(
                onPressed: () {
                  product.toggleFavorite();
                },
                icon: Icon(loadedProduct.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(loadedProduct.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 21,
                        ),
                        Text('4.5')
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loadedProduct.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Rs ${loadedProduct.price} /KG',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Rs ${(loadedProduct.price + 20)} /KG',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: buildTextButton(
                            getIcon: HeroIcons.chat,
                            getLabel: 'Ratings & Reviews',
                            getButtonColor: const Color(0xFFFF5B4F),
                            onPressed: () {},
                          )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: buildTextButton(
                            getIcon: HeroIcons.home,
                            getLabel: 'Supplier\'s Name',
                            getButtonColor: const Color(0xFFFFB801),
                            onPressed: () {},
                          )),
                        ]),
                    const Divider(
                      thickness: 1.0,
                    ),
                    Text.rich(TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Categories : ',
                            style: TextStyle(color: Colors.black54)),
                        TextSpan(
                            text:
                                catData.deriveCategory(loadedProduct.category),
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ],
                    )),
                    const Divider(
                      thickness: 1.0,
                    ),
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      loadedProduct.description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1.0, color: Colors.black26)),
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    qtyData.changeQuantity('minus');
                                  },
                                  icon: const HeroIcon(HeroIcons.minus)),
                            ),
                            const SizedBox(
                              height: double.infinity,
                              child: VerticalDivider(
                                thickness: 1.0,
                                color: Colors.black26,
                                width: 10.0,
                              ),
                            ),
                            Expanded(
                                child: Center(
                                    child: FittedBox(
                              child: Consumer<QuantityHandler>(
                                builder: (context, value, child) =>
                                    Text(value.currentQuantity.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                              ),
                            ))),
                            const SizedBox(
                              height: double.infinity,
                              child: VerticalDivider(
                                thickness: 1.0,
                                color: Colors.black26,
                                width: 10.0,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    qtyData.changeQuantity('plus');
                                  },
                                  icon: const HeroIcon(HeroIcons.plus)),
                            )
                          ],
                        ),
                      )),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: buildTextButton(
                          getIcon: HeroIcons.creditCard,
                          getLabel: 'Buy Now',
                          getButtonColor: Colors.green,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: buildTextButton(
                          getIcon: HeroIcons.shoppingCart,
                          getLabel: 'Add To Cart',
                          getButtonColor: Colors.green,
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            cartData.addToCart(
                                productId: productId,
                                title: loadedProduct.title,
                                quantity: qtyData.currentQuantity,
                                price: loadedProduct.price,
                                imageUrl: loadedProduct.imageUrl);
                            qtyData.resetQuantity();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
