import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/size_config.dart';
import 'package:shopplift/transfer_success_dialogue.dart';

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
    SizeConfig().init(context);
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
              left: SizeConfig.sW! * 3,
              right: SizeConfig.sW! * 3,
              top: SizeConfig.sH! * 1,
              bottom: SizeConfig.sH! * 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.sW! * 1,
                    top: SizeConfig.sH! * 3,
                    bottom: SizeConfig.sW! * 3,
                  ),
                  child: Text(
                    "Payment Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.sH! * 5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.sW! * 1,
                    bottom: SizeConfig.sH! * 1,
                  ),
                  child: Text(
                    "Complete your purchase by providing your payment details",
                    style: TextStyle(
                      fontSize: SizeConfig.sH! * 3,
                    ),
                  ),
                ),
                HeadlineText(
                  w: w,
                  text: "Email Address",
                ),
                RoundedRectTextField(
                  height: SizeConfig.sH!,
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
                      width: SizeConfig.sW! * 30,
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
                      width: SizeConfig.sW! * 30,
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
                          padding: EdgeInsets.only(
                            left: SizeConfig.sH! * 1,
                            top: SizeConfig.sH! * 3,
                          ),
                          child: Text(
                            "Subtotal",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 3.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.sH! * 3),
                          child: Text(
                            "₦${Provider.of<CartData>(context).getTotal()}",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sH! * 1,
                              top: SizeConfig.sH! * 3),
                          child: Text(
                            "VAT(5%)",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 3.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeConfig.sH! * 3,
                          ),
                          child: Text(
                            "₦${Provider.of<CartData>(context).getTotal() * 0.05}",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sH! * 1,
                              top: SizeConfig.sH! * 3,
                              bottom: h / 40),
                          child: Text(
                            "Total",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SizeConfig.sH! * 3,
                            bottom: SizeConfig.sH! * 5,
                          ),
                          child: Text(
                            "₦$total",
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 3.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  height: SizeConfig.sH! * 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h / 30),
                  ),
                  minWidth: w,
                  color: Colors.blue.shade900,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferSuccessDialogue(),
                        ));
                  },
                  child: Text(
                    "Pay ₦$total",
                    style: TextStyle(
                        fontSize: SizeConfig.sW! * 4, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.sW! * 1,
                    right: SizeConfig.sW! * 1,
                    top: SizeConfig.sH! * 4,
                    bottom: SizeConfig.sW! * 4,
                  ),
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
