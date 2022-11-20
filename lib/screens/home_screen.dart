import 'package:e_commerce_project/screens/search_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../data/dummy_data.dart';
import '../widgets/carousel.dart';
import '../widgets/promo.dart';
import 'package:heroicons/heroicons.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  static const routeName = '/HomeScreen';
  Home({Key? key}) : super(key: key);

  var displayPromo = dummyPromo;
  var searchProduct = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 1.0,
        leadingWidth: 25,
        title: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SearchScreen.routeName);
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Row(
              children: const [
                HeroIcon(HeroIcons.search),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Search Any Product',
                  style: TextStyle(color: Colors.black45),
                )
              ],
            ),
          ),
        ),
        // actions: [
        //   Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        //     width: MediaQuery.of(context).size.width * 0.9,
        //     child: TextField(
        //       decoration: InputDecoration(
        //         floatingLabelBehavior: FloatingLabelBehavior.never,
        //         border: OutlineInputBorder(
        //             borderSide: const BorderSide(color: Colors.black),
        //             borderRadius: BorderRadius.circular(15.0)),
        //         focusColor: Colors.black,
        //         focusedBorder: OutlineInputBorder(
        //             borderSide:
        //                 const BorderSide(color: Colors.black, width: 2.0),
        //             borderRadius: BorderRadius.circular(15.0)),
        //         label: Row(
        //           children: const [
        //             Icon(Icons.search),
        //             SizedBox(
        //               width: 8.0,
        //             ),
        //             Text('Search any local product')
        //           ],
        //         ),
        //       ),
        //       controller: searchProduct,
        //       onEditingComplete: null,
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
          child: Column(
            children: [
              SizedBox(
                height: (mediaQuery.size.height -
                        mediaQuery.padding.top -
                        mediaQuery.padding.bottom) *
                    0.25,
                child: LayoutBuilder(
                  builder: ((ctx, constraints) => Carousel(constraints)),
                ),
              ),
              ...displayPromo.map((item) {
                return PromoItem(item['promoTitle'], item['productList']);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
