import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/screens/profile_screen/details_screen.dart';
import 'package:shopplift/utils/cart.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

// ignore: must_be_immutable
class ProductDescScreen extends StatefulWidget {
  QueryDocumentSnapshot<Object?>? item;

  ProductDescScreen(QueryDocumentSnapshot<Object?> it) {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Description",
          style: TextStyle(fontSize: SizeConfig.sW! * 5.5),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.sW! * 82,
                ),
                height: SizeConfig.sW! * 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  image: DecorationImage(
                    image: NetworkImage("${widget.item!["url"]}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.sW! * 5,
                    right: SizeConfig.sW! * 5,
                    top: SizeConfig.sH! * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.item!["name"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SizeConfig.sW! * 7,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          (double.parse((widget.item!["ratings"])) <= 2)
                              ? Icons.star_outline_sharp
                              : Icons.star,
                          size: SizeConfig.sW! * 8,
                          color: (double.parse((widget.item!["ratings"])) <= 2)
                              ? Colors.black
                              : Colors.yellow,
                        ),
                        Icon(
                          double.parse((widget.item!["ratings"])) <= 4
                              ? Icons.star_outline_sharp
                              : Icons.star,
                          size: SizeConfig.sW! * 8,
                          color: (double.parse((widget.item!["ratings"])) <= 4)
                              ? Colors.black
                              : Colors.yellow,
                        ),
                        Icon(
                          double.parse((widget.item!["ratings"])) <= 6
                              ? Icons.star_outline_sharp
                              : Icons.star,
                          size: SizeConfig.sW! * 8,
                          color: (double.parse((widget.item!["ratings"])) <= 6)
                              ? Colors.black
                              : Colors.yellow,
                        ),
                        Icon(
                          double.parse((widget.item!["ratings"])) <= 8
                              ? Icons.star_outline_sharp
                              : Icons.star,
                          size: SizeConfig.sW! * 8,
                          color: (double.parse((widget.item!["ratings"])) <= 8)
                              ? Colors.black
                              : Colors.yellow,
                        ),
                        Icon(
                          double.parse((widget.item!["ratings"])) <= 10
                              ? Icons.star_outline_sharp
                              : Icons.star,
                          size: SizeConfig.sW! * 8,
                          color: (double.parse((widget.item!["ratings"])) <= 10)
                              ? Colors.black
                              : Colors.yellow,
                        ),
                        SizedBox(
                          width: SizeConfig.sW! * 6,
                        ),
                        Text(
                          "(${widget.item!["ratings"]} ratings)",
                          style: TextStyle(
                            fontSize: SizeConfig.sW! * 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.sH! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₦${widget.item!["price"]}",
                          style: TextStyle(
                            fontSize: SizeConfig.sW! * 6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Available in stock",
                          style: TextStyle(
                            fontSize: SizeConfig.sW! * 6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.sW! * 5,
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: SizeConfig.sW! * 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.sW! * 3,
                    ),
                    Text(
                      "${widget.item!["description"]}",
                      style: TextStyle(
                        fontSize: SizeConfig.sW! * 4.5,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.sW! * 2,
                    ),
                    Container(
                      height: SizeConfig.sW! * 20,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.item!["size"].length,
                        itemBuilder: (context, index) {
                          Color selectedColor = Colors.transparent;
                          final item = widget.item!;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (widget.item!["size"].isNotEmpty) {
                                  showSizeSheet(
                                      context, widget.item, setState, quantity);
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(SizeConfig.sW! * 3),
                              height: SizeConfig.sW! * 12,
                              width: SizeConfig.sW! * 12,
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
                                  "${item["size"][index]}",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sW! * 5,
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
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.sH! * 2,
                  left: SizeConfig.sW! * 2,
                  right: SizeConfig.sW! * 2,
                ),
                child: GradientButton(
                    text: "Add to cart",
                    ontap: () {
                      setState(() {
                        if (Provider.of<CartData>(context, listen: false)
                            .getCartItems()
                            .contains(widget.item!)) {
                          showInSnackBar(
                              "${widget.item!["name"]} Already added to cart",
                              context);
                        } else {
                          Provider.of<CartData>(context, listen: false)
                              .addToCart(
                                  widget.item!, 1, widget.item!["size"][0]);
                          showInSnackBar(
                              "${widget.item!["name"]} Added to cart", context);
                        }
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
