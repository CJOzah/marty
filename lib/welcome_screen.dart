import 'package:flutter/material.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/size_config.dart';
import 'package:shopplift/utils.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen.id';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BubbleDesign(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello!",
              style: TextStyle(
                fontSize: SizeConfig.sH! * 5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Good to see you again!",
              style: TextStyle(
                fontSize: SizeConfig.sH! * 2.5,
                color: Colors.grey,
              ),
            ),
            PlainTextField(
              keyboardType: TextInputType.emailAddress,
              text: "Email",
              obscure: false,
            ),
            PlainTextField(
              keyboardType: TextInputType.text,
              text: "Password",
              obscure: true,
            ),
            SizedBox(
              height: SizeConfig.sH! * 2,
            ),
            Center(
                child: InkWell(onTap: () {}, child: Text("Forgot Password?"))),
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.sH! * 2, bottom: SizeConfig.sH! * 2),
              height: SizeConfig.sH! * 7,
              width: SizeConfig.sW! * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.sH! * 20),
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
                        fontSize: SizeConfig.sW! * 5, color: Colors.white),
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
                    fontSize: SizeConfig.sH! * 2,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: SizeConfig.sH! * 3, color: Color(0xffB541C6)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlainTextField extends StatelessWidget {
  final String? text;
  final Function? onchanged;
  final bool? obscure;
  final TextInputType? keyboardType;
  const PlainTextField({
    Key? key,
    this.text,
    this.obscure,
    this.onchanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: TextStyle(
            fontSize: SizeConfig.sH! * 2.5,
            color: Colors.grey,
          ),
        ),
        TextFormField(
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.sH! * 2.7,
          ),
          cursorHeight: SizeConfig.sH! * 3,
          cursorColor: primary,
          keyboardType: keyboardType,
          obscureText: obscure!,
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class BubbleDesign extends StatelessWidget {
  final Widget? widget;

  const BubbleDesign({
    Key? key,
    @required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: SizeConfig.sH! * 32,
                width: SizeConfig.sW! * 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xff2B18A3),
                      Color(0xffF353D5),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.all(
                              Radius.circular(SizeConfig.sH! * 35),
                            ),
                            heigth: SizeConfig.sH! * 30,
                            width: SizeConfig.sH! * 30,
                            innerColor: Color(0xffECC6FC),
                            outerColor: Color(0xffC35ECF),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / 13, SizeConfig.sH! / -22),
                    ),
                    FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.circular(SizeConfig.sH! * 30),
                            heigth: SizeConfig.sH! * 12,
                            width: SizeConfig.sH! * 12,
                            innerColor: Color(0xffF0CDFE),
                            outerColor: Color(0xffB770D1),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / 190, SizeConfig.sH! / -50),
                    ),
                    FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.all(
                              Radius.circular(SizeConfig.sH! * 35),
                            ),
                            heigth: SizeConfig.sH! * 27,
                            width: SizeConfig.sH! * 27,
                            innerColor: Color(0xffBA95F2),
                            outerColor: Color(0xff7547BC),
                          ),
                        ),
                      ),
                      translation: Offset(SizeConfig.sW! / -8, -0.26),
                    ),
                    FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.circular(SizeConfig.sH! * 30),
                            heigth: SizeConfig.sH! * 17,
                            width: SizeConfig.sH! * 17,
                            innerColor: Color(0xffEBC8FD),
                            outerColor: Color(0xffB770D1),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / 11.5, SizeConfig.sH! / 16),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.sW! * 8,
                    right: SizeConfig.sW! * 8,
                    top: SizeConfig.sH! * 4),
                height: SizeConfig.sH! * 71,
                width: SizeConfig.sW! * 100,
                color: Colors.white,
                child: widget,
              ),
            ],
          ),
          FractionalTranslation(
            child: Transform.rotate(
              angle: 0,
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
                child: Bubbles(
                  radius: BorderRadius.circular(SizeConfig.sH! * 30),
                  heigth: SizeConfig.sH! * 11,
                  width: SizeConfig.sH! * 11,
                  innerColor: Color(0xffBA97F5),
                  outerColor: Color(0xff774EBD),
                ),
              ),
            ),
            translation: Offset(SizeConfig.sW! / -11, SizeConfig.sH! / 3.4),
          ),
        ],
      ),
    );
  }
}

class Bubbles extends StatelessWidget {
  final double? heigth;
  final double? width;
  final Color? innerColor;
  final Color? outerColor;
  final BorderRadius? radius;

  const Bubbles({
    Key? key,
    this.heigth,
    this.width,
    this.innerColor,
    this.outerColor,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: heigth!,
        width: width!,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.4,
            colors: [
              innerColor!,
              outerColor!,
            ],
          ),
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 25,
              offset: Offset(5, 10),
            ),
          ],
        ),
      ),
    );
  }
}
