import '../widgets/product_item.dart' as pi;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';

// ignore: must_be_immutable
class PromoItem extends StatelessWidget {
  String getTitle;
  List getPromo;
  PromoItem(this.getTitle, this.getPromo, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    final displayItem = productData.deriveProduct(getPromo);
    return Container(
        height: 220,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            //color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            getTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: displayItem.length,
              itemBuilder: ((context, index) {
                return ChangeNotifierProvider.value(
                    value: displayItem[index],
                    child: const Padding(
                      padding:
                          EdgeInsets.only(right: 10.0, top: 5.0, bottom: 5.0),
                      child: pi.ProductItem(),
                    ));
              }),
            ),
          )
        ]));
  }
}
