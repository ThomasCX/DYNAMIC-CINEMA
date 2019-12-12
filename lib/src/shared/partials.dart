import 'package:flutter/material.dart';
import '../shared/Product.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';

Widget foodItem(Product food,
    {double imgWidth, onTapped, bool isProductPage = false}) {
  return Container(
    width: 150,
    height: 150,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
        Container(
            width: 180,
            height: 180,
            child: RaisedButton(
                color: white,
                elevation: (isProductPage) ? 20 : 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: food.name,
                    child: Image.asset(food.image,
                        width: (imgWidth != null) ? imgWidth : 100)))),
        Positioned(
          bottom: 0,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food.name, style: foodNameText),
                    Text(food.price.toStringAsFixed(2) + "¥", style: priceText),
                  ],
                )
              : Text(' '),
        ),
      ],
    ),
  );
}
