import 'package:dynamic_cinema/src/shared/Product.dart';
import 'main.dart' as globalVars;

class Order {
  String seatNumber;
  List<Product> items;
  bool isFilled = false;
  Order(String seatNumber, List<Product> items) {
    this.seatNumber = seatNumber;
    this.items = items;
  }

  static Order fromJSON(List<Product> orderData) {
    return new Order(globalVars.seatNumber, orderData);
  }

  Map toJSON() {
    return {"seatNumber": this.seatNumber, "items": this.items.toString()};
  }
}
