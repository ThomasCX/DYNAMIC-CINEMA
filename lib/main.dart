import 'package:flutter/material.dart';
import 'package:dynamic_cinema/src/screens/Cart.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';
import 'Router.dart';
//import 'src/screens/Search.dart';

void main() => runApp(MyApp());

final String appName = "Dynamic Cinema";
final Color primaryColor = Color.fromRGBO(1, 142, 219, 1);
String seatNumber = "";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(pageTitle: 'Welcome'),
      routes: <String, WidgetBuilder>{
        Router.dashboard: (BuildContext context) => Dashboard(),
        Router.productPage: (BuildContext context) => ProductPage(),
        Router.cart: (BuildContext context) => CartPage(),
        // Router.search: (BuildContext context) => SearchPage(),
      },
    );
  }
}
