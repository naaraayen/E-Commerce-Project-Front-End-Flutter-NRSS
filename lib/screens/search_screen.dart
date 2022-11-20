import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  static const routeName = '/SearchScreen';
  SearchScreen({Key? key}) : super(key: key);

  var searchProduct = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        elevation: 1.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15.0)),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  // label: Row(
                  //   children: const [
                  //     Icon(Icons.search),
                  //     SizedBox(
                  //       width: 8.0,
                  //     ),
                  //     Text('Search any local product')
                  //   ],
                  // ),
                ),
                controller: searchProduct,
                onEditingComplete: null,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              'SEARCH',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
