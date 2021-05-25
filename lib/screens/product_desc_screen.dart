import 'package:flutter/material.dart';
import 'package:shopplift/utils/clothes.dart';
import 'package:shopplift/utils/size_config.dart';

// ignore: must_be_immutable
class ProductDescScreen extends StatefulWidget {
  ClothesModel? item;

  ProductDescScreen(ClothesModel it) {
    item = it;
  }
  @override
  _ProductDescScreenState createState() => _ProductDescScreenState();
}

class _ProductDescScreenState extends State<ProductDescScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: SizeConfig.sH! * 32,
                right: SizeConfig.sW! * 82,
              ),
              height: SizeConfig.sH! * 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                image: DecorationImage(
                  image: AssetImage("${widget.item!.image}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.sH! * 4, left: SizeConfig.sW! * 4),
                    child: Container(
                      height: SizeConfig.sH! * 8,
                      width: SizeConfig.sH! * 8,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius:
                              BorderRadius.circular(SizeConfig.sH! * 15)),
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            size: SizeConfig.sH! * 4,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
