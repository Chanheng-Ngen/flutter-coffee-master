import 'package:http/http.dart' as http;
import 'datamdel.dart';
import 'dart:convert';

class Datamanager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  fetchMenu() async {
    try{
      const url = 'https://firtman.github.io/coffeemasters/api/menu.json';
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        _menu = [];
        var decoded = jsonDecode(response.body) as List<dynamic>;
        for( var json in decoded){
        _menu?.add(Category.fromJson(json));
        }
      }
    }catch(e){
      throw ('Error fetching menu: $e');
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  cardAdd(Product product) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == product.id) {
        item.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      cart.add(ItemInCart(product: product, quantity: 1));
    }
  }

  cardDelete(Product product) {
    cart.removeWhere((item) => item.product.id == product.id);
  }

  cartClear() {
    cart.clear();
  }

  double totalCartPrice() {
    double total = 0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
