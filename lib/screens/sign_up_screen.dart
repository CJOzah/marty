import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/sign_in_screen.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen.id';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? name;
  String? email;
  String? password;
  bool? isLoading = false;

  void signUp() async {
    FirebaseFirestore details = FirebaseFirestore.instance;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      print("User Created");

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      print("user's Name stored");

      //create new doc and stores user id in it
      details.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "recent_products": "",
      });
      print("User details Stored");

      showInSnackBar("Sign Up Successful", context);
      Navigator.pushNamed(context, SignInScreen.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
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
        progressIndicator: CircularProgressIndicator(
          color: primary,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: SizeConfig.sH! * 110,
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
                      top: SizeConfig.sH! * 36,
                      left: SizeConfig.sW! * 5,
                      right: SizeConfig.sW! * 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
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
                        onchanged: (value) {
                          setState(() {
                            name = value;
                            print(name);
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        text: "Your Name",
                        icon: Icons.person_outline,
                        obscure: false,
                      ),
                      SizedBox(
                        height: SizeConfig.sH! * 2.5,
                      ),
                      PlainTextField(
                        onchanged: (value) {
                          setState(() {
                            email = value;
                            print(email);
                          });
                        },
                        keyboardType: TextInputType.text,
                        text: "Your E-mail",
                        icon: Icons.mail_outline,
                        obscure: false,
                      ),
                      SizedBox(
                        height: SizeConfig.sH! * 2.5,
                      ),
                      PlainTextField(
                        onchanged: (value) {
                          setState(() {
                            password = value;
                            print(password);
                          });
                        },
                        keyboardType: TextInputType.text,
                        text: "Your Password",
                        icon: Icons.lock_outlined,
                        obscure: true,
                      ),
                      SizedBox(
                        height: SizeConfig.sH! * 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 3,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, SignInScreen.id),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: SizeConfig.sH! * 3.5,
                                  color: Color(0xffB541C6)),
                            ),
                          ),
                        ],
                      ),
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
                            setState(() {
                              isLoading = true;
                              signUp();
                            });
                          },
                          child: Center(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  fontSize: SizeConfig.sW! * 5,
                                  color: Colors.white),
                            ),
                          ),
                        ),
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
