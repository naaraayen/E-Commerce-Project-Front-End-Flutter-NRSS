import '../provider/cart.dart' as ci;
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;
  const CartItem(this.productId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadedCartItem = Provider.of<ci.CartItem>(context, listen: false);
    final cartData = Provider.of<ci.Cart>(context);
    return LayoutBuilder(
      builder: ((context, constraints) => Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 1.0),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: double.infinity,
                  width: constraints.maxWidth * 0.26,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        loadedCartItem.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loadedCartItem.title,
                      style: const TextStyle(
                          //color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rs ${loadedCartItem.price} /KG',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 16),
                    ),
                    FittedBox(
                      child: Consumer<ci.CartItem>(
                        builder: (context, cartData, child) => Text(
                          '${cartData.quantity} x Rs ${loadedCartItem.price} = Rs ${loadedCartItem.price * loadedCartItem.quantity}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1.0, color: Colors.black26)),
                        height: constraints.maxHeight * 0.28,
                        width: constraints.maxWidth * 0.3,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    cartData.totalAmount();
                                    loadedCartItem.quantityTracker('minus');
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
                              child: Consumer<ci.CartItem>(
                                builder: (context, cartData, _) =>
                                    Text(cartData.quantity.toString(),
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
                                    cartData.totalAmount();
                                    loadedCartItem.quantityTracker('plus');
                                  },
                                  icon: const HeroIcon(HeroIcons.plus)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    cartData.removeCartItem(productId);
                  },
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.black26,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
