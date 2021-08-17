import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopplift/utils/clothes.dart';

class CartData extends ChangeNotifier {
  int _total = 0;
  Map<String, dynamic>? item;

  List<ClothesModel> _cart = [];
  List<QueryDocumentSnapshot<Object?>> _fav = [];
  List<bool>? _favbutton = [];

  // factory _cart.fromJson(Map<String, dynamic> json) {
  //   return _cart(
  //     name: json['name'],
  //     singlePrice: json['singlePrice'],
  //     quantity: json['quantity'],
  //   );
  // }

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
          FirebaseAuth.instance.authStateChanges().listen((User? user) async {
            if (user == null) {
              print("User not logged in");
            } else {
              print("User logged in");

              item = _cart[i].toJson();
              QuerySnapshot query = await FirebaseFirestore.instance
                  .collection('cart')
                  .doc("cartItems")
                  .collection("${user.uid}")
                  .where("name", isEqualTo: clothes.id)
                  .where("size", isEqualTo: size)
                  .get();

              print("gotten product from db");
              print(query.docs);
              QueryDocumentSnapshot doc = query.docs[0];
              DocumentReference docRef = doc.reference;

              await FirebaseFirestore.instance
                  .collection('cart')
                  .doc("cartItems")
                  .collection("${user.uid}")
                  .doc("${docRef.id}")
                  .set({
                "itemId": docRef.id,
                "details": item!,
              });
              print("added to db");
            }
          });
          break;
        }
      }

      if (add) {
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
          if (user == null) {
            print("User not logged in");
          } else {
            print("User logged in");
            item = cart.toJson();
            var id = FirebaseFirestore.instance
                .collection('cart')
                .doc("cartItems")
                .collection("${user.uid}")
                .doc()
                .id;

            await FirebaseFirestore.instance
                .collection('cart')
                .doc("cartItems")
                .collection("${user.uid}")
                .doc("$id")
                .set({
              "itemId": id,
              "details": item!,
            });
            print("added to db");
          }
        });

        _cart.add(cart);
      }
    } else {
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user == null) {
          print("User not logged in");
        } else {
          print("User logged in");
          item = cart.toJson();
          var id = FirebaseFirestore.instance
              .collection('cart')
              .doc("cartItems")
              .collection("${user.uid}")
              .doc()
              .id;

          await FirebaseFirestore.instance
              .collection('cart')
              .doc("cartItems")
              .collection("${user.uid}")
              .doc("$id")
              .set({
            "itemId": id,
            "details": item!,
          });
          print("added to db");
        }
      });

      _cart.add(cart);
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
}

// //this function saves the cart to the firebase after user has logged in
// Future<void> saveCart(BuildContext context) async {
//   List<ClothesModel> _cart = [];

//   _cart = Provider.of<CartData>(context, listen: false).getCartItems();

//   var save = FirebaseFirestore.instance;

//   var cartID = save.collection("cart").doc();

//     await FirebaseFirestore.instance
//         .collection('cart')
//         .doc("$cartID")
//         .set(cartItem.toJson());

// }
