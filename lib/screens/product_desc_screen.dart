import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/cart_category/cart_screen.dart';
import 'package:shopplift/screens/profile_screen/details_screen.dart';
import 'package:shopplift/utils/cart.dart';
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
  bool showBottomSheet = false;
  List<int> quantity = List<int>.filled(5, 0, growable: true);

  @override
  Widget build(BuildContext context) {
    //
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
                          "₦${widget.item!.price}",
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
                                showModalBottomSheet<void>(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    print(quantity);
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setModalState) {
                                      return Wrap(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: SizeConfig.sW! * 6,
                                                right: SizeConfig.sW! * 6,
                                                bottom: SizeConfig.sH! * 4),
                                            padding: EdgeInsets.all(
                                                SizeConfig.sH! * 2),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      SizeConfig.sH! * 2),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: SizeConfig
                                                                        .sW! *
                                                                    4),
                                                            child: Text(
                                                              "Select Options",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    SizeConfig
                                                                            .sH! *
                                                                        3,
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            icon: Icon(
                                                              FontAwesomeIcons
                                                                  .times,
                                                              size: SizeConfig
                                                                      .sH! *
                                                                  4,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            SizeConfig.sH! * 2,
                                                      ),
                                                      ListView.builder(
                                                          itemCount: widget
                                                              .item!
                                                              .size!
                                                              .length,
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            final item = widget
                                                                .item!.size;
                                                            final items =
                                                                widget.item!;
                                                            return Container(
                                                              height: SizeConfig
                                                                      .sH! *
                                                                  10,
                                                              width: double
                                                                  .infinity,
                                                              child: ListTile(
                                                                title: Text(
                                                                  "${item![index]}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          SizeConfig.sH! *
                                                                              3,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                subtitle:
                                                                    Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: SizeConfig
                                                                              .sH! *
                                                                          1,
                                                                      bottom:
                                                                          SizeConfig.sH! *
                                                                              2),
                                                                  child: Text(
                                                                    "₦ ${widget.item!.price}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            SizeConfig.sH! *
                                                                                2.5,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                trailing:
                                                                    Container(
                                                                  height: SizeConfig
                                                                          .sH! *
                                                                      6,
                                                                  width: SizeConfig
                                                                          .sW! *
                                                                      34,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Container(
                                                                          height: SizeConfig.sH! *
                                                                              6,
                                                                          width: SizeConfig.sH! *
                                                                              6,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              begin: Alignment.bottomLeft,
                                                                              end: Alignment.topRight,
                                                                              colors: [
                                                                                primary,
                                                                                secondary,
                                                                              ],
                                                                            ),
                                                                            color:
                                                                                primary,
                                                                          ),
                                                                          child: IconButton(
                                                                              onPressed: () {
                                                                                setModalState(() {
                                                                                  if (quantity[index] > 0) {
                                                                                    quantity[index]--;
                                                                                    Provider.of<CartData>(context, listen: false).removeFromCart(items);
                                                                                    print(Provider.of<CartData>(context, listen: false).getCartItems().length);
                                                                                    if (quantity[index] > 0) print(Provider.of<CartData>(context, listen: false).getCartItem(Provider.of<CartData>(context, listen: false).getCartItems().length - 1).selectedSize);
                                                                                  }
                                                                                  print(quantity);
                                                                                });
                                                                              },
                                                                              icon: Icon(
                                                                                FontAwesomeIcons.minus,
                                                                                color: Colors.white,
                                                                                size: SizeConfig.sH! * 3,
                                                                              ))),
                                                                      Container(
                                                                          height: SizeConfig.sH! *
                                                                              6,
                                                                          width: SizeConfig.sH! *
                                                                              6,
                                                                          decoration:
                                                                              BoxDecoration(color: Colors.white),
                                                                          child: Center(
                                                                            child:
                                                                                Text(
                                                                              "0",
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: SizeConfig.sH! * 3,
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Container(
                                                                          height: SizeConfig.sH! *
                                                                              6,
                                                                          width: SizeConfig.sH! *
                                                                              6,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              begin: Alignment.bottomLeft,
                                                                              end: Alignment.topRight,
                                                                              colors: [
                                                                                primary,
                                                                                secondary,
                                                                              ],
                                                                            ),
                                                                            color:
                                                                                primary,
                                                                          ),
                                                                          child: IconButton(
                                                                              onPressed: () {
                                                                                setModalState(() {
                                                                                  quantity[index]++;
                                                                                  print(quantity);
                                                                                  widget.item!.selectedSize = items.size![index];
                                                                                  Provider.of<CartData>(context, listen: false).addToCart(widget.item!);
                                                                                  if (quantity[index] > 0) print(Provider.of<CartData>(context, listen: false).getCartItem(Provider.of<CartData>(context, listen: false).getCartItems().length - 1).selectedSize);
                                                                                  print(Provider.of<CartData>(context, listen: false).getCartItems().length);
                                                                                  print(quantity);
                                                                                });
                                                                              },
                                                                              icon: Icon(
                                                                                FontAwesomeIcons.plus,
                                                                                color: Colors.white,
                                                                                size: SizeConfig.sH! * 3,
                                                                              ))),
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
                                                              Navigator
                                                                  .popAndPushNamed(
                                                                      context,
                                                                      CartScreen
                                                                          .id);
                                                            });
                                                          }),

                                                      // Card(
                                                      //   margin: EdgeInsets.only(
                                                      //       top: SizeConfig.sH! * 2,
                                                      //       left: SizeConfig.sW! * 3,
                                                      //       right:
                                                      //           SizeConfig.sW! * 3),
                                                      //   elevation: 6,
                                                      //   child: Container(
                                                      //     margin: EdgeInsets.only(
                                                      //         top: SizeConfig.sH! * 2,
                                                      //         left:
                                                      //             SizeConfig.sW! * 3,
                                                      //         right:
                                                      //             SizeConfig.sW! * 3),
                                                      //     height:
                                                      //         SizeConfig.sH! * 6.5,
                                                      //     width: double.infinity,
                                                      //     child: Center(
                                                      //       child: Text(
                                                      //         "CONTINUE SHOPPING",
                                                      //         style: TextStyle(
                                                      //             fontSize:
                                                      //                 SizeConfig.sH! *
                                                      //                     3,
                                                      //             fontWeight:
                                                      //                 FontWeight.bold,
                                                      //             color:
                                                      //                 Colors.black),
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
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
