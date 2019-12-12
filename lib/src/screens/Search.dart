// import 'package:flutter/material.dart';
// // import 'package:dynamic_cinema/Order.dart';
// // import 'package:dynamic_cinema/main.dart' as globalVars;
// import 'package:dynamic_cinema/src/shared/Product.dart';
// // import 'package:dynamic_cinema/src/shared/styles.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import '../../Database.dart';
// // import '../../Router.dart';
// // import '../shared/colors.dart';

// //import 'package:search_widget/search_widget.dart';

// class SearchPage extends SearchDelegate {
//   //final String pageTitle;
//   static List<Product> cartContents = [];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.length < 3) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             //Do a toast for here
//             child: Text(
//               "Search term must be longer than two letters.",
//             ),
//           )
//         ],
//       );
//     }
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     return null;
//   }
// }

// // static addToCart(Product product) {
// //   SearchPage.cartContents.add(product);
// // }

// // SearchPage({Key key, this.pageTitle}) : super(key: key);

// // @override
// // _SearchPageState createState() => _SearchPageState();

// // class _SearchPageState extends State<SearchPage> {
// //   static List<Widget> cartContentWidgets = [];
// //   @override
// //   Widget build(BuildContext context) {
// //     List<Product> searchResults = [];
// //     TextEditingController controller = new TextEditingController();

// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         elevation: 0,
// //         backgroundColor: primaryColor,
// //         title: TextField(
// //           controller: controller,
// //           autofocus: true, //Keyboard automatically appears
// //           onChanged: (String query) {},
// //           cursorColor: Colors.white,
// //           style: inputFieldTextStyle,
// //           decoration: InputDecoration(
// //               hintText: "Search",
// //               hintStyle: inputFieldHintTextStyle,
// //               focusedBorder: inputFieldFocusedBorderStyle,
// //               contentPadding:
// //                   EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //               border: inputFieldDefaultBorderStyle),
// //         ),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           Container(
// //             height: MediaQuery.of(context).size.height - 160,
// //             child: ListView(
// //               children: cartContentWidgets,
// //             ),
// //           ),
// //           Expanded(
// //               child: Container(
// //             padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
// //             child: Column(
// //               children: <Widget>[
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: <Widget>[
// //                     Container(
// //                       padding: EdgeInsets.all(10),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: <Widget>[
// //                           Text(
// //                             "Total",
// //                             style: TextStyle(
// //                                 color: Colors.black87,
// //                                 fontWeight: FontWeight.bold),
// //                           ),
// //                           Text(
// //                             // _total.toStringAsFixed(2) + " ¥",
// //                             style: TextStyle(
// //                               color: Colors.black87,
// //                               fontSize: 24,
// //                             ),
// //                           )
// //                         ],
// //                       ),
// //                     ),
// //                     GestureDetector(
// //                       child: Container(
// //                         padding: EdgeInsets.all(10),
// //                         color: primaryColor,
// //                         child: Text(
// //                           "Checkout",
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                       onTap: () async {
// //                         if (await Database.saveOrder(
// //                           new Order(
// //                             globalVars.seatNumber,
// //                             SearchPage.cartContents,
// //                           ),
// //                         )) {
// //                           // Order is saved to database
// //                           setState(() {
// //                             SearchPage.cartContents = [];
// //                           });
// //                           Navigator.pushReplacementNamed(
// //                             context,
// //                             Router.dashboard,
// //                           );
// //                           Fluttertoast.showToast(
// //                               msg: "Order Placed Successfully",
// //                               toastLength: Toast.LENGTH_SHORT,
// //                               gravity: ToastGravity.BOTTOM,
// //                               timeInSecForIos: 1,
// //                               backgroundColor: Colors.black54,
// //                               textColor: Colors.white,
// //                               fontSize: 16.0);
// //                         } else {
// //                           // Show error toast
// //                         }
// //                       },
// //                     )
// //                   ],
// //                 )
// //               ],
// //             ),
// //           ))
// //         ],
// //       ),
// //       backgroundColor: bgColor,
// //     );
// //   }
// // }
