import 'package:flutter/material.dart';
import 'package:shopplift/utils/size_config.dart';

class OrderScreen extends StatelessWidget {
  static String id = "OrderScreen.id";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              size: SizeConfig.sH! * 5,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BubbleDesign.png"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            "No Orders yet",
            style: TextStyle(
              fontSize: SizeConfig.sH! * 5,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
