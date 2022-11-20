import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import './provider/banner.dart' as banner;
import '../provider/category.dart';
import '../provider/product.dart';
import '../screens/item_details.dart';
import '../screens/promo_products.dart';
import './screens/navigation_screen.dart';
import './provider/location.dart';
import './provider/order.dart';
import './provider/quantity_handler.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/category_products.dart';
import './screens/check_out_screen.dart';
import './screens/order_screen.dart';
import './screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Product(),
        ),
        ChangeNotifierProvider(create: (ctx) => banner.Banner()),
        ChangeNotifierProvider(create: (ctx) => Category()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => QuantityHandler()),
        ChangeNotifierProvider(
          create: ((ctx) => Location()),
        ),
        ChangeNotifierProvider(create: (ctx) => Order())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECommerce App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
              accentColor: Colors.green,
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.bold),
              bodyLarge: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Oswald',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              titleMedium: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500),
              titleSmall: TextStyle(
                color: Colors.green,
                fontSize: 18,
              ),
              displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              displaySmall: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            )),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: Colors.black,
                selectedIconTheme: IconThemeData(color: Colors.white))),
        //initialRoute: '/',
        home: LogInScreen(),
        routes: {
          Home.routeName: (ctx) => Home(),
          NavigationScreen.routeName: (ctx) => NavigationScreen(),
          PromoProducts.routeName: (ctx) => PromoProducts(),
          ItemDetails.routeName: (ctx) => ItemDetails(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          CategoryProducts.routeName: (ctx) => CategoryProducts(),
          CheckOutScreen.routeName: (ctx) => CheckOutScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}
