import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/screens/cart_category/cart_screen.dart';
import 'package:shopplift/screens/fav_screen.dart';
import 'package:shopplift/screens/profile_screen/details_screen.dart';
import 'package:shopplift/screens/profile_screen/profile_screen.dart';
import 'package:shopplift/screens/sign_in_screen.dart';
import 'package:shopplift/utils/clothes.dart';
import 'package:shopplift/utils/size_config.dart';

import '../home.dart';
import '../main.dart';
import 'cart.dart';

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
    duration: Duration(seconds: 1),
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

Future<void> showSizeSheet(
    BuildContext context,
    QueryDocumentSnapshot<Object?>? widget,
    StateSetter setState,
    List<int> quanty) {
  List<int> quantity = List<int>.filled(5, 0, growable: true);
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      print(quantity);
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
        return Wrap(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.sW! * 6,
                  right: SizeConfig.sW! * 6,
                  bottom: SizeConfig.sH! * 4),
              padding: EdgeInsets.all(SizeConfig.sH! * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(SizeConfig.sH! * 2),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: SizeConfig.sW! * 4),
                              child: Text(
                                "Select Options",
                                style: TextStyle(
                                  fontSize: SizeConfig.sH! * 3,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.times,
                                size: SizeConfig.sH! * 4,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.sH! * 2,
                        ),
                        ListView.builder(
                            itemCount: widget!["size"].length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final item = widget["size"];
                              final items = widget;
                              final cartItems =
                                  Provider.of<CartData>(context, listen: false)
                                      .getCartItems();

                              //checks the cart for products already in it and fill the sizes with it's
                              //quantity already added
                              for (int i = 0; i < cartItems.length; i++) {
                                if (cartItems[i].cartDetails!["id"] ==
                                    items["id"]) {
                                  int dex = 0;
                                  item.forEach((element) {
                                    if (cartItems[i].size != element) dex++;
                                    if (cartItems[i].size == element) {
                                      quantity[dex] = cartItems[i].quantity!;
                                    }
                                  });
                                }
                              }
                              return Container(
                                height: SizeConfig.sH! * 10,
                                width: double.infinity,
                                child: ListTile(
                                  title: Text(
                                    "${item![index]}",
                                    style: TextStyle(
                                        fontSize: SizeConfig.sH! * 3,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.sH! * 1,
                                        bottom: SizeConfig.sH! * 2),
                                    child: Text(
                                      "₦ ${widget["price"]}",
                                      style: TextStyle(
                                          fontSize: SizeConfig.sH! * 2.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Container(
                                    height: SizeConfig.sH! * 6,
                                    width: SizeConfig.sW! * 34,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              height: SizeConfig.sH! * 6,
                                              width: SizeConfig.sH! * 6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        SizeConfig.sH! * 1),
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                    primary,
                                                    secondary,
                                                  ],
                                                ),
                                                color: primary,
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    setModalState(() {
                                                      if (quantity[index] > 0) {
                                                        quantity[index]--;
                                                        Provider.of<CartData>(
                                                                context,
                                                                listen: false)
                                                            .removeFromCart(
                                                                items);
                                                        setModalState(() {
                                                          showInSnackBar(
                                                              "${items["name"]} Removed to Cart",
                                                              context);
                                                        });
                                                        print(Provider.of<
                                                                    CartData>(
                                                                context,
                                                                listen: false)
                                                            .getCartItems()
                                                            .length);
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(
                                                    FontAwesomeIcons.minus,
                                                    color: Colors.white,
                                                    size: SizeConfig.sH! * 3,
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: SizeConfig.sH! * 6,
                                              width: SizeConfig.sH! * 6,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Center(
                                                child: Text(
                                                  "${quantity[index]}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        SizeConfig.sH! * 3,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: SizeConfig.sH! * 6,
                                              width: SizeConfig.sH! * 6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        SizeConfig.sH! * 1),
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                    primary,
                                                    secondary,
                                                  ],
                                                ),
                                                color: primary,
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    setModalState(() {
                                                      quantity[index]++;
                                                      Provider.of<CartData>(
                                                              context,
                                                              listen: false)
                                                          .addToCart(
                                                              items,
                                                              quantity[index]
                                                                  .toInt(),
                                                              items["size"]
                                                                  [index]);
                                                      showInSnackBar(
                                                          "${items["name"]} Added to Cart",
                                                          context);
                                                      print(
                                                          Provider.of<CartData>(
                                                                  context,
                                                                  listen: false)
                                                              .getCartItems()
                                                              .length);
                                                    });
                                                  },
                                                  icon: Icon(
                                                    FontAwesomeIcons.plus,
                                                    color: Colors.white,
                                                    size: SizeConfig.sH! * 3,
                                                  ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                        GradientButton(
                            text: "VIEW CART",
                            ontap: () {
                              setModalState(() {
                                Navigator.popAndPushNamed(
                                    context, CartScreen.id);
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      });
    },
  );
}

class CatCard extends StatelessWidget {
  const CatCard(
      {Key? key,
      required this.height,
      required this.icon,
      required this.onpressed,
      required this.text})
      : super(key: key);

  final double height;
  final IconData icon;
  final String text;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed as void Function()?,
      child: Container(
        height: SizeConfig.sH! * 11,
        width: SizeConfig.sW! * 21.8,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(
            SizeConfig.sH! * 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: SizeConfig.sH! * 5.5,
              color: Colors.black,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.sH! * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondLayer extends StatefulWidget {
  @override
  SecondLayerState createState() => SecondLayerState();
}

late SecondLayerState secondLayerState;

class SecondLayerState extends State<SecondLayer> {
  // SecondLayerState secondLayerState;
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 550),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple.shade900.withOpacity(0.9)),
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ));
  }
}

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    Key? key,
    required this.height,
    required this.width,
    required this.text1,
    required this.text2,
    required this.textColor,
    this.backgroundColor,
    this.imagePath,
    this.text2Color,
    this.text3Color,
  }) : super(key: key);

  final double height;
  final double width;
  final String text1;
  final String text2;
  final Color? text2Color;
  final Color? text3Color;
  final Color textColor;
  final Color? backgroundColor;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: SizeConfig.sH!,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.sH! * 3,
                left: SizeConfig.sW! * 3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      text1,
                      style: TextStyle(
                        color: text2Color,
                        fontSize: SizeConfig.sH! * 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.sH! * 2,
                        bottom: SizeConfig.sH! * 2,
                      ),
                      child: Text(
                        text2,
                        style: TextStyle(
                          color: text3Color,
                          fontSize: SizeConfig.sH! * 2,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      child: Text(
                        "Discover Collection ->",
                        style: TextStyle(
                            fontSize: SizeConfig.sH! * 2.8,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: SizeConfig.sH! * 1),
              height: SizeConfig.sH! * 15,
              width: SizeConfig.sW! * 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath!), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstLayer extends StatefulWidget {
  @override
  _FirstLayerState createState() => _FirstLayerState();
}

class _FirstLayerState extends State<FirstLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.blue.shade900),
    );
  }
}

class ThirdLayer extends StatefulWidget {
  @override
  _ThirdLayerState createState() => _ThirdLayerState();
}

class _ThirdLayerState extends State<ThirdLayer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/BubbleDesign.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.sW! * 4, top: SizeConfig.sH! * 15),
                child: Text(
                  "Marty",
                  style: TextStyle(
                    fontSize: SizeConfig.sH! * 4,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.sH! * 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuListTile(
                      leading: Icons.home_outlined,
                      title: "Home",
                      ontap: FancyDraw.id,
                    ),
                    MenuListTile(
                      leading: Icons.shopping_cart_outlined,
                      title: "Cart",
                      ontap: CartScreen.id,
                    ),
                    MenuListTile(
                      leading: Icons.person_outline,
                      title: "Profile",
                      ontap: ProfileScreen.id,
                    ),
                    MenuListTile(
                      leading: FontAwesomeIcons.heartbeat,
                      title: "Wishlist",
                      ontap: FavScreen.id,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.sH! * 25),
                child: MenuListTile(
                  leading: Icons.logout,
                  title: "Log In",
                  ontap: SignInScreen.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
