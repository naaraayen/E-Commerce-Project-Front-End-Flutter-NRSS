import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/location.dart' as loc;
import '../widgets/dropdown_menu.dart';
import '../provider/cart.dart';
import '../provider/order.dart';

class CheckOutScreen extends StatefulWidget {
  static const routeName = '/CheckOutScreen';
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var isInit = true;
  var isLoading = true;
  var isProcessing = false;
  List<Map<String, dynamic>> paymentGateway = [
    {'name': 'COD', 'color': Colors.orange},
    {'name': 'eSewa', 'color': Colors.green},
    {'name': 'Khalti', 'color': Colors.purple},
    {'name': 'IME Pay', 'color': Colors.red},
  ];

  @override
  void didChangeDependencies() async {
    if (isInit) {
      setState(() {
        Provider.of<loc.Location>(context, listen: false)
            .fetchLocations()
            .then((_) {
          setState(() {
            isLoading = false;
          });
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  Widget setHeader(String getTitle) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        getTitle,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  var isChosen = '';

  void selectionHandler(String chosen) {
    setState(() {
      isChosen = chosen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    final locData = Provider.of<loc.Location>(context, listen: false);
    final cartData = Provider.of<Cart>(context, listen: false);
    final cartItems = cartData.items.values.toList();
    // print(locData);
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          //automaticallyImplyLeading: false,
          title: Text(
            'Check Out',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black, fontSize: 18.0),
          ),
          toolbarHeight: 35,
          leadingWidth: 500,
        ),
        body: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Card(
                            margin: const EdgeInsets.all(5.0),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        setHeader('Selected Items'),
                                      ],
                                    ),
                                    ...cartItems.map((itemData) {
                                      return Text.rich(
                                        TextSpan(children: [
                                          TextSpan(
                                              text: '${itemData.quantity} x ',
                                              style: const TextStyle(
                                                  //color: Colors.green,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  '${itemData.title} (${itemData.price}) = ',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  'Rs. ${itemData.price * itemData.quantity}',
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                      );
                                    }).toList(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text('Sub Total : ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        FittedBox(
                                          child: Text(
                                            'Rs ${cartData.total}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(fontSize: 17),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.all(5.0),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  setHeader('Choose Location'),
                                  isLoading ? const Center(child: CircularProgressIndicator(),):DropDownMenu(
                                      (locData.location['data'] as List)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text('Delivery Charge : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      FittedBox(
                                        child: Text(
                                          'Rs 20',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                setHeader('Choose Payment Option'),
                                SizedBox(
                                  height: 100,
                                  child: GridView(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 4),
                                    children: paymentGateway.map((item) {
                                      return InkWell(
                                        onTap: () {
                                          selectionHandler(item['name']);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(4.5),
                                          decoration: BoxDecoration(
                                            color: item['color'],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: isChosen == item['name']
                                                ? Border.all(
                                                    color: Colors.black,
                                                    width: 2.0)
                                                : null,
                                          ),
                                          child: Center(
                                              child: Text(
                                            item['name'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Total : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        FittedBox(
                          child: Text(
                            'Rs ${cartData.total + 20}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 17),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: (mediaQueryData.width) * 0.5,
                          child: TextButton(
                              onPressed: () {
                                Provider.of<Order>(context, listen: false)
                                    .addToOrder(cartItems, cartData.total);

                                cartData.clearCart();

                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text(
                                          'Transaction Info',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        content:
                                            const Text('Payment Successful'),
                                        actions: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              icon: const Icon(
                                                  Icons.arrow_back_ios_new)),
                                        ],
                                      );
                                    });
                              },
                              child: const Text('Proceed to Pay')),
                        )
                      ],
                    )
                  ],
                ),
              ));
  }
}
