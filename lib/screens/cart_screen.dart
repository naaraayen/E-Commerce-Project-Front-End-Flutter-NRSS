import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart' as cp;
import '../widgets/cart_item.dart' as ci;
import '../screens/check_out_screen.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final cartData = Provider.of<cp.Cart>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            'CART',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black, fontSize: 18.0),
          ),
          toolbarHeight: 35,
          leadingWidth: 500,
        ),
        body: cartData.items.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: cartData.items.length,
                          itemBuilder: (ctx, index) {
                            return SizedBox(
                              height: (mediaQuery.size.height -
                                      mediaQuery.padding.top -
                                      mediaQuery.padding.bottom) *
                                  0.17,
                              child: ChangeNotifierProvider.value(
                                value: cartData.items.values.toList()[index],
                                child: ci.CartItem(
                                    cartData.items.keys.toList()[index]),
                              ),
                            );
                          }),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        FittedBox(
                          child: Consumer<cp.Cart>(
                              builder: (context, value, child) => Text(
                                    'Rs ${value.total}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontSize: 17),
                                  )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: (mediaQuery.size.width) * 0.5,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(CheckOutScreen.routeName);
                              },
                              child: const Text('Check Out')),
                        )
                      ],
                    )
                  ],
                ),
              )
            : const Center(
                child: Text('No items in the Cart'),
              ));
  }
}
