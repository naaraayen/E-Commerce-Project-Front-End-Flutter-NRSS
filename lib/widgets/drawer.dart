import 'package:e_commerce_project/screens/category_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/category.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryItems = Provider.of<Category>(context, listen: false).items;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height * 0.1,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://img.freepik.com/free-photo/set-fruits-seeds-leaves_23-2148145087.jpg?t=st=1657958519~exp=1657959119~hmac=4895ea0d328c6d009cff67f71406a6aa711fe6ad71731ac1157362eb5ef58c38&w=996',
                    )),
                color: Colors.green.shade800,
              ),
              child: Center(
                child: Text(
                  'CATEGORIES',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black, fontSize: 18.0),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: categoryItems.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(CategoryProducts.routeName, arguments: categoryItems[index].id),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey.shade300, width: 1.0))),
                        child: ListTile(
                          leading: Image.asset(
                            categoryItems[index].categoryIcon,
                          ),
                          title: Text(categoryItems[index].categoryTitle,
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
