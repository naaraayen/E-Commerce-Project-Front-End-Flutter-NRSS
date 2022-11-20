import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/banner.dart' as banner;
import '../screens/promo_products.dart';

class CarouselItem extends StatelessWidget {
  final String bannerId;
  final int currentIndex;
  final BoxConstraints constraints;
  const CarouselItem(this.bannerId, this.currentIndex, this.constraints,
      {Key? key})
      : super(key: key);

  Widget buildIndicator(bool isSelected) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey,
            shape: BoxShape.circle));
  }

  @override
  Widget build(BuildContext context) {
    final bannerData = Provider.of<banner.Banner>(context, listen: false);
    final loadedBanner = bannerData.findById(bannerId);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PromoProducts.routeName, arguments: {
          'bannerId': bannerId,
        });
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: double.infinity,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.08),
                    Colors.black.withOpacity(0.03),
                    Colors.black.withOpacity(0.01)
                  ]),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  loadedBanner.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.35,
                  child: Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      text: loadedBanner.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const VerticalDivider(
                        color: Colors.white,
                        thickness: 2.0,
                        width: 5.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.3,
                        child: Text.rich(
                          maxLines: 3,
                          textAlign: TextAlign.left,
                          TextSpan(
                            text: loadedBanner.description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (var i = 0; i < bannerData.items.length; i++)
                    buildIndicator(currentIndex == i)
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
