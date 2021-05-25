import 'package:flutter/material.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'SignInScreen.id';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 3,
                    ),
                    PlainTextField(
                      keyboardType: TextInputType.text,
                      text: "Password",
                      obscure: true,
                      icon: Icons.lock_outline,
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
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: SizeConfig.sH! * 3,
                              color: Color(0xffB541C6)),
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
    );
  }
}
