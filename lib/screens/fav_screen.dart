import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/utils/cart.dart';
import 'package:shopplift/utils/clothes.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class FavScreen extends StatefulWidget {
  static String id = 'FavScreen';

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool butColor = true;
  int inDex = 0;
  late QueryDocumentSnapshot<Object?> items;

  int addtoIndex = 1;
  Color text = Colors.black;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<CartData>(context, listen: false).getFavItems().length ==
        0) {
      addtoIndex = 0;
    }
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: (Provider.of<CartData>(context).getFavItems().length == 0)
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/BubbleDesign.png"),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(
                color: Colors.white,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.sH! * 3),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: (Provider.of<CartData>(context)
                                  .getFavItems()
                                  .length ==
                              0)
                          ? Colors.white
                          : Colors.black,
                      size: SizeConfig.sH! * 5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.sW! * 23),
                    child: Text(
                      "WISHLIST",
                      style: TextStyle(
                        fontSize: SizeConfig.sH! * 3.5,
                        color: (Provider.of<CartData>(context)
                                    .getFavItems()
                                    .length ==
                                0)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${inDex + addtoIndex} / ${Provider.of<CartData>(context, listen: false).getFavItems().length} Items",
              style: TextStyle(
                color:
                    (Provider.of<CartData>(context).getFavItems().length == 0)
                        ? Colors.white
                        : Colors.black,
                fontSize: SizeConfig.sH! * 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: (Provider.of<CartData>(context).getFavItems().length ==
                        0)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.heart,
                            size: SizeConfig.sH! * 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: SizeConfig.sH! * 2,
                          ),
                          Text(
                            "NO ITEMS IN YOUR WISHLIST",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: SizeConfig.sH! * 3,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: Provider.of<CartData>(context)
                                .getFavItems()
                                .length,
                            itemBuilder: (context, int index, int realIndex) {
                              final item = Provider.of<CartData>(context)
                                  .getFavItems()[index];
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.sH! * 5)),
                                        ),
                                        semanticContainer: true,
                                        child: Container(
                                          width: SizeConfig.sW! * 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                SizeConfig.sH! * 5),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: SizeConfig.sH! * 50,
                                                width: SizeConfig.sW! * 100,
                                                decoration: BoxDecoration(
                                                  color:
                                                      Colors.lightBlue.shade50,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  SizeConfig
                                                                          .sH! *
                                                                      2),
                                                          topRight:
                                                              Radius.circular(
                                                                  SizeConfig
                                                                          .sH! *
                                                                      2)),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        item["url"]),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(
                                                          SizeConfig.sH! * 2),
                                                      height:
                                                          SizeConfig.sH! * 5,
                                                      width: SizeConfig.sH! * 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                SizeConfig.sH! *
                                                                    5),
                                                      ),
                                                      child: IconButton(
                                                        icon: Icon(
                                                          FontAwesomeIcons
                                                              .times,
                                                          size: SizeConfig.sH! *
                                                              2.5,
                                                          color: Colors.white,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            if (inDex >= 1)
                                                              inDex--;
                                                            addtoIndex--;

                                                            Provider.of<CartData>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .removeFromFav(Provider.of<
                                                                            CartData>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getFavItems()[inDex]);
                                                            showInSnackBar(
                                                                "${item["name"]} Removed from Cart",
                                                                context);
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: SizeConfig.sW! * 5,
                                                    top: SizeConfig.sH! * 1),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${item["name"]}",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            SizeConfig.sH! * 3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.only(),
                                                      child: Text(
                                                        "${item["color"]}",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize:
                                                              SizeConfig.sH! *
                                                                  2.5,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: SizeConfig.sH! *
                                                              1,
                                                          bottom:
                                                              SizeConfig.sH! *
                                                                  2),
                                                      child: Text(
                                                        "₦${item["price"]}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              SizeConfig.sH! *
                                                                  3,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                            options: CarouselOptions(
                                enableInfiniteScroll: false,
                                viewportFraction: 0.8,
                                height: SizeConfig.sH! * 80,
                                autoPlay: true,
                                pageSnapping: false,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    inDex = index;
                                    items = Provider.of<CartData>(context,
                                            listen: false)
                                        .getFavItems()[index];
                                  });
                                }),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(SizeConfig.sH! * 5),
                              gradient: LinearGradient(
                                colors: [
                                  primary,
                                  secondary,
                                ],
                              ),
                            ),
                            child: MaterialButton(
                              height: SizeConfig.sH! * 6.5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.sH! * 2),
                              ),
                              minWidth: SizeConfig.sW! * 50,
                              onPressed: () {
                                setState(() {
                                  if (Provider.of<CartData>(context,
                                          listen: false)
                                      .getFavItems()
                                      .isEmpty) {
                                  } else {
                                    if (inDex >= 1) inDex--;
                                    // Provider.of<CartData>(context,
                                    //         listen: false)
                                    //     .addToCart(Provider.of<CartData>(
                                    //             context,
                                    //             listen: false)
                                    //         .getFavItems()[inDex]);

                                    // Provider.of<CartData>(context,
                                    //         listen: false)
                                    //     .addToTotal(Provider.of<CartData>(
                                    //             context,
                                    //             listen: false)
                                    //         .getFavItems()[inDex]
                                    //         .price!);

                                    // Provider.of<CartData>(context,
                                    //         listen: false)
                                    //     .getFavItems()[inDex]
                                    //     .setQuantity(1);

                                    showInSnackBar("Added to Cart", context);
                                    Provider.of<CartData>(context,
                                            listen: false)
                                        .removeFromFav(Provider.of<CartData>(
                                                context,
                                                listen: false)
                                            .getFavItems()[inDex]);
                                  }
                                });
                              },
                              child: Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    fontSize: SizeConfig.sH! * 2.5,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
