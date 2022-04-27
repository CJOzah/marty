import 'package:flutter/material.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/profile_screen/profile_screen.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class DetailsScreen extends StatefulWidget {
  static String id = "DetailsScreen.id";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? genderSelected;

  List? gender = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          "My Profile",
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
          children: [
            Container(
              height: SizeConfig.sW! * 14,
              width: double.infinity,
              color: Colors.grey.shade300,
              padding: EdgeInsets.all(SizeConfig.sH! * 2),
              child: Text(
                "Your Personal Data",
                style: TextStyle(
                    fontSize: SizeConfig.sW! * 5.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.sH! * 2),
              child: PlainTextField(
                text: "First Name",
                icon: Icons.person_outline,
                keyboardType: TextInputType.name,
                obscure: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.sH! * 2),
              child: PlainTextField(
                text: "Last Name",
                keyboardType: TextInputType.name,
                obscure: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.sH! * 2),
              child: PlainTextField(
                text: "E-mail",
                icon: Icons.mail_outline,
                keyboardType: TextInputType.name,
                obscure: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.sH! * 2),
              child: PlainTextField(
                text: "Mobile Number",
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.name,
                obscure: false,
              ),
            ),
            GradientButton(
              ontap: () {},
              text: "Save",
            ),
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const GradientButton({
    Key? key,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
            top: SizeConfig.sW! * 1,
            left: SizeConfig.sW! * 3,
            right: SizeConfig.sW! * 3),
        height: SizeConfig.sW! * 12.5,
        width: double.infinity,
        padding: EdgeInsets.all(SizeConfig.sW! * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.sH! * 2),
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
            text,
            style: TextStyle(
                fontSize: SizeConfig.sW! * 6,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
