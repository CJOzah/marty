import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class CheckOutScreen extends StatefulWidget {
  static String id = 'CheckOutScreen';
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    double total = Provider.of<CartData>(context).getTotal() * 0.05 +
        Provider.of<CartData>(context).getTotal();
    final s = MediaQuery.of(context).size;
    final h = s.height;
    final w = s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                left: w / 30, right: w / 30, top: h / 60, bottom: h / 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h / 50, bottom: h / 50),
                  child: Text(
                    "Payment Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: w / 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: h / 40),
                  child: Text(
                    "Complete your purchase by providing your payment details",
                    style: TextStyle(
                      fontSize: w / 27,
                    ),
                  ),
                ),
                HeadlineText(
                  w: w,
                  text: "Email Address",
                ),
                RoundedRectTextField(
                  height: h / 18,
                  hintText: "someone@gmail.com",
                  withHint: true,
                  borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                  textInputType: TextInputType.emailAddress,
                  onTap: () {
                    setState(() {
                      if (active == false) {
                        active = true;
                      } else
                        active = false;
                    });
                  },
                  onchanged: (value) {},
                ),
                HeadlineText(
                  w: w,
                  text: "Home Address",
                ),
                RoundedRectTextField(
                  height: h / 18,
                  hintText: "Address",
                  withHint: true,
                  borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                  textInputType: TextInputType.emailAddress,
                  onTap: () {
                    setState(() {
                      if (active == false) {
                        active = true;
                      } else
                        active = false;
                    });
                  },
                  onchanged: (value) {},
                ),
                HeadlineText(
                  w: w,
                  text: "Mobile Number",
                ),
                RoundedRectTextField(
                  height: h / 18,
                  hintText: "Mobile Number",
                  withHint: true,
                  borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                  textInputType: TextInputType.number,
                  onTap: () {
                    setState(() {
                      if (active == false) {
                        active = true;
                      } else
                        active = false;
                    });
                  },
                  onchanged: (value) {},
                ),
                HeadlineText(
                  w: w,
                  text: "Card Details",
                ),
                RoundedRectTextField(
                  height: h / 18,
                  hintText: "Card number",
                  withHint: true,
                  borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                  textInputType: TextInputType.number,
                  onTap: () {
                    setState(() {
                      if (active == false) {
                        active = true;
                      } else
                        active = false;
                    });
                  },
                  onchanged: (value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedRectTextField(
                      height: h / 18,
                      hintText: "MM/DD",
                      width: w / 3,
                      withHint: true,
                      borderColor:
                          (active) ? Colors.blue.shade900 : Colors.grey,
                      textInputType: TextInputType.number,
                      onTap: () {
                        setState(() {
                          if (active == false) {
                            active = true;
                          } else
                            active = false;
                        });
                      },
                      onchanged: (value) {},
                    ),
                    RoundedRectTextField(
                      height: h / 18,
                      hintText: "CVV",
                      width: w / 3,
                      withHint: true,
                      borderColor:
                          (active) ? Colors.blue.shade900 : Colors.grey,
                      textInputType: TextInputType.number,
                      onTap: () {
                        setState(() {
                          if (active == false) {
                            active = true;
                          } else
                            active = false;
                        });
                      },
                      onchanged: (value) {},
                    ),
                  ],
                ),
                HeadlineText(
                  w: w,
                  text: "Card Holder's name",
                ),
                RoundedRectTextField(
                  height: h / 18,
                  hintText: "Card Holder's Name",
                  withHint: true,
                  borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                  textInputType: TextInputType.name,
                  onTap: () {
                    setState(() {
                      if (active == false) {
                        active = true;
                      } else
                        active = false;
                    });
                  },
                  onchanged: (value) {},
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: h / 30),
                          child: Text(
                            "Subtotal",
                            style: TextStyle(
                              fontSize: w / 23,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h / 30),
                          child: Text(
                            "₦${Provider.of<CartData>(context).getTotal()}",
                            style: TextStyle(
                              fontSize: w / 23,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: h / 40),
                          child: Text(
                            "VAT(5%)",
                            style: TextStyle(
                              fontSize: w / 23,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h / 30),
                          child: Text(
                            "₦${Provider.of<CartData>(context).getTotal() * 0.05}",
                            style: TextStyle(
                              fontSize: w / 23,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: h / 40, bottom: h / 40),
                          child: Text(
                            "Total",
                            style: TextStyle(
                              fontSize: w / 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h / 40, bottom: h / 40),
                          child: Text(
                            "₦$total",
                            style: TextStyle(
                              fontSize: w / 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  height: h / 16,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h / 30),
                  ),
                  minWidth: w,
                  color: Colors.blue.shade900,
                  onPressed: () {
                    Navigator.popUntil(context, (route) => true);
                  },
                  child: Text(
                    "Pay ₦$total",
                    style: TextStyle(fontSize: w / 25, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 30, bottom: h / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.lock,
                        color: Colors.grey,
                        size: w / 25,
                      ),
                      SizedBox(
                        width: w / 40,
                      ),
                      Text(
                        "Payments are secure and encrypted",
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

class HeadlineText extends StatelessWidget {
  const HeadlineText({Key? key, required this.w, required this.text})
      : super(key: key);

  final double w;
  final String text;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final h = s.height;
    return Padding(
      padding: EdgeInsets.only(top: h / 50, bottom: h / 50),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: w / 27,
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
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(w / 40),
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid, width: w / 300, color: borderColor!),
          borderRadius: BorderRadius.circular(w / 40),
        ),
        child: TextFormField(
          maxLength: maxLength,
          onTap: onTap as void Function()?,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: w / 30, bottom: h / 90)),
          keyboardType: textInputType,
          cursorColor: Colors.black,
          textAlign: (withHint == true) ? TextAlign.start : TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: w / 22,
          ),
          validator: validator as String? Function(String?)?,
          onChanged: onchanged as void Function(String)?,
          onSaved: onSaved as void Function(String?)?,
        ),
      ),
    );
  }
}
