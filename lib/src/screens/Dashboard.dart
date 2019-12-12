import 'package:flutter/material.dart';
import 'package:dynamic_cinema/Router.dart';
import '../../Database.dart';
import '../../Order.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import './ProductPage.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import '../../main.dart' as globalVars;

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Database.getOrder().then((onValue) {
    //   print(onValue.toJSON());
    // }).catchError((onError) {
    //   print(onError);
    // });
    final _tabs = [
      combosTab(context),
      confictioneryTab(context),
      drinksTab(context),
      Text("Displays the schedule of movies"),
      Text("Displays Pending Orders"),
      //showtimeTab(context),//Redirects to a website that shows the schedule of movies
      //ordersTab(context),//Displays pending orders
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 23,
          leading: Text('' + globalVars.seatNumber,
              style: logoWhiteStyle, textAlign: TextAlign.center),
          backgroundColor: primaryColor,
          title: Text('Concessions',
              style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            // IconButton(
            //   padding: EdgeInsets.all(0),
            //   iconSize: 21,
            //   icon: Icon(Icons.search),
            //   onPressed: () {
            //     Navigator.pushNamed(context, Router.search);
            //   },
            // ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.pushNamed(context, Router.cart);
              },
              iconSize: 21,
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                title: GestureDetector(
                  onTap: () {
                    combosTab(context);
                  },
                  child: Text(
                    'Combos',
                    style: tabLinkStyle,
                  ),
                )),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_emoticon),
              title: GestureDetector(
                onTap: () {
                  confictioneryTab(context);
                },
                child: Text(
                  'Sweets',
                  style: tabLinkStyle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_drink),
              title: GestureDetector(
                onTap: () {
                  drinksTab(context);
                },
                child: Text(
                  'Drinks',
                  style: tabLinkStyle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_movies),
              title: GestureDetector(
                onTap: () {
                  openBrowserTab();
                },
                child: Text(
                  'Showtime',
                  style: tabLinkStyle,
                ),
              ),
            ),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.attach_money),
            //     title: Text(
            //       'Orders',
            //       style: tabLinkStyle,
            //     ))
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green[600],
          onTap: _onTabTapped,
        ));
  }

  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(
        url: "http://www.palaceamusement.com/daily-schedule.php",
        androidToolbarColor: primaryColor);
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget combosTab(BuildContext context) {
  List<Product> popcornCombo = [
    Product(
        name: "Jumbo Popcorn, Drink & Nuggets",
        image: "images/pcdrinkandnuggets.jpg",
        price: 25.00),
    Product(
        name: "Jumbo Popcorn, Medium Drink & M&Ms",
        image: "images/pcdrinkmmcombo.jpeg",
        price: 33.00),
    Product(
        name: "Large Popcorn, Drinks, Nuggets & Fries",
        image: "images/pcdrinksnuggetsandfries.jpeg",
        price: 22.00),
    Product(
        name: "Large Popcorn, Toy & Drink",
        image: "images/pcdrinktoycombo.jpeg",
        price: 25.00),
    Product(name: "Jumbo Popcorn", image: "images/pcjumbo.jpg", price: 23.00),
    Product(
        name: "Jumbo Popcorn and Drinks",
        image: "images/pcjumboanddrinks.jpg",
        price: 20.00),
    Product(
        name: "Large Popcorn, Toy & Medium Drinks",
        image: 'images/pclgdrinksandhelmet.jpeg',
        price: 25.66),
    Product(
        name: "Popcorn Family Combo",
        image: 'images/pcquadret.png',
        price: 37.40),
    Product(
        name: "Regular Popcorn & Drink",
        image: 'images/pcreganddrink.jpeg',
        price: 18.50),
    Product(
        name: "Regular Popcorn & Drinks",
        image: "images/pcreganddrinks.jpeg",
        price: 15.00),
    Product(
        name: "Small Popcorn & Drink",
        image: "images/pcsmldrink.jpeg",
        price: 12.30)
  ];

  List<Product> hotdogCombo = [
    Product(
        name: "Hot Dog & Fries", image: "images/hdandfries.jpeg", price: 5.50),
    Product(
        name: "Hot Dog, Drink & Patties",
        image: "images/hddrinkandpatties.jpeg",
        price: 11.00),
    Product(
        name: "Hot Dog, Fries & Drink",
        image: "images/hdfriesanddrink.jpeg",
        price: 12.30),
    Product(
        name: "Hot Dogs, Fritos Snack & Drink",
        image: "images/hdfritosanddrink.jpeg",
        price: 13.20),
    Product(
        name: "Hot Dogs, Lays Snack & Drink",
        image: "images/hdlaysanddrink.jpg",
        price: 13.21),
    Product(
        name: "Hot Dogs & Pizza Slice",
        image: "images/hdsandpizza.jpeg",
        price: 14.30),
    Product(
        name: "Hot Dogs, Fries & Drink",
        image: 'images/hdsfriesanddrink.jpeg',
        price: 15.00),
    Product(name: "2 Hot Dogs", image: 'images/hdsdouble.jpeg', price: 8.00),
    Product(name: "3 Hot Dogs", image: 'images/hdstriple.jpeg', price: 12.50)
  ];

  List<Product> mealCombo = [
    Product(
        name: "Bacon & Cheese Burger",
        image: "images/baconandcheeseburger.png",
        price: 8.00),
    Product(
        name: "Burger & Drink",
        image: "images/burgeranddrink.jpg",
        price: 11.50),
    Product(
        name: "Burger, Drink & Fries",
        image: "images/burgerdrinkandfries.jpeg",
        price: 15.50),
    Product(
        name: "Corn Dog Poutines", image: "images/cdpoutine.jpg", price: 9.30),
    Product(
        name: "Cheesy Dish & Drink",
        image: "images/cheesydish.jpg",
        price: 18.00),
    Product(name: "Fish Cakes", image: "images/fishcakes.png", price: 5.50),
    Product(name: "Pizza SLice", image: 'images/pizzaslice.jpg', price: 6.00),
    Product(
        name: "Pizza Slice & Salad",
        image: 'images/pizzasliceandsalad.jpeg',
        price: 29.33),
    Product(
        name: "Pizza Slices & Drink",
        image: 'images/pizzaslicesanddrink.jpg',
        price: 8.00),
    Product(
        name: "Fish Tacos, Cheese Nachos, Drink",
        image: "images/tacosandnachos.jpg",
        price: 16.50),
    Product(
        name: "Tacos 1 Hotdog, 1 Small Drink & 1 Pack of Lays",
        image: "images/tacoscombo.jpg",
        price: 23.10)
  ];

  return ListView(children: <Widget>[
    deals('Popcorn', onViewMore: () {}, items: <Widget>[
      foodItem(popcornCombo[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[0],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(popcornCombo[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[1],
              );
            },
          ),
        );
      }, imgWidth: 180),
      foodItem(popcornCombo[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[2],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(popcornCombo[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[3],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(popcornCombo[4], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[4],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(popcornCombo[5], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[5],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(popcornCombo[6], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[6],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(popcornCombo[7], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[7],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(popcornCombo[8], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[8],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(popcornCombo[9], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[9],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(popcornCombo[10], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: popcornCombo[10],
              );
            },
          ),
        );
      }),
    ]),
    deals('Hot Dog', onViewMore: () {}, items: <Widget>[
      foodItem(hotdogCombo[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[0],
              );
            },
          ),
        );
      }),
      foodItem(hotdogCombo[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[1],
              );
            },
          ),
        );
      }, imgWidth: 250),
      foodItem(hotdogCombo[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[2],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(hotdogCombo[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[3],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(hotdogCombo[4], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[4],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(hotdogCombo[5], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[5],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(hotdogCombo[6], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[6],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(hotdogCombo[7], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[7],
              );
            },
          ),
        );
      }, imgWidth: 200),
      foodItem(hotdogCombo[8], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: hotdogCombo[8],
              );
            },
          ),
        );
      }),
    ]),
    deals('Meal', onViewMore: () {}, items: <Widget>[
      foodItem(mealCombo[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[0],
              );
            },
          ),
        );
      }, imgWidth: 60),
      foodItem(mealCombo[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[1],
              );
            },
          ),
        );
      }, imgWidth: 75),
      foodItem(mealCombo[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[2],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[3],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[4], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[4],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[5], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[5],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[6], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[6],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[7], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[7],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[8], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[8],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[9], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[9],
              );
            },
          ),
        );
      }, imgWidth: 110),
      foodItem(mealCombo[10], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: mealCombo[10],
              );
            },
          ),
        );
      }),
    ])
  ]);
}

Widget confictioneryTab(BuildContext context) {
  List<Product> confictioneries = [
    Product(
        name: "Butterfinger", image: "images/butterfinger.jpeg", price: 5.50),
    Product(name: "Cake Slice", image: "images/cakeslice.jpeg", price: 4.50),
    Product(name: "Cheetos", image: "images/cheetos.jpeg", price: 7.50),
    Product(name: "Chips Ahoy", image: "images/chipsahoy.jpeg", price: 8.30),
    Product(
        name: "Chocolate Covered Raisin",
        image: "images/chococvrdraisin.jpeg",
        price: 10.00),
    Product(name: "Dots", image: "images/dots.jpeg", price: 8.00),
    Product(name: "Doughnut", image: "images/doughnut.jpeg", price: 4.50),
    Product(name: "Fritos", image: "images/fritos.jpeg", price: 5.30),
    Product(name: "Gummy Bears", image: 'images/gummybears.jpeg', price: 5.35),
    Product(
        name: "Herseys Chocolate", image: 'images/herseys.jpeg', price: 29.00),
    Product(name: "Kiss cakes", image: 'images/kisscakes.jpeg', price: 6.00),
    Product(
        name: "Kit Kat Chocolate", image: 'images/kitkat.jpeg', price: 4.50),
    Product(name: "Nerds", image: 'images/nerds.jpeg', price: 9.00),
    Product(
        name: "Nuggles Chocolate", image: "images/nuggles.jpeg", price: 5.60),
    Product(name: "Oreo", image: "images/oreo.jpeg", price: 5.50),
    Product(
        name: "Reese Pieces", image: "images/reesepieces.jpeg", price: 7.00),
    Product(name: "Skittles", image: "images/skittles.jpeg", price: 5.00),
    Product(name: "Starburst", image: "images/starburst.jpeg", price: 6.50),
    Product(name: "Snickers", image: "images/snickers.jpeg", price: 9.50),
    Product(name: "Twix", image: "images/twix.jpeg", price: 8.30),
    Product(name: "Welchs", image: "images/welchs.jpeg", price: 27.30)
  ];

  List<Widget> sweets = new List<Widget>();
  for (var i = 0; i < confictioneries.length; i++) {
    sweets.add(foodItem(confictioneries[i], onTapped: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return new ProductPage(
            productData: confictioneries[i],
          );
        },
      ));
    }, imgWidth: 250));
  }
  return Center(
    child: new ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Wrap(
          direction: Axis.horizontal,
          spacing: 2.0,
          runSpacing: 15.0,
          children: sweets,
        ),
      ],
    ),
  );
}

Widget drinksTab(BuildContext context) {
  List<Product> drinks = [
    Product(name: "Brisk", image: "images/briskicedtea.jpeg", price: 9.34),
    Product(name: "Latte", image: "images/clearlatte.jpeg", price: 9.40),
    Product(
        name: "Bottled Coca Cola",
        image: "images/cocacolabttl.jpeg",
        price: 5.11),
    Product(
        name: "Canned Coca Colca",
        image: "images/cocacolacan.png",
        price: 6.00),
    Product(name: "Coffee", image: "images/coffee.jpeg", price: 11.20),
    Product(name: "Corona", image: "images/corona.jpeg", price: 6.17),
    Product(name: "Mocha", image: "images/frappuccino.png", price: 5.22),
    Product(name: "Fruit Juice", image: "images/fruitjuice.jpeg", price: 5.44),
    Product(name: "Gatorade", image: "images/gatorade.jpeg", price: 6.05),
    Product(
        name: "Grey Goose Vodka",
        image: "images/greygoosevodka.jpeg",
        price: 19.34),
    Product(name: "H&H", image: "images/heavenhill.jpeg", price: 17.33),
    Product(
        name: "Hunter Cider",
        image: "images/hunterbttlecider.jpeg",
        price: 6.33),
    Product(name: "Lemonade", image: "images/lemonadejuice.jpeg", price: 9.33),
    Product(name: "Large Drink", image: "images/lgdrink.jpeg", price: 8.45),
    Product(name: "Medium Drink", image: "images/meddrink.jpeg", price: 6.99),
    Product(name: "Pepsi", image: "images/pepsi.jpeg", price: 4.33),
    Product(
        name: "Skittles MillShake",
        image: "images/skittleshake.jpeg",
        price: 8.33),
    Product(name: "Small Drink", image: "images/smldrink.jpeg", price: 3.45),
    Product(name: "Snapple", image: "images/snapple.jpeg", price: 7.33),
    Product(name: "Sprite", image: "images/sprite.jpeg", price: 3.30),
    Product(name: "Tazo", image: "images/tazoicedgreentea.jpeg", price: 15.33),
    Product(name: "Vodka", image: "images/vodka.png", price: 15.65),
    Product(name: "Water", image: "images/water.jpeg", price: 5.03),
    Product(name: "Weetabix", image: "images/weetabix.jpeg", price: 5.33),
    Product(name: "Wine", image: "images/wine.png", price: 15.33)
  ];

  List<Widget> beverages = new List<Widget>();
  for (var i = 0; i < drinks.length; i++) {
    beverages.add(foodItem(drinks[i], onTapped: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return new ProductPage(
            productData: drinks[i],
          );
        },
      ));
    }, imgWidth: 250));
  }
  return Center(
    child: new ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Wrap(
          direction: Axis.horizontal,
          spacing: 2.0,
          runSpacing: 15.0,
          children: beverages,
        ),
      ],
    ),
  );
}

// Future<void> showtimeTab(BuildContext context) async => Alert(
//       context: context,
//       type: AlertType.info,
//       desc: "You will be redirected to a webpage",
//       buttons: [
//         DialogButton(
//           child: Text(
//             "Grant",
//             style: TextStyle(
//                 backgroundColor: primaryColor,
//                 color: Colors.white,
//                 fontSize: 20),
//           ),
//           onPressed: (openBrowserTab()) => Navigator.pop(context),
//         ),
//         DialogButton(
//           child: Text(
//             "Deny",
//             style: TextStyle(
//                 backgroundColor: primaryColor,
//                 color: Colors.white,
//                 fontSize: 20),
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ],
//       title: "Webpage Naviation",
//     ).show();

// openBrowserTab() async {
//   await FlutterWebBrowser.openWebPage(
//       url: "http://www.palaceamusement.com/daily-schedule.php",
//       androidToolbarColor: primaryColor);
// }

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('', style: contrastText),
        ),
      )
    ],
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
