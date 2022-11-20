import 'package:e_commerce_project/screens/order_screen.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  Widget buildRowWidget(String getName, IconData getIcon) {
    return Column(
      children: [Icon(getIcon), Text(getName)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            'ACCOUNT',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black, fontSize: 18.0),
          ),
          toolbarHeight: 35,
          leadingWidth: 500,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
          child: Column(children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xFFFF5B4F),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 25,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'User Name',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Text(
                            '5',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'My Wishlist',
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        ],
                      )),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                          child: Column(
                        children: [
                          Text(
                            '7',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'My Favorite Store',
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(OrderScreen.routeName);
                    },
                    child: buildRowWidget(
                        'My Orders', Icons.check_box_outline_blank)),
                buildRowWidget('My Returns', Icons.turn_left_outlined),
                buildRowWidget('My Cancellation', Icons.cancel_outlined),
              ],
            ),
          ]),
        ));
  }
}
