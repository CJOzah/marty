import 'package:flutter/material.dart';
import 'package:shopplift/utils/size_config.dart';

class OrderScreen extends StatelessWidget {
  static String id = "OrderScreen.id";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BubbleDesign.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: SizeConfig.sH! * 40,
                  top: SizeConfig.sH! * 4,
                  right: SizeConfig.sW! * 80),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    size: SizeConfig.sW! * 8,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "No Orders yet",
                    style: TextStyle(
                      fontSize: SizeConfig.sW! * 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
