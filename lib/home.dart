import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/cart.dart';
import 'package:shopplift/cart_screen.dart';
import 'package:shopplift/size_config.dart';
import 'clothes.dart';
import 'fav_screen.dart';
import 'cart_screen.dart';

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

class FirstLayer extends StatefulWidget {
  @override
  _FirstLayerState createState() => _FirstLayerState();
}

class _FirstLayerState extends State<FirstLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.blue.shade900),
    );
  }
}

class ThirdLayer extends StatefulWidget {
  @override
  _ThirdLayerState createState() => _ThirdLayerState();
}

class _ThirdLayerState extends State<ThirdLayer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height / 30),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.shoppingCart,
                      size: width / 15,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width / 30,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, CartScreen.id);
                        });
                      },
                      child: Text(
                        "Cart",
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height / 30),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.heart,
                      size: width / 15,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width / 30,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, FavScreen.id)
                              .then((value) => setState(() {}));
                        });
                      },
                      child: Text(
                        "WishList",
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 15),
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

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<ClothesModel> clothes = [];

  void shoesCat() {
    clothes.clear();
    clothes.addAll(shoes);
  }

  void watchCat() {
    clothes.clear();
    clothes.addAll(watches);
  }

  void allCat() {
    clothes.clear();
    clothes.addAll(shoes);

    clothes.addAll(watches);
    clothes.addAll(cloth);
  }

  void clothesCat() {
    clothes.clear();
    clothes.addAll(cloth);
  }

  // FToast fToast;

  // @override
  // void initState() {
  //   super.initState();
  //   fToast = FToast();
  //   fToast.init(context);
  // }

  // _showToast(String text) {
  //   Widget toast = Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25.0),
  //       color: Colors.lightBlue.shade50.withOpacity(0.5),
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(Icons.check),
  //         SizedBox(
  //           width: 12.0,
  //         ),
  //         Text(text),
  //       ],
  //     ),
  //   );

  //   fToast.showToast(
  //     child: toast,
  //     gravity: ToastGravity.BOTTOM,
  //     toastDuration: Duration(seconds: 2),
  //   );
  // }

  String cat = "All Products";
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  void initState() {
    allCat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  "SHOPLIFT",
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
                          size: SizeConfig.sH! * 3.5,
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
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(
                    SizeConfig.sW! * 3,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                            height: SizeConfig.sH! * 25,
                            autoPlay: true,
                            pageSnapping: false,
                            enlargeCenterPage: false,
                            onPageChanged: (int? index, reason) {
                              int? inDex;
                              index = inDex;
                            }),
                        items: <Widget>[
                          Container(
                            height: SizeConfig.sH! * 20,
                            width: width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/carousel.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          HomeCarousel(
                            height: height,
                            width: width,
                            textColor: Colors.blue.shade900,
                            imagePath: 'images/clothes2.jpg',
                            backgroundColor: Colors.white,
                            text1: "Mens Shirt\nHigh Quality",
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
                            backgroundColor: Color(0xFFCC041E),
                            text1: "Shoes \nHigh Quality",
                            text2:
                                "Check out  stylish Shoes,\n100% natural material",
                          ),
                          Container(
                            height: SizeConfig.sH! * 25,
                            width: width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/carousel2.jpg"),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CatCard(
                            onpressed: () {
                              setState(() {
                                cat = "Clothes";
                                clothesCat();
                              });
                            },
                            height: height,
                            icon: FontAwesomeIcons.shirtsinbulk,
                            text: "Clothes",
                          ),
                          CatCard(
                            onpressed: () {
                              setState(() {
                                cat = "Shoes";
                                shoesCat();
                              });
                            },
                            height: height,
                            icon: FontAwesomeIcons.shoePrints,
                            text: "Shoes",
                          ),
                          CatCard(
                            onpressed: () {
                              setState(() {
                                cat = "Watches";
                                watchCat();
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
                                allCat();
                              });
                            },
                            height: height,
                            icon: Icons.all_inclusive_outlined,
                            text: "All Products",
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.sH! * 2),
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
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: SizeConfig.sW! * 50,
                            childAspectRatio: size.aspectRatio / 2,
                            mainAxisExtent: SizeConfig.sH! * 42,
                            crossAxisSpacing: SizeConfig.sW! * 3,
                          ),
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: clothes.length,
                          itemBuilder: (context, index) {
                            final item = clothes[index];
                            if (Provider.of<CartData>(context, listen: false)
                                    .getFavItems()
                                    .contains(item) ==
                                false) {
                              item.favbutton = false;
                            } else
                              item.favbutton = true;
                            if (Provider.of<CartData>(context, listen: false)
                                    .getCartItems()
                                    .contains(item) ==
                                false) {
                              item.cartbutton = true;
                            } else
                              item.cartbutton = false;
                            return Container(
                              height: SizeConfig.sH! * 40,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: SizeConfig.sH! * 30,
                                    width: double.infinity,
                                    child: Image(
                                      image: AssetImage("${item.image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${item.name}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: SizeConfig.sW! * 4,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "₦${item.price}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig.sW! * 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        alignment: Alignment.centerLeft,
                                        icon: Icon(
                                          item.favbutton!
                                              ? FontAwesomeIcons.solidHeart
                                              : FontAwesomeIcons.heart,
                                          color: item.favbutton!
                                              ? Colors.red
                                              : Colors.black,
                                          size: SizeConfig.sW! * 6,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (item.favbutton == true) {
                                              clothes[index].favbutton = false;
                                              Provider.of<CartData>(context,
                                                      listen: false)
                                                  .removeFromFav(
                                                      clothes[index]);
                                              // _showToast(
                                              //     "Item Removed to Favorites");
                                            } else {
                                              clothes[index].favbutton = true;
                                              Provider.of<CartData>(context,
                                                      listen: false)
                                                  .addToFav(clothes[index]);
                                              // _showToast(
                                              //     "Item Added to Favorites");
                                            }
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: IconButton(
                                          alignment: Alignment.centerLeft,
                                          icon: Icon(
                                            item.cartbutton!
                                                ? Icons.shopping_cart_outlined
                                                : FontAwesomeIcons.check,
                                            color: item.cartbutton!
                                                ? Colors.black
                                                : Colors.green,
                                            size: item.cartbutton!
                                                ? SizeConfig.sW! * 6
                                                : SizeConfig.sW! * 5,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (item.cartbutton == true) {
                                                item.cartbutton = false;
                                                item.quantity = 1;
                                                item.selectedSize =
                                                    item.size![0];
                                                Provider.of<CartData>(context,
                                                        listen: false)
                                                    .addToCart(clothes[index]);
                                                Provider.of<CartData>(context,
                                                        listen: false)
                                                    .addToTotal(item.price!);
                                                // _showToast("Item Added to Cart");
                                              } else {
                                                clothes[index].cartbutton =
                                                    true;
                                                item.setQuantity(1);
                                                item.setSelectedSize(
                                                    item.size![0]);

                                                Provider.of<CartData>(context,
                                                        listen: false)
                                                    .removeFromCart(
                                                        clothes[index]);
                                                Provider.of<CartData>(context,
                                                        listen: false)
                                                    .decreaseTotal(
                                                        clothes[index].price!);

                                                // _showToast("Item Removed to Cart");
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    Key? key,
    required this.height,
    required this.width,
    required this.text1,
    required this.text2,
    required this.textColor,
    this.backgroundColor,
    this.imagePath,
    this.text2Color,
    this.text3Color,
  }) : super(key: key);

  final double height;
  final double width;
  final String text1;
  final String text2;
  final Color? text2Color;
  final Color? text3Color;
  final Color textColor;
  final Color? backgroundColor;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.sH! * 3,
                  left: SizeConfig.sW! * 3,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                        color: text2Color,
                        fontSize: SizeConfig.sH! * 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.sH! * 2,
                        bottom: SizeConfig.sH! * 2,
                      ),
                      child: Text(
                        text2,
                        style: TextStyle(
                          color: text3Color,
                          fontSize: SizeConfig.sH! * 2,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Discover Collection ->",
                        style: TextStyle(
                            fontSize: SizeConfig.sH! * 2.8,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: SizeConfig.sH! * 15,
                width: SizeConfig.sW! * 35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath!), fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CatCard extends StatelessWidget {
  const CatCard(
      {Key? key,
      required this.height,
      required this.icon,
      required this.onpressed,
      required this.text})
      : super(key: key);

  final double height;
  final IconData icon;
  final String text;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed as void Function()?,
      child: Container(
        height: SizeConfig.sH! * 11,
        width: SizeConfig.sW! * 21.8,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(
            SizeConfig.sH! * 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: SizeConfig.sH! * 5.5,
              color: Colors.black,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.sH! * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondLayer extends StatefulWidget {
  @override
  SecondLayerState createState() => SecondLayerState();
}

late SecondLayerState secondLayerState;

class SecondLayerState extends State<SecondLayer> {
  // SecondLayerState secondLayerState;
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 550),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.shade900.withOpacity(0.3)),
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ));
  }
}
