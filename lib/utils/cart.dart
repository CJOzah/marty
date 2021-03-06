import 'package:flutter/material.dart';

import 'clothes.dart';

class CartData extends ChangeNotifier {
  int _total = 0;

  List<ClothesModel> _cart = [];
  List<ClothesModel> _fav = [];

  void addToCart(ClothesModel clothes) {
    _cart.add(clothes);
    notifyListeners();
  }
  // void addToCartWithSize(ClothesModel clothes, String size) {
  //   _cart.add(clothes);
  //   notifyListeners();
  // }

  void removeFromCart(ClothesModel clothes) {
    _cart.remove(clothes);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void addToFav(ClothesModel clothes) {
    _fav.add(clothes);
    notifyListeners();
  }

  void removeFromFav(ClothesModel clothes) {
    _fav.remove(clothes);
    notifyListeners();
  }

  List<ClothesModel> getCartItems() {
    return _cart;
  }

  ClothesModel getCartItem(int index) {
    return _cart[index];
  }

  List<ClothesModel> getFavItems() {
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
