import 'package:flutter/material.dart';
import 'package:dynamic_cinema/Order.dart';
import 'package:dynamic_cinema/main.dart' as globalVars;
import 'package:dynamic_cinema/src/shared/Product.dart';
import 'package:dynamic_cinema/src/shared/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Database.dart';
import '../../Router.dart';
import '../shared/colors.dart';

class CartPage extends StatefulWidget {
  final String pageTitle;
  static List<Product> cartContents = [];

  static addToCart(Product product) {
    CartPage.cartContents.add(product);
  }

  CartPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  static List<Widget> cartContentWidgets = [];
  @override
  Widget build(BuildContext context) {
    cartContentWidgets = [];

    double _total = 0;

    for (var i = 0; i < CartPage.cartContents.length; i++) {
      _total += CartPage.cartContents[i].price;
      cartContentWidgets.add(
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(
                            CartPage.cartContents[i].image,
                            width: 40,
                            height: 40,
                          )
                        ],
                      ),
                      Text(
                        CartPage.cartContents[i].name,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Text(
                    "x" + CartPage.cartContents[i].quantity.toString(),
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    CartPage.cartContents[i].price.toStringAsFixed(2) + " ¥",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      cartContentWidgets.add(Divider());
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text('Cart', style: logoWhiteStyle, textAlign: TextAlign.center),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView(
              children: cartContentWidgets,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _total.toStringAsFixed(2) + " ¥",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: primaryColor,
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () async {
                        if (await Database.saveOrder(
                          new Order(
                            globalVars.seatNumber,
                            CartPage.cartContents,
                          ),
                        )) {
                          // Order is saved to database
                          setState(() {
                            CartPage.cartContents = [];
                          });
                          Navigator.pushReplacementNamed(
                            context,
                            Router.dashboard,
                          );
                          Fluttertoast.showToast(
                              msg: "Order Placed Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          // Show error toast
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
      backgroundColor: bgColor,
    );
  }
}
