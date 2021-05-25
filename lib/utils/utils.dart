import 'package:flutter/material.dart';
import 'package:shopplift/screens/cart_category/cart_screen.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/screens/sign_in_screen.dart';

import '../main.dart';

class HorizontalLine extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const HorizontalLine({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}

void showInSnackBar(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: new Text(value),
    backgroundColor: Colors.blue.shade900,
    duration: Duration(seconds: 2),
  ));
}

class HeadlineText extends StatelessWidget {
  const HeadlineText({Key? key, required this.w, required this.text})
      : super(key: key);

  final double w;
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final s = MediaQuery.of(context).size;
    final h = s.height;
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.sH!,
        top: SizeConfig.sH! * 2.2,
        bottom: SizeConfig.sH! * 0.2,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.sH! * 2.8,
        ),
      ),
    );
  }
}

class RoundedRectTextField extends StatelessWidget {
  const RoundedRectTextField({
    Key? key,
    this.width,
    this.onchanged,
    this.hintText,
    this.withHint,
    required this.height,
    this.borderColor,
    this.controller,
    this.onTap,
    this.textInputType,
    this.maxLength,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final double? width;
  final double height;
  final String? hintText;
  final Function? onchanged;
  final bool? withHint;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function? onTap;
  final TextInputType? textInputType;
  final int? maxLength;
  final Function? validator;
  final Function? onSaved;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final h = s.height;
    final w = s.width;
    SizeConfig().init(context);
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.sH! * 4),
      ),
      child: Container(
        height: SizeConfig.sH! * 6,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid,
              width: SizeConfig.sW! * 0.2,
              color: borderColor!),
          borderRadius: BorderRadius.circular(SizeConfig.sH! * 8),
        ),
        child: TextFormField(
          maxLength: maxLength,
          onTap: onTap as void Function()?,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: SizeConfig.sH! * 3.6,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: SizeConfig.sW! * 3, bottom: SizeConfig.sH! * 2.5)),
          keyboardType: textInputType,
          cursorColor: Colors.black,
          textAlign: (withHint == true) ? TextAlign.start : TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.sH! * 4,
          ),
          validator: validator as String? Function(String?)?,
          onChanged: onchanged as void Function(String)?,
          onSaved: onSaved as void Function(String?)?,
        ),
      ),
    );
  }
}

class BubbleDesignFullScreen extends StatelessWidget {
  final Widget? widget;

  const BubbleDesignFullScreen({
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        height: SizeConfig.sH! * 150,
        width: SizeConfig.sW! * 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
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
                      left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
                  child: Bubbles(
                    radius: BorderRadius.all(
                      Radius.circular(SizeConfig.sH! * 35),
                    ),
                    heigth: SizeConfig.sH! * 30,
                    width: SizeConfig.sH! * 30,
                    innerColor: Color(0xffBA95F2),
                    outerColor: Color(0xff7547BC),
                  ),
                ),
              ),
              translation: Offset(SizeConfig.sW! / 13, SizeConfig.sH! / -22),
            ),
            FractionalTranslation(
              child: Transform.rotate(
                angle: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
                  child: Bubbles(
                    radius: BorderRadius.circular(SizeConfig.sH! * 30),
                    heigth: SizeConfig.sH! * 18,
                    width: SizeConfig.sH! * 18,
                    innerColor: Color(0xffBA95F2),
                    outerColor: Color(0xff7547BC),
                  ),
                ),
              ),
              translation: Offset(SizeConfig.sW! / 90, SizeConfig.sH! / -40),
            ),
            FractionalTranslation(
              child: Transform.rotate(
                angle: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
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
                      left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
                  child: Bubbles(
                    radius: BorderRadius.circular(SizeConfig.sH! * 30),
                    heigth: SizeConfig.sH! * 40,
                    width: SizeConfig.sH! * 40,
                    innerColor: Color(0xffEBC8FD),
                    outerColor: Color(0xffB770D1),
                  ),
                ),
              ),
              translation: Offset(SizeConfig.sW! / -11.5, SizeConfig.sH! / 19),
            ),
            FractionalTranslation(
              child: Transform.rotate(
                angle: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
                  child: Bubbles(
                    radius: BorderRadius.all(
                      Radius.circular(SizeConfig.sH! * 35),
                    ),
                    heigth: SizeConfig.sH! * 25,
                    width: SizeConfig.sH! * 25,
                    innerColor: Color(0xffECC6FC),
                    outerColor: Color(0xffC35ECF),
                  ),
                ),
              ),
              translation: Offset(SizeConfig.sW! / 13, SizeConfig.sH! / 16),
            ),
            FractionalTranslation(
              child: Transform.rotate(
                angle: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
                  child: Bubbles(
                    radius: BorderRadius.circular(SizeConfig.sH! * 30),
                    heigth: SizeConfig.sH! * 22,
                    width: SizeConfig.sH! * 22,
                    innerColor: Color(0xffF0CDFE),
                    outerColor: Color(0xffB770D1),
                  ),
                ),
              ),
              translation: Offset(SizeConfig.sW! / 190, SizeConfig.sH! / 40),
            ),
            widget!,
          ],
        ),
      ),
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
                // child: widget,
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

class PlainTextField extends StatelessWidget {
  final String? text;
  final Function? onchanged;
  final bool? obscure;
  final TextInputType? keyboardType;
  final IconData? icon;

  const PlainTextField({
    Key? key,
    this.text,
    this.obscure,
    this.onchanged,
    this.keyboardType,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.sH! * 2.7,
          ),
          cursorHeight: SizeConfig.sH! * 3,
          cursorColor: primary,
          keyboardType: keyboardType,
          obscureText: obscure!,
          decoration: InputDecoration(
            hintText: text!,
            prefixIcon:
                Icon(icon, size: SizeConfig.sH! * 4, color: Colors.black),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class PlainTextFieldWithoutIcon extends StatelessWidget {
  final String? text;
  final Function? onchanged;
  final bool? obscure;
  final TextInputType? keyboardType;

  const PlainTextFieldWithoutIcon({
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
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.sW! * 4, right: SizeConfig.sW! * 4),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.sH! * 2.7,
            ),
            cursorHeight: SizeConfig.sH! * 3,
            cursorColor: primary,
            keyboardType: keyboardType,
            obscureText: obscure!,
            decoration: InputDecoration(
              hintText: text!,
              hintStyle: TextStyle(),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}

class MenuListTile extends StatelessWidget {
  final IconData? leading;
  final String? title;
  final IconData? trailing;
  final String ontap;
  const MenuListTile({
    Key? key,
    this.leading,
    this.title,
    this.trailing,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, ontap),
      leading: Icon(
        leading,
        color: Colors.white,
        size: SizeConfig.sH! * 5,
      ),
      title: Text(
        title!,
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.sH! * 4,
        ),
      ),
      trailing: Icon(trailing, color: primaryDark),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final IconData? leading;
  final String? title;
  final IconData? trailing;
  final String? ontap;
  const ProfileListTile({
    Key? key,
    this.leading,
    this.title,
    this.trailing,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.sH! * 3,
      ),
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, ontap!),
        leading: Icon(
          leading,
          color: primaryDark,
          size: SizeConfig.sH! * 5,
        ),
        title: Text(
          title!,
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.sH! * 3,
          ),
        ),
        trailing: Icon(trailing, color: primaryDark),
      ),
    );
  }
}
