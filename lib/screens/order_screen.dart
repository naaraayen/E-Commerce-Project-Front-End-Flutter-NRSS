import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/order.dart';
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/OrderScreen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          //automaticallyImplyLeading: false,
          title: Text(
            'My Orders',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black, fontSize: 18.0),
          ),
          toolbarHeight: 35,
          leadingWidth: 500,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: ListView.builder(
            itemCount: orderData.items.length,
            itemBuilder: (ctx, index) {
              return IndividualOrder(orderData.items[index].id);
            },
          ),
        )
        );
  }
}
