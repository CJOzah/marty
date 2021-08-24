import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopplift/utils/clothes.dart';

class CartData extends ChangeNotifier {
  int _total = 0;
  Map<int, ClothesModel>? item;
  List<ClothesModel> _cart = [];
  List<Map<String, dynamic>> ct = [];
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

  Future<void> addToCart(
      QueryDocumentSnapshot<Object?> clothes, int quantity, String size) async {
    ClothesModel cart =
        ClothesModel(cartDetails: clothes, quantity: quantity, size: size);
    bool add = false;
    //increases the quantity of product if it's already in the cart
    //otherwise add a new product to the cart
    if (_cart.isNotEmpty) {
      for (int i = 0; i < _cart.length; i++) {
        if (_cart[i].cartDetails!["id"] == clothes.id &&
            _cart[i].size != size) {
          add = true;

          print(_cart[i].cartDetails!["name"]);
        } else
          add = false;

        //add another product with a different id to the cart
        if (_cart[i].cartDetails!["id"] != clothes.id) {
          add = true;
          print(_cart[i].cartDetails!["name"]);
        }

        if (_cart[i].cartDetails!["id"] == clothes.id &&
            _cart[i].size == size) {
          _cart[i].quantity = _cart[i].quantity! + 1;
          ct[i]["quantity"] = ct[i]["quantity"] + 1;

          //updates the cart in the database
          addCartToDb(ct);
          break;
        }
      }

      if (add) {
        //updates the cart in the database
        addCartToDb(ct);

        _cart.add(cart);
        ct.add(cart.toJson());
        print(ct);
      }
    } else {
      //updates the cart in the database
      addCartToDb(ct);

      _cart.add(cart);
      ct.add(cart.toJson());
      print(ct);
    }
    notifyListeners();
  }

  void removeFromCart(QueryDocumentSnapshot<Object?> clothes, String size) {
    if (_cart.isNotEmpty) {
      for (int i = 0; i < _cart.length; i++) {
        if (_cart[i].cartDetails!["id"] == clothes.id &&
            _cart[i].size == size) {
          //reduces the product quantity by 1
          _cart[i].quantity = _cart[i].quantity! - 1;
          ct[i]["quantity"] = ct[i]["quantity"] - 1;

          if (_cart[i].quantity == 0) {
            _cart.removeAt(i);
            ct.removeAt(i);
          }

          //updates the cart in the database
          addCartToDb(ct);
          break;
        }
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    ct.clear();
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

  void calculateTotal() {
    _total = 0;
    _cart.forEach((element) {
      String price = element.cartDetails!["price"];
      print(element.quantity);
      print(price);
      _total += int.parse(price) * element.quantity!;
    });
  }

  void clearTotal() {
    _total = 0;
    notifyListeners();
  }

  int getTotal() {
    calculateTotal();
    return _total;
  }

  //creates a document in the database and stores the cart items inside
  void addCartToDb(List<Map<String, dynamic>> ct) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print("User not logged in");
      } else {
        print("User logged in");
        await FirebaseFirestore.instance
            .collection('cart')
            .doc("${user.uid}")
            .set({"cartItems": json.encode(ct)});
        print("added to db");
      }
    });
  }
}
