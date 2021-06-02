import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/cart_category/checkout_screen.dart';
import 'package:shopplift/utils/cart.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class CartScreen extends StatefulWidget {
  static String id = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showBottomSheet = false;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    double total = Provider.of<CartData>(context).getTotal() * 0.05 +
        Provider.of<CartData>(context).getTotal();
    final s = MediaQuery.of(context).size;
    final w = s.width;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: (showBottomSheet == true)
          ? Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeConfig.sH! * 50),
                    topLeft: Radius.circular(SizeConfig.sH! * 50)),
              ),
              height: SizeConfig.sH! * 50,
              child: Card(
                color: Colors.white,
                elevation: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(SizeConfig.sH! * 6),
                      topLeft: Radius.circular(SizeConfig.sH! * 6)),
                ),
                semanticContainer: true,
                child: SingleChildScrollView(),
              ),
            )
          : SizedBox(),
      body: SafeArea(
        child: Container(
          height: SizeConfig.sH! * 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  primary,
                  secondary,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.sH! * 86,
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        SizeConfig.sW! * 15,
                      ),
                      bottomRight: Radius.circular(
                        SizeConfig.sW! * 15,
                      )),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.sW! * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.sW! * 5,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.black,
                            size: SizeConfig.sH! * 6,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.sW! * 9,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shopping",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sH! * 5,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Cart",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sH! * 5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: SizeConfig.sW! * 3,
                              ),
                              child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.trash,
                                    size: SizeConfig.sH! * 5,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Provider.of<CartData>(context,
                                              listen: false)
                                          .clearCart();
                                      Provider.of<CartData>(context,
                                              listen: false)
                                          .clearTotal();
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: SizeConfig.sH! * 1.3,
                        ),
                        height: SizeConfig.sH! * 50,
                        width: double.infinity,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                Provider.of<CartData>(context, listen: false)
                                    .getCartItems()
                                    .length,
                            itemBuilder: (context, index) {
                              final item =
                                  Provider.of<CartData>(context, listen: false)
                                      .getCartItems()[index];
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.sH! * 1,
                                ),
                                height: SizeConfig.sH! * 18,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(
                                        SizeConfig.sH! * 2,
                                      ),
                                      height: SizeConfig.sH! * 15,
                                      width: SizeConfig.sW! * 25,
                                      child: Image(
                                        image: AssetImage("${item.image}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${item.name}",
                                          style: TextStyle(
                                              fontSize: SizeConfig.sH! * 2.5,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.sH! * 1,
                                        ),
                                        Text(
                                          "Size: ${item.selectedSize}",
                                          style: TextStyle(
                                              fontSize: SizeConfig.sW! * 3.5,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.sH! * 1,
                                        ),
                                        Container(
                                          width: SizeConfig.sW! * 60,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "₦${item.price}",
                                                style: TextStyle(
                                                    fontSize:
                                                        SizeConfig.sH! * 3,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: SizeConfig.sH! * 4,
                                                width: SizeConfig.sW! * 22,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    SizeConfig.sH! * 5,
                                                  ),
                                                  color: Colors.blue.shade900,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      child: Icon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          size: SizeConfig.sW! *
                                                              5.5,
                                                          color: (item.quantity ==
                                                                  1)
                                                              ? Colors
                                                                  .transparent
                                                              : Colors.white),
                                                      onTap: () {
                                                        setState(() {
                                                          if (item.quantity! >
                                                              1) {
                                                            item.setQuantity(
                                                                -1);
                                                            Provider.of<CartData>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .decreaseTotal(
                                                                    item.price!);
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "${item.getQuantity()}",
                                                      style: TextStyle(
                                                          fontSize: w / 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    InkWell(
                                                      child: Icon(
                                                        FontAwesomeIcons.plus,
                                                        size: SizeConfig.sW! *
                                                            5.5,
                                                        color: Colors.white,
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          item.setQuantity(1);
                                                          Provider.of<CartData>(
                                                                  context,
                                                                  listen: false)
                                                              .increaseTotal(
                                                                  item.price!);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.sW! * 10,
                        ),
                        child: Text(
                          "${Provider.of<CartData>(context, listen: false).getCartItems().length} Items",
                          style: TextStyle(
                              fontSize: SizeConfig.sH! * 2.5,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.sW! * 10,
                          bottom: SizeConfig.sH! * 4,
                          right: SizeConfig.sW! * 6,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: SizeConfig.sH! * 2.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₦${Provider.of<CartData>(context, listen: false).getTotal()}",
                              style: TextStyle(
                                  fontSize: SizeConfig.sH! * 2.6,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.sH! * 5,
                ),
                elevation: 0,
                height: SizeConfig.sH! * 6,
                minWidth: w,
                onPressed: () {
                  setState(() {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: SizeConfig.sH! * 55,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: SizeConfig.sH! * 4,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: SizeConfig.sH! * 1.5,
                                                left: SizeConfig.sW! * 18),
                                            child: Text(
                                              "Order Summary",
                                              style: TextStyle(
                                                fontSize: SizeConfig.sH! * 4,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: SizeConfig.sW! * 4,
                                              left: SizeConfig.sW! * 10,
                                            ),
                                            height: SizeConfig.sH! * 6.5,
                                            width: SizeConfig.sH! * 6.5,
                                            decoration: BoxDecoration(
                                              color: primary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      SizeConfig.sH! * 30),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.arrowDown,
                                                size: SizeConfig.sW! * 5,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    HorizontalLine(
                                      width: double.infinity,
                                      height: SizeConfig.sH! * 0.12,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.all(SizeConfig.sH! * 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SummaryTexts(
                                            w: SizeConfig.sW!,
                                            h: SizeConfig.sH!,
                                            text1: "Subtotoal",
                                            text2:
                                                "₦${Provider.of<CartData>(context, listen: false).getTotal()}",
                                          ),
                                          SummaryTexts(
                                            w: SizeConfig.sW!,
                                            h: SizeConfig.sH!,
                                            text1: "VAT",
                                            text2: "5%",
                                          ),
                                          SummaryTexts(
                                            w: SizeConfig.sW!,
                                            h: SizeConfig.sH!,
                                            text1: "Discount",
                                            text2: "₦0",
                                          ),
                                          SummaryTexts(
                                            w: SizeConfig.sW!,
                                            h: SizeConfig.sH!,
                                            text1: "Delivery",
                                            text2: "Free",
                                          ),
                                        ],
                                      ),
                                    ),
                                    HorizontalLine(
                                      width: double.infinity,
                                      height: SizeConfig.sH! * 0.12,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: SizeConfig.sH! * 2.2,
                                        bottom: SizeConfig.sH! * 2.5,
                                        left: SizeConfig.sW! * 2,
                                        right: SizeConfig.sW! * 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                              fontSize: SizeConfig.sH! * 3,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: SizeConfig.sH! * 1,
                                          ),
                                          Text(
                                            "₦$total",
                                            style: TextStyle(
                                                fontSize: SizeConfig.sH! * 4,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    MaterialButton(
                                      height: SizeConfig.sH! * 7,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          SizeConfig.sW! * 6,
                                        ),
                                      ),
                                      minWidth: SizeConfig.sW! * 90,
                                      color: primary,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, CheckOutScreen.id);
                                      },
                                      child: Text(
                                        "Checkout",
                                        style: TextStyle(
                                            fontSize: SizeConfig.sH! * 3.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
                },
                child: Text(
                  "Proceed to Summary",
                  style: TextStyle(
                      fontSize: SizeConfig.sH! * 3.5, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryTexts extends StatelessWidget {
  const SummaryTexts(
      {Key? key,
      required this.w,
      this.h,
      required this.text1,
      required this.text2})
      : super(key: key);

  final double w;
  final double? h;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: h! * 1.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Colors.black,
              fontSize: w * 4.8,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Colors.black,
              fontSize: w * 4.8,
            ),
          ),
        ],
      ),
    );
  }
}
