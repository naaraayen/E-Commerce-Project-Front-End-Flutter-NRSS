import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/order.dart';

class IndividualOrder extends StatefulWidget {
  final String orderId;
  const IndividualOrder(this.orderId, {super.key});

  @override
  State<IndividualOrder> createState() => _IndividualOrderState();
}

class _IndividualOrderState extends State<IndividualOrder> {
  var isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context, listen: false)
        .findOrderById(widget.orderId);
    return Card(
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date: ${orderData.dateTime}'),
                Chip(
                  label: Text(
                    orderData.orderStatus,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.purple,
                ),
                //Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(!isExpanded
                        ? Icons.arrow_drop_down_outlined
                        : Icons.arrow_drop_up))
              ],
            ),
            if (isExpanded)
              SizedBox(
                height: min(orderData.cartProducts.length * 20, 200),
                child: ListView(
                  children: orderData.cartProducts.map((cItem) {
                    return Row(
                      children: [
                        Text('${cItem.quantity}X ${cItem.title}'),
                        const Spacer(),
                        Text('Rs. ${cItem.price}')
                      ],
                    );
                  }).toList(),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total : ${orderData.total}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
