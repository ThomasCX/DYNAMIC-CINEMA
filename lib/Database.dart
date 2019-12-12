import 'package:dynamic_cinema/src/shared/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Order.dart';
import 'main.dart';

abstract class Database {
  static final String apiKey = "4i7sqxdj";

  static Future<bool> _insertData(String key, String data) async {
    assert(key.split(" ").length == 1, "invalid database provided");
    var client = new http.Client();
    var response = await client.post(
      "https://keyvalue.immanuel.co/api/KeyVal/UpdateValue/$apiKey/$key/$data",
      body: {},
    );
    return response.body.toString() == "true";
  }

  //Useful for getting pending orders
  static Future<String> _getData(String key) async {
    assert(key.split(" ").length == 1, "invalid database provided");
    var client = new http.Client();
    var response = await client.get(
      "https://keyvalue.immanuel.co/api/KeyVal/GetValue/$apiKey/$key/",
    );
    return response.body.toString();
  }

  static Future<bool> saveOrder(Order order) async {
    String seat = order.seatNumber;
    List<Map> orderItems = [];
    order.items.forEach((product) {
      orderItems.add(product.toJSON());
    });
    String data = "";
    var bytes = utf8.encode(jsonEncode(orderItems));
    data = base64.encode(bytes);
    return await Database._insertData(
      seat,
      data,
    );
  }

  static Future<Order> getOrder() async {
    String data = utf8.decode(
      base64.decode(
        (await Database._getData(seatNumber)).split('"').join(""),
      ),
    );

    List serializedData = jsonDecode(data);

    List<Product> orderItems = [];

    for (var i = 0; i < serializedData.length; i++) {
      orderItems.add(
        new Product(
          name: serializedData[i]["name"],
          price: serializedData[i]["price"],
          image: serializedData[i]["image"],
          quantity: serializedData[i]["quantity"],
          type: serializedData[i]["type"],
        ),
      );
    }
    return Order.fromJSON(orderItems);
  }
}

// // SEND A SAMPLE REQUEST IN THE BROWSER WINDOW USING THE COMMAND
//   $.ajax({
//   "url": "https://demo.phpmyadmin.net/master-config/index.php?route=/import",
//   "type": "post",
//    "data": {"db":"sys","token":["4e252b673b4554427c782f2e6d352551","4e252b673b4554427c782f2e6d352551"],"is_js_confirmed":"0","pos":"0","goto":"index.php?route=/database/sql","message_to_show":"Your+SQL+query+has+been+executed+successfully.","prev_sql_query":"","sql_query":"SHOW DATABASES","sql_delimiter":";","fk_checks":["0","1"],"SQL":["Go","Go"],"ajax_request":"true","ajax_page_request":"true","_nocache":"1575645354906298857"},
// "success": function(result){
//  console.log(result)
//  }
// })
