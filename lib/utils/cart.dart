import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopplift/utils/clothes.dart';

class CartData extends ChangeNotifier {
  int _total = 0;

  List<ClothesModel> _cart = [];
  List<QueryDocumentSnapshot<Object?>> _fav = [];
  List<bool>? _favbutton = [];

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    var get = FirebaseFirestore.instance;

    return await get.collection("all_products").get();
  }

  void fillFavbutton() async {
    var get;
    try {
      get = await FirebaseFirestore.instance.collection("all_products").get();
    } catch (e) {
      print(e);
    }

    get.docs.forEach((element) {
      _favbutton!.add(false);
    });
  }

  List<bool>? getFavbutton() {
    fillFavbutton();
    print(_favbutton);
    return _favbutton;
  }

  void addToCart(
      QueryDocumentSnapshot<Object?> clothes, int quantity, String size) {
    ClothesModel cart =
        ClothesModel(cartDetails: clothes, quantity: quantity, size: size);
    //increases the quantity of product if it's already in the cart
    //otherwise add a new product to the cart
    if (_cart.isNotEmpty) {
      for (int i = 0; i < _cart.length; i++) {
        // _cart.forEach((element) {
        if (_cart[i].cartDetails!["id"] == clothes.id &&
            _cart[i].size == size) {
          _cart[i].quantity = _cart[i].quantity! + 1;
          break;
        } else if (_cart[i].cartDetails!["id"] == clothes.id &&
            _cart[i].size != size) {
          _cart.add(cart);
          print(_cart[i].cartDetails!["name"]);
          break;
        }
        // });
      }
    } else {
      _cart.add(cart);
      print(_cart.length);
    }
    notifyListeners();
  }

  void removeFromCart(QueryDocumentSnapshot<Object?> clothes) {
    int? index;
    _cart.forEach((element) {
      if (element.cartDetails!["id"] == clothes.id)
        index = _cart.indexOf(element);
    });
    _cart.removeAt(index!);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void addToFav(QueryDocumentSnapshot<Object?> clothes) {
    _fav.add(clothes);
    notifyListeners();
  }

  void removeFromFav(QueryDocumentSnapshot<Object?> clothes) {
    int? index;
    _fav.forEach((element) {
      if (element.id == clothes.id) index = _fav.indexOf(element);
    });
    _fav.removeAt(index!);
    notifyListeners();
  }

  List<ClothesModel> getCartItems() {
    return _cart;
  }

  List<QueryDocumentSnapshot<Object?>> getFavItems() {
    return _fav;
  }

  void addToTotal(int tot) {
    _total += tot;
  }

  void clearTotal() {
    _total = 0;
    notifyListeners();
  }

  int getTotal() {
    return _total;
  }
}
