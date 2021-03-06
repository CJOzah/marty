import 'package:flutter/material.dart';
import 'package:shopplift/utils/clothes.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

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
  bool showBottomSheet = false;
  List<int> quantity = List<int>.filled(5, 0, growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          top: SizeConfig.sH! * 5, left: SizeConfig.sW! * 4),
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
              Container(
                margin: EdgeInsets.all(SizeConfig.sH! * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.item!.name}",
                      style: TextStyle(
                        fontSize: SizeConfig.sH! * 4,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 2,
                    ),
                    Text(
                      "(${widget.item!.ratings}) ratings",
                      style: TextStyle(
                        fontSize: SizeConfig.sH! * 3,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "???${widget.item!.price}",
                          style: TextStyle(
                            fontSize: SizeConfig.sH! * 4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Available in stock",
                          style: TextStyle(
                            fontSize: SizeConfig.sH! * 2.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 5,
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: SizeConfig.sH! * 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 3,
                    ),
                    Text(
                      "${widget.item!.description}",
                      style: TextStyle(
                        fontSize: SizeConfig.sH! * 3,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 3,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: SizeConfig.sH! * 1.3,
                      ),
                      height: SizeConfig.sH! * 12,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.item!.size!.length,
                        itemBuilder: (context, index) {
                          Color selectedColor = Colors.transparent;
                          final item = widget.item!;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (widget.item!.size!.isNotEmpty) {
                                  showSizeSheet(
                                      context, widget.item, setState, quantity);
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(SizeConfig.sH! * 2),
                              height: SizeConfig.sH! * 3,
                              width: SizeConfig.sW! * 16,
                              decoration: BoxDecoration(
                                color: selectedColor,
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.sH! * 1.5),
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: SizeConfig.sW! * 0.1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "${item.size![index]}",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sH! * 3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
