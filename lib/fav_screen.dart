import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/utils.dart';
import 'cart.dart';
import 'home.dart';

class FavScreen extends StatefulWidget {
  static String id = 'FavScreen';

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool butColor = true;
  int inDex = 0;

  int addtoIndex = 1;

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
    final s = MediaQuery.of(context).size;
    final h = s.height;
    final w = s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
            size: h / 28,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, FancyDraw.id, (route) => false);
          },
        ),
        title: Text(
          "WISHLIST",
          style: TextStyle(
            fontSize: h / 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${inDex + addtoIndex} / ${Provider.of<CartData>(context, listen: false).getFavItems().length} Items",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: h / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: h / 90),
                  height: h / 1.36,
                  width: double.infinity,
                  child: (Provider.of<CartData>(context).getFavItems().length ==
                          0)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.heart,
                              size: w / 5,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            Text(
                              "NO ITEMS IN YOUR WISHLIST",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: w / 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      : CarouselSlider.builder(
                          itemCount: Provider.of<CartData>(context)
                              .getFavItems()
                              .length,
                          itemBuilder: (context, int index, int realIndex) {
                            final item = Provider.of<CartData>(context)
                                .getFavItems()[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                            Radius.circular(h / 50)),
                                      ),
                                      semanticContainer: true,
                                      child: Container(
                                        height: h / 1.5,
                                        width: w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(w / 30),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: h / 1.8,
                                              width: w,
                                              decoration: BoxDecoration(
                                                color: Colors.lightBlue.shade50,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(h / 40),
                                                    topRight: Radius.circular(
                                                        h / 40)),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      '${item.image}'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.all(w / 50),
                                                    height: h / 20,
                                                    width: w / 10,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              w / 20),
                                                    ),
                                                    child: IconButton(
                                                      icon: Icon(
                                                        FontAwesomeIcons.times,
                                                        size: w / 20,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (inDex > 1)
                                                            inDex--;
                                                          addtoIndex--;

                                                          Provider.of<CartData>(
                                                                  context,
                                                                  listen: false)
                                                              .removeFromFav(Provider.of<
                                                                          CartData>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .getFavItems()[inDex]);
                                                          showInSnackBar(
                                                              "${item.name} Removed from Cart",
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
                                                  left: w / 50, top: h / 80),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${item.name}",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: h / 40,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(),
                                                    child: Text(
                                                      "${item.color}",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: h / 55,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: h / 150),
                                                    child: Text(
                                                      "₦${item.price}",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: h / 50,
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
                              height: h,
                              autoPlay: true,
                              pageSnapping: false,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  inDex = index;
                                });
                              }),
                        ),
                ),
                MaterialButton(
                  height: h / 16,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h / 30),
                  ),
                  minWidth: w / 2.2,
                  color: Colors.blue.shade900,
                  onPressed: () {
                    setState(() {
                      if (Provider.of<CartData>(context, listen: false)
                          .getFavItems()
                          .isEmpty) {
                      } else {
                        if (inDex > 1) inDex--;
                        Provider.of<CartData>(context, listen: false).addToCart(
                            Provider.of<CartData>(context, listen: false)
                                .getFavItems()[inDex]);
                        showInSnackBar("Added to Cart", context);
                        Provider.of<CartData>(context, listen: false)
                            .removeFromFav(
                                Provider.of<CartData>(context, listen: false)
                                    .getFavItems()[inDex]);
                      }
                    });
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(fontSize: w / 25, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
