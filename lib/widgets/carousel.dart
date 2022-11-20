import 'package:e_commerce_project/widgets/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/banner.dart' as banner;

class Carousel extends StatefulWidget {
  final BoxConstraints constraints;
  const Carousel(this.constraints, {Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bannerItem = Provider.of<banner.Banner>(context, listen: false).items;
    return Container(
        height: widget.constraints.maxHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0XFFF6F5EB),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: PageView.builder(
            itemCount: bannerItem.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: ((context, index) {
              return CarouselItem(bannerItem[index].id, currentIndex, widget.constraints);
            })));
  }
}
