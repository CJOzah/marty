import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'clothes.dart';

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

  void addToCart(ClothesModel clothes) {
    _cart.add(clothes);
    notifyListeners();
  }

  void removeFromCart(ClothesModel clothes) {
    _cart.remove(clothes);
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
    _fav.forEach((element) {
      if (element.id == clothes.id) _fav.remove(clothes);
    });
    notifyListeners();
  }

  List<ClothesModel> getCartItems() {
    return _cart;
  }

  ClothesModel getCartItem(int index) {
    return _cart[index];
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

  void increaseTotal(int tot) {
    _total += tot;
  }

  void decreaseTotal(int tot) {
    _total -= tot;
  }

  void removeFromTotal(int tot, int index) {
    _total -= tot * _cart[index].quantity!;
  }

  int getTotal() {
    return _total;
  }
}
