import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/product_desc_screen.dart';
import 'package:shopplift/screens/sign_in_screen.dart';
import 'package:shopplift/utils/cart.dart';
import 'package:shopplift/utils/connection_status_singleton.dart';
import 'package:shopplift/utils/shimmer_custom_widget.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';
import 'utils/clothes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FancyDraw extends StatefulWidget {
  static String id = 'Drawer';
  @override
  _FancyDrawState createState() => _FancyDrawState();
}

class _FancyDrawState extends State<FancyDraw> {
  Widget page = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(),
          SecondLayer(),
          ThirdLayer(),
          HomePage(),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<bool>? favbutton = [];
  List<bool>? cartbutton = [];
  int? prodLength = 0;

  var update = FirebaseFirestore.instance.collection("all_products");
  //gets all the products stored in the firebase

  Future<QuerySnapshot<Map<String, dynamic>>>? products;
  List<ClothesModel> clothes = [];

  // void shoesCat() {
  //   clothes.clear();
  //   clothes.addAll(shoes);
  // }

  // void watchCat() {
  //   clothes.clear();
  //   clothes.addAll(watches);
  // }

  // void allCat() {
  //   clothes.clear();
  //   clothes.addAll(shoes);

  //   clothes.addAll(watches);
  //   clothes.addAll(cloth);
  // }

  // void clothesCat() {
  //   clothes.clear();
  //   clothes.addAll(cloth);
  // }

  String cat = "All Products";
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;

  bool? _hasNetworkConnection;
  bool? _fallbackViewOn;

  void updateConnectivity(dynamic hasConnection) {
    if (!_hasNetworkConnection!) {
      if (!_fallbackViewOn!) {
        navigatorKey.currentState!.pushNamed(SignInScreen.id);
        setState(() {
          _fallbackViewOn = true;
          _hasNetworkConnection = hasConnection;
        });
      }
    } else {
      if (_fallbackViewOn!) {
        navigatorKey.currentState!.pop(context);
        setState(() {
          _fallbackViewOn = false;
          _hasNetworkConnection = hasConnection;
        });
      }
    }
  }

  Future<void> _pullRefresh(isloading) async {
    return isloading;
  }

  @override
  void initState() {
    // allCat();
    products = Provider.of<CartData>(context, listen: false).getProducts();

    super.initState();
    _hasNetworkConnection = false;
    _fallbackViewOn = false;

    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    connectionStatus.connectionChange.listen(updateConnectivity);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<int> quantity = List<int>.filled(5, 0, growable: true);

  AsyncSnapshot<QuerySnapshot>? product;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: xoffSet, y: yoffSet)
          .rotate(angle)
          .matrix4,
      duration: Duration(milliseconds: 250),
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                isOpen ? BorderRadius.circular(10) : BorderRadius.circular(0),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "MARTY",
                  style: TextStyle(
                    fontSize: SizeConfig.sH! * 3.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                leading: !isOpen
                    ? IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: SizeConfig.sH! * 4,
                          color: Color(0xFF1f186f),
                        ),
                        onPressed: () {
                          setState(() {
                            xoffSet = 150;
                            yoffSet = 80;
                            angle = -0.2;
                            isOpen = true;
                          });
                          secondLayerState.setState(() {
                            secondLayerState.xoffSet = 122;
                            secondLayerState.yoffSet = 110;
                            secondLayerState.angle = -0.275;
                          });
                        })
                    : IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            size: SizeConfig.sH! * 3.5,
                            color: Color(0xFF1f186f)),
                        onPressed: () {
                          setState(() {
                            xoffSet = 0;
                            yoffSet = 0;
                            angle = 0;
                            isOpen = false;
                          });
                          secondLayerState.setState(() {
                            secondLayerState.xoffSet = 0;
                            secondLayerState.yoffSet = 0;
                            secondLayerState.angle = 0;
                          });
                        }),
              ),
              body: StreamBuilder(
                stream: Connectivity().onConnectivityChanged,
                builder: (BuildContext context,
                    AsyncSnapshot<ConnectivityResult> snapshot) {
                  // snapshot = Connectivity().onConnectivityChanged;
                  if (!snapshot.hasData)
                    return Center(child: Text("No Internet Connection!"));
                  var result = snapshot.data;
                  switch (result) {
                    case ConnectivityResult.none:
                      print("no network");
                      return Center(child: Text("No Internet Connection!"));
                    case ConnectivityResult.mobile:
                    case ConnectivityResult.wifi:
                      return RefreshIndicator(
                        onRefresh: () {
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(milliseconds: 5000))
                              .whenComplete(() {
                            products =
                                Provider.of<CartData>(context, listen: false)
                                    .getProducts();
                            setState(() {
                              isLoading = false;
                            });
                          });
                          return _pullRefresh(isLoading);
                        },
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.sW! * 3,
                              right: SizeConfig.sW! * 3,
                            ),
                            child: Column(
                              children: [
                                FutureBuilder(
                                    future: products!,
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot>?
                                            snapshot) {
                                      if (snapshot!.connectionState ==
                                          ConnectionState.done) {
                                        //passes the QueryDocument Snapshot to be saved globally
                                        Provider.of<CartData>(context,
                                                listen: false)
                                            .setSnapshot(snapshot);
                                        //check if the list of favorite or cart button is null and fill them
                                        if (favbutton!.isEmpty) {
                                          snapshot.data!.docs
                                              .forEach((element) {
                                            favbutton!.add(false);
                                          });
                                        }
                                        if (cartbutton!.isEmpty) {
                                          snapshot.data!.docs
                                              .forEach((element) {
                                            cartbutton!.add(false);
                                          });
                                        }
                                        Future.delayed(
                                                Duration(milliseconds: 5000))
                                            .whenComplete(() {
                                          setState(() {
                                            isLoading = false;
                                          });
                                        });
                                      }
                                      if (isLoading == false) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CarouselSlider(
                                              options: CarouselOptions(
                                                  enableInfiniteScroll: false,
                                                  viewportFraction: 1,
                                                  height: SizeConfig.sH! * 25,
                                                  autoPlay: !isLoading,
                                                  pageSnapping: false,
                                                  enlargeCenterPage: false,
                                                  onPageChanged:
                                                      (int? index, reason) {
                                                    int? inDex;
                                                    index = inDex;
                                                  }),
                                              items: <Widget>[
                                                Container(
                                                  height: SizeConfig.sH! * 20,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "images/carousel.jpg"),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                HomeCarousel(
                                                  height: height,
                                                  width: width,
                                                  textColor:
                                                      Colors.blue.shade900,
                                                  imagePath:
                                                      'images/clothes2.jpg',
                                                  backgroundColor: Colors.white,
                                                  text1:
                                                      "Mens Shirt\nHigh Quality",
                                                  text2:
                                                      "Check out the stylish men's shirt,\n100% natural material",
                                                ),
                                                HomeCarousel(
                                                  height: height,
                                                  width: width,
                                                  text2Color: Colors.white,
                                                  text3Color: Colors.white,
                                                  textColor: Colors.white,
                                                  imagePath: 'images/shoe1.jpg',
                                                  backgroundColor:
                                                      Color(0xFFCC041E),
                                                  text1: "Shoes \nHigh Quality",
                                                  text2:
                                                      "Check out  stylish Shoes,\n100% natural material",
                                                ),
                                                Container(
                                                  height: SizeConfig.sH! * 25,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "images/carousel2.jpg"),
                                                        fit: BoxFit.fill),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: SizeConfig.sH! * 2,
                                                bottom: SizeConfig.sH! * 1.2,
                                              ),
                                              child: Text(
                                                "Choose Category",
                                                style: TextStyle(
                                                  fontSize: SizeConfig.sW! * 6,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CatCard(
                                                  onpressed: () {
                                                    setState(() {
                                                      cat = "Clothes";
                                                      // clothesCat();
                                                    });
                                                  },
                                                  height: height,
                                                  icon: FontAwesomeIcons.tshirt,
                                                  text: "Clothes",
                                                ),
                                                CatCard(
                                                  onpressed: () {
                                                    setState(() {
                                                      cat = "Shoes";
                                                      // shoesCat();
                                                    });
                                                  },
                                                  height: height,
                                                  icon: FontAwesomeIcons
                                                      .shoePrints,
                                                  text: "Shoes",
                                                ),
                                                CatCard(
                                                  onpressed: () {
                                                    setState(() {
                                                      cat = "Watches";
                                                      // watchCat();
                                                    });
                                                  },
                                                  height: height,
                                                  icon: Icons.watch_outlined,
                                                  text: "Accessories",
                                                ),
                                                CatCard(
                                                  onpressed: () {
                                                    setState(() {
                                                      cat = "All Products";
                                                      // allCat();
                                                    });
                                                  },
                                                  height: height,
                                                  icon: Icons
                                                      .all_inclusive_outlined,
                                                  text: "All Products",
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: SizeConfig.sH! * 2),
                                              child: Text(
                                                "$cat",
                                                style: TextStyle(
                                                  fontSize: SizeConfig.sW! * 6,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio:
                                                      size.aspectRatio / 2,
                                                  mainAxisExtent:
                                                      SizeConfig.sH! * 42,
                                                  crossAxisSpacing:
                                                      SizeConfig.sW! * 2,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  final item = snapshot
                                                      .data!.docs[index];
                                                  final items =
                                                      Provider.of<CartData>(
                                                              context,
                                                              listen: false)
                                                          .getCartItems();
                                                  cartbutton![index] = false;
                                                  //checks if the favorites or cart are empty
                                                  if (Provider.of<CartData>(
                                                          context,
                                                          listen: false)
                                                      .getFavItems()
                                                      .isEmpty)
                                                    favbutton![index] = false;
                                                  if (Provider.of<CartData>(
                                                          context,
                                                          listen: false)
                                                      .getCartItems()
                                                      .isEmpty)
                                                    cartbutton![index] = false;

                                                  // checks if product is has already been added to cart
                                                  items.forEach((element) {
                                                    if (item["id"] ==
                                                        element.cartDetails![
                                                            "id"]) {
                                                      cartbutton![index] = true;
                                                    }
                                                  });
                                                  return Container(
                                                    height: SizeConfig.sH! * 40,
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () =>
                                                              Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ProductDescScreen(
                                                                        item)),
                                                          ),
                                                          child: Container(
                                                            height:
                                                                SizeConfig.sH! *
                                                                    30,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                                    boxShadow: [
                                                                  shadows()
                                                                ]),
                                                            child: Image.network(
                                                                item["url"],
                                                                errorBuilder: (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    StackTrace?
                                                                        stackTrace) {
                                                              return Container(
                                                                color:
                                                                    Colors.grey,
                                                              );
                                                            },
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        Text(
                                                          "${item["name"]}",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            fontSize:
                                                                SizeConfig.sW! *
                                                                    5,
                                                          ),
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                FittedBox(
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                  child: Text(
                                                                    "₦${item["price"]}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          SizeConfig.sW! *
                                                                              5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            InkWell(
                                                              child: Icon(
                                                                favbutton![index] ==
                                                                        true
                                                                    ? FontAwesomeIcons
                                                                        .solidHeart
                                                                    : FontAwesomeIcons
                                                                        .heart,
                                                                color: favbutton![
                                                                            index] ==
                                                                        true
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .black,
                                                                size: SizeConfig
                                                                        .sW! *
                                                                    6,
                                                              ),
                                                              onTap: () {
                                                                setState(() {
                                                                  if (favbutton![
                                                                          index] ==
                                                                      true) {
                                                                    favbutton![
                                                                            index] =
                                                                        false;
                                                                    Provider.of<CartData>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .removeFromFav(
                                                                            item);
                                                                    showInSnackBar(
                                                                        "${item["name"]} Removed from Favorites",
                                                                        context);
                                                                  } else if (favbutton![
                                                                          index] ==
                                                                      false) {
                                                                    favbutton![
                                                                            index] =
                                                                        true;
                                                                    Provider.of<CartData>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .addToFav(
                                                                            item);
                                                                    showInSnackBar(
                                                                        "${item["name"]} Added to Favorites",
                                                                        context);
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                            InkWell(
                                                              child: Icon(
                                                                cartbutton![
                                                                        index]
                                                                    ? FontAwesomeIcons
                                                                        .check
                                                                    : Icons
                                                                        .shopping_cart_outlined,
                                                                color: cartbutton![
                                                                        index]
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                              onTap: () {
                                                                setState(() {
                                                                  if (item["size"]!
                                                                          .hashCode ==
                                                                      0) {
                                                                    if (cartbutton![
                                                                            index] ==
                                                                        false) {
                                                                      cartbutton![
                                                                              index] =
                                                                          true;
                                                                      Provider.of<CartData>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .addToCart(
                                                                              item,
                                                                              1,
                                                                              "M");
                                                                      showInSnackBar(
                                                                          "${item["name"]} Added to Cart",
                                                                          context);
                                                                    } else if (cartbutton![
                                                                            index] ==
                                                                        true) {
                                                                      cartbutton![
                                                                              index] =
                                                                          false;
                                                                      Provider.of<CartData>(context, listen: false).removeFromCart(
                                                                          item,
                                                                          item["size"]
                                                                              [
                                                                              index]);

                                                                      showInSnackBar(
                                                                          "${item["name"]} Removed from Cart",
                                                                          context);
                                                                    }
                                                                  } else {
                                                                    showSizeSheet(
                                                                        context,
                                                                        item,
                                                                        setState,
                                                                        quantity);
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ],
                                        );
                                      } else if (snapshot.connectionState ==
                                          ConnectionState.none) {
                                        return Text("No data");
                                      }
                                      return LoadingWidget();
                                    }),
                              ],
                            ),
                          ),
                        ),
                      );
                    default:
                      return Center(
                        child: Text("No Internet Connection!"),
                      );
                  }
                },
              ),
            ),
          )),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(
          SizeConfig.sW! * 3,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomWidget.rectangular(
              height: SizeConfig.sH! * 23,
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.sH! * 1,
                  bottom: SizeConfig.sH! * 1.2,
                ),
                child: CustomWidget.rectangular(
                  height: SizeConfig.sH! * 4,
                  width: SizeConfig.sW! * 45,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomWidget.rectangular(
                    height: SizeConfig.sH! * 11,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.sW! * 1.3,
                ),
                Expanded(
                  child: CustomWidget.rectangular(
                    height: SizeConfig.sH! * 11,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.sW! * 1.3,
                ),
                Expanded(
                  child: CustomWidget.rectangular(
                    height: SizeConfig.sH! * 11,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.sW! * 1.3,
                ),
                Expanded(
                  child: CustomWidget.rectangular(
                    height: SizeConfig.sH! * 11,
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.sH! * 1,
                  bottom: SizeConfig.sH! * 1.2,
                ),
                child: CustomWidget.rectangular(
                  height: SizeConfig.sH! * 4,
                  width: SizeConfig.sW! * 30,
                )),
            Row(
              children: [
                Grid(),
                SizedBox(
                  width: SizeConfig.sW! * 3,
                ),
                Grid(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomWidget.rectangular(
            height: SizeConfig.sH! * 30,
          ),
          Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.sH! * 1,
              ),
              child: CustomWidget.rectangular(
                height: SizeConfig.sH! * 3.5,
                width: SizeConfig.sW! * 30,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.sH! * 1,
                  ),
                  child: CustomWidget.rectangular(
                    height: SizeConfig.sH! * 3.5,
                    width: SizeConfig.sW! * 18,
                  )),
              CustomWidget.circular(
                width: SizeConfig.sW! * 6,
                height: SizeConfig.sW! * 6,
              ),
              CustomWidget.circular(
                width: SizeConfig.sW! * 6,
                height: SizeConfig.sW! * 6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
