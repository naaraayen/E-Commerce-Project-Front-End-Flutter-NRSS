import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/account_screen.dart';

// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  static const routeName = '/NavigationScreen';
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> pages = [];

  int selectedPageIndex = 0;

  void selectPage(index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  BottomNavigationBarItem buildNavigationBarItem(
      IconData getIcon, IconData getActiveIcon, MediaQueryData mediaQuery) {
    return BottomNavigationBarItem(
        activeIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(15.0)),
            child: Icon(getActiveIcon)),
        icon: Icon(getIcon),
        label: 'Home');
  }

  @override
  void initState() {
    pages = [Home(), Favorites(), Cart(), Account()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        //height: mediaQuery.size.height * 0.08,
        child: BottomNavigationBar(
            currentIndex: selectedPageIndex,
            onTap: selectPage,
            type: BottomNavigationBarType.fixed,
            items: [
              buildNavigationBarItem(
                  Icons.home_outlined, Icons.home, mediaQuery),
              buildNavigationBarItem(
                  Icons.favorite_border_outlined, Icons.favorite, mediaQuery),
              buildNavigationBarItem(Icons.shopping_cart_outlined,
                  Icons.shopping_cart, mediaQuery),
              buildNavigationBarItem(
                  Icons.person_outline, Icons.person, mediaQuery)
            ]),
      ),
      body: pages[selectedPageIndex],
    );
  }
}
