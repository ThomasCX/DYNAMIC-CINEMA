import 'package:dynamic_cinema/src/Concessions.dart';
import 'package:flutter/material.dart';

class Product {
  String name;
  String image;
  double quantity;
  double price;
  Concessions type;
  Product({
    @required this.name,
    @required this.price,
    @required this.image,
    this.quantity = 0,
    this.type = Concessions.Snacks,
  });
  Map toJSON() {
    return {
      "name": this.name,
      "image": this.image,
      "quantity": this.quantity,
      "price": this.price,
      "type": this.type,
    };
  }
}
