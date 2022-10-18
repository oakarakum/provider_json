import 'package:flutter/widgets.dart';

class Item with ChangeNotifier {
  //get-set örneği
  int _cartCount;

  Item(this._cartCount);
  int get cartCounts => _cartCount;

  set cartCount(int value) {
    _cartCount = value;
  }

  String get price => "${getPrice().toString()} ₺";

  int getPrice() {
    int price = 0;
    for (var i = 0; i < basket!.length; i++) {
      price += int.parse(basket![i]["price"].toString());
    }
    return price;
  }

  List? basket = [];

  void addBasket(Object value) {
    basket!.add(value);
    //print(basket.toString()); sepet değerlerini terminalden görmek için
    notifyListeners();
  }

  void removeBasket(int index) {
    basket!.removeAt(index);
    notifyListeners();
  }

  List? productList = [
    {
      "image": "https://m.media-amazon.com/images/I/31irWzsdLsL.jpg",
      "title": "Iphone 14",
      "color": "Black",
      "price": 53
    },
    {
      "image":
          "https://s13emagst.akamaized.net/products/42716/42715101/images/res_893022eddb630abe930320d9f329db2b.jpg",
      "title": "Huawei P50 Pro",
      "color": "Golden",
      "price": 23
    },
    {
      "image":
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT5S8w-8YbHdcAHlI5b4lr4Ek_JPNnVVLzUP07HS9V-0jvakOK3BkQGEH97EcD222zt-Nqcpaf5_kvnnluPmmjx6lhH-i24QawUf54cMLxElAMQ7CxvUQNO&usqp=CAE",
      "title": "OPPO Reno 7",
      "color": "Orange",
      "price": 10
    }
  ];

  void increase() {
    _cartCount++;
    notifyListeners();
  }

  void decrease() {
    _cartCount--;
    notifyListeners();
  }

  void reset() {
    _cartCount = 0;
    notifyListeners();
  }
}
