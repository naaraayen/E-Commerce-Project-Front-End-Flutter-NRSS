import 'package:e_commerce_project/screens/item_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart' as pi;

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final loadedItem = Provider.of<pi.ProductItem>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ItemDetails.routeName,
            arguments: {'productId': loadedItem.id});
      },
      child: Container(
          //margin: const EdgeInsets.only(right: 10.0, top: 5.0, bottom: 5.0),
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: Image.network(
                  loadedItem.imageUrl,
                  fit: BoxFit.cover,
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 21,
                  ),
                  Text('4.5'),
                ],
              ),
              Text(
                loadedItem.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                loadedItem.price.toString(),
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Text(
                (loadedItem.price + 20).toString(),
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
