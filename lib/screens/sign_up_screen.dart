import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen.id';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      keyboardType: TextInputType.emailAddress,
                      text: "Your Name",
                      icon: Icons.person_outline,
                      obscure: false,
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 2.5,
                    ),
                    PlainTextField(
                      keyboardType: TextInputType.text,
                      text: "Your E-mail",
                      icon: Icons.mail_outline,
                      obscure: false,
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 2.5,
                    ),
                    PlainTextField(
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
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: SizeConfig.sH! * 3.5,
                              color: Color(0xffB541C6)),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.sH! * 5, bottom: SizeConfig.sH! * 5),
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
                        onPressed: () {},
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
