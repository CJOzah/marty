import 'package:flutter/material.dart';
import 'package:shopplift/size_config.dart';
import 'package:shopplift/welcome_screen.dart';

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
