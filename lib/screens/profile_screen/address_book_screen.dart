import 'package:flutter/material.dart';
import 'package:shopplift/screens/profile_screen/details_screen.dart';
import 'package:shopplift/screens/profile_screen/profile_screen.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

import '../../main.dart';

class AddressBookScreen extends StatelessWidget {
  static String id = "AddressBookScreen.id";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              size: SizeConfig.sW! * 8,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "My Addresses",
          style: TextStyle(
            fontSize: SizeConfig.sW! * 5.5,
          ),
        ),
        centerTitle: true,
        actions: [
          CartIcon(),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: SizeConfig.sW! * 14,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(SizeConfig.sH! * 2),
                  child: Text(
                    "Your Addresses",
                    style: TextStyle(
                        fontSize: SizeConfig.sW! * 5.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAddress(),
                  )),
              child: Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.sH! * 2,
                ),
                height: SizeConfig.sH! * 8.5,
                width: double.infinity,
                padding: EdgeInsets.all(SizeConfig.sH! * 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      primary,
                      secondary,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Add New Address",
                    style: TextStyle(
                        fontSize: SizeConfig.sW! * 5.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              size: SizeConfig.sW! * 8,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Edit Address",
          style: TextStyle(
            fontSize: SizeConfig.sW! * 5.5,
          ),
        ),
        centerTitle: true,
        actions: [
          CartIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: SizeConfig.sW! * 14,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    padding: EdgeInsets.all(SizeConfig.sH! * 2),
                    child: Text(
                      "Edit Address",
                      style: TextStyle(
                          fontSize: SizeConfig.sW! * 5.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.sW! * 4,
                  ),
                  PlainTextFieldWithoutIcon(
                    text: "First Name",
                    keyboardType: TextInputType.name,
                    obscure: false,
                  ),
                  SizedBox(
                    height: SizeConfig.sW! * 4,
                  ),
                  PlainTextFieldWithoutIcon(
                    text: "Last Name",
                    keyboardType: TextInputType.name,
                    obscure: false,
                  ),
                  SizedBox(
                    height: SizeConfig.sW! * 4,
                  ),
                  PlainTextFieldWithoutIcon(
                    text: "Address",
                    keyboardType: TextInputType.name,
                    obscure: false,
                  ),
                  SizedBox(
                    height: SizeConfig.sW! * 4,
                  ),
                  PlainTextFieldWithoutIcon(
                    text: "Additional info ",
                    keyboardType: TextInputType.name,
                    obscure: false,
                  ),
                  SizedBox(
                    height: SizeConfig.sW! * 4,
                  ),
                  PlainTextFieldWithoutIcon(
                    text: "State",
                    keyboardType: TextInputType.name,
                    obscure: false,
                  ),
                  SizedBox(
                    height: SizeConfig.sW! * 4,
                  ),
                  PlainTextFieldWithoutIcon(
                    text: "City",
                    keyboardType: TextInputType.name,
                    obscure: false,
                  ),
                  SizedBox(
                    height: SizeConfig.sW! * 4,
                  ),
                  PlainTextFieldWithoutIcon(
                    text: "Mobile Number",
                    keyboardType: TextInputType.number,
                    obscure: false,
                  ),
                  GradientButton(
                    ontap: () {},
                    text: "Save Address",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
