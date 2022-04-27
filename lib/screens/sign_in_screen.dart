import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/home.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/sign_up_screen.dart';
import 'package:shopplift/utils/cart.dart';
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
  UserCredential? user;
  Stream<DocumentSnapshot<Map<String, dynamic>>>? cart;

  //fuction that sign the user in if the user is logged out
  void signIn({Function(String?)? callback}) async {
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      print("user Logged in");

      cart = FirebaseFirestore.instance
          .collection("cart")
          .doc(user!.user!.uid)
          .snapshots();

      Provider.of<CartData>(context, listen: false).setCart(cart!);

      showInSnackBar("Sign In Successful", context);

      print("Cart items saved to db");
      callback!("logged in");
    } on FirebaseAuthException catch (e) {
      if (e.code.isNotEmpty) {
        print(e.code);
        showInSnackBar("${e.code}", context);
        callback!("failed");
      }
    } catch (e) {
      print(e);
      showInSnackBar("${e.toString()}", context);
      callback!("failed");
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
                    top: SizeConfig.sH! * 3,
                    left: SizeConfig.sW! * 2,
                  ),
                  height: SizeConfig.sW! * 12,
                  width: SizeConfig.sW! * 12,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.sH! * 5))),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: SizeConfig.sW! * 8,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.sH! * 18,
                      left: SizeConfig.sW! * 5,
                      right: SizeConfig.sW! * 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: SizeConfig.sH! * 20,
                          width: SizeConfig.sH! * 20,
                          child: Image.asset("images/MAIN GRADIENT.png")),
                      Text(
                        "Good to see you again!",
                        style: TextStyle(
                          fontSize: SizeConfig.sW! * 5,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.sW! * 2,
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
                        height: SizeConfig.sW! * 5,
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
                                style: TextStyle(fontSize: SizeConfig.sW! * 5),
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
                                setState(() {
                                  isLoading = true;
                                });
                                signIn(callback: (String? text) {
                                  if (text == "logged in") {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        FancyDraw.id, (route) => false);
                                  } else if (text == "failed") {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                });
                              } else if (user.uid.isNotEmpty) {
                                print("User logged in");
                                setState(() {
                                  isLoading = false;
                                });
                                showInSnackBar("User Logged in", context);
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
                              fontSize: SizeConfig.sW! * 5,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, SignUpScreen.id),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: SizeConfig.sW! * 5.5,
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
