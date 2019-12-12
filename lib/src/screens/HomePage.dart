import 'package:flutter/material.dart';
import 'package:dynamic_cinema/Router.dart';
import 'package:dynamic_cinema/main.dart';
import 'package:dynamic_cinema/src/shared/inputFields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Router.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/buttons.dart';

// import 'package:page_transition/page_transition.dart';
// import './SignUpPage.dart';
// import './SignInPage.dart';

class HomePage extends StatefulWidget {
  final String pageTitle;

  HomePage({Key key, this.pageTitle}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                // Image.asset(
                //   'images/welcome.jpg',
                //   width: 190,
                //   height: 190,
                // ),
                // ConstrainedBox(
                //   constraints: BoxConstraints(maxWidth: 200),
                //   child: ,
                // )
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, top: 0),
                    child: Text('Dynamic Cinema!🎥', style: logoStyle),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: fryoTextInput(
                        'Enter Seat Number 💺',
                        controller,
                        autofocus: true, //Keyboard automatically appears
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  width: 200,
                  margin: EdgeInsets.only(bottom: 0),
                  child: froyoFlatBtn('Continue', () {
                    //Validates the number of characers present in the seat number field
                    if (controller.text.length < 2) {
                      //Implement an error toast at this point
                      Fluttertoast.showToast(
                          msg: "Invalid Seat Number!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      seatNumber = controller.text;
                      //Redirects to the Concessions page
                      Navigator.pushReplacementNamed(context, Router.dashboard);
                    }
                  }),
                ),
                // Container(
                //   width: 200,
                //   padding: EdgeInsets.all(0),
                //   child: froyoOutlineBtn('Sign Up', () {
                //     Navigator.pushReplacement(
                //         context,
                //         PageTransition(
                //             type: PageTransitionType.rotate,
                //             duration: Duration(seconds: 1),
                //             child: SignUpPage()));
                //     // Navigator.of(context).pushReplacementNamed('/signup');
                //   }),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Language:', style: TextStyle(color: darkText)),
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        child: Text('English ›',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: bgColor,
    );
  }
}
