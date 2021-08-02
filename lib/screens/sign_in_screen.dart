import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopplift/home.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/sign_up_screen.dart';
import 'package:shopplift/utils/clothes.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'SignInScreen.id';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool? isLoading = false;
  String? email;
  String? password;
  List<ClothesModel>? _cart = [];
  UserCredential? user;

  //fuction that sign the user in if the user is logged out
  void signIn({Function(String)? callback}) async {
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      print("user Logged in");

      // showInSnackBar("Sign Ip Successful", context);

      //saves cart to database
      saveCart();
      print("Cart items saved to db");

      // Navigator.popAndPushNamed(context, FancyDraw.id);
    } on FirebaseAuthException catch (e) {
      if (e.code.isNotEmpty) {
        print(e.code);
        // showInSnackBar("${e.code}", context);
        callback!(e.code);
      }
    } catch (e) {
      print(e);
      // showInSnackBar("${e.toString()}", context);
      callback!(e.toString());
    }
  }

  //this function saves the cart to the firebase after user has logged in
  Future<void> saveCart() async {
    // _cart = Provider.of<CartData>(context, listen: false).getCartItems();

    var save = FirebaseFirestore.instance;

    var cartID = save.collection("cart").doc();

    for (ClothesModel cartItem in _cart!) {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc("$cartID")
          .set(cartItem.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading!,
        dismissible: true,
        color: primary,
        progressIndicator: CircularProgressIndicator(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: SizeConfig.sH! * 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bubbleScreenWhite.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.sH! * 35,
                      left: SizeConfig.sW! * 5,
                      right: SizeConfig.sW! * 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello!",
                        style: TextStyle(
                          fontSize: SizeConfig.sH! * 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.sH! * 2,
                      ),
                      Text(
                        "Good to see you again!",
                        style: TextStyle(
                          fontSize: SizeConfig.sH! * 2.5,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.sH! * 2,
                      ),
                      PlainTextField(
                        keyboardType: TextInputType.emailAddress,
                        text: "Email",
                        obscure: false,
                        icon: Icons.person_outline,
                        onchanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.sH! * 3,
                      ),
                      PlainTextField(
                        keyboardType: TextInputType.text,
                        text: "Password",
                        obscure: true,
                        icon: Icons.lock_outline,
                        onchanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.sH! * 4,
                      ),
                      Center(
                          child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(fontSize: SizeConfig.sH! * 3),
                              ))),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.sH! * 5,
                            bottom: SizeConfig.sH! * 5),
                        height: SizeConfig.sH! * 7,
                        width: SizeConfig.sW! * 100,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.sH! * 20),
                          gradient: LinearGradient(
                            colors: [
                              primary,
                              secondary,
                            ],
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .authStateChanges()
                                .listen((User? user) {
                              if (user == null) {
                                signIn(callback: (String text) {
                                  if (text.isNotEmpty)
                                    setState(() {
                                      isLoading = false;
                                    });
                                });
                              } else {
                                print("User logged in");
                                showInSnackBar(
                                    "User Already Logged in", context);
                                Navigator.pushNamed(context, FancyDraw.id);
                              }
                            });
                          },
                          child: Center(
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                  fontSize: SizeConfig.sW! * 5,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Terms & Privacy Policy",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 2.5,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, SignUpScreen.id),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: SizeConfig.sH! * 3,
                                  color: Color(0xffB541C6)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
