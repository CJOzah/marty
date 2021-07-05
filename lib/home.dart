import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/screens/product_desc_screen.dart';
import 'package:shopplift/screens/welcome_screen.dart';
import 'package:shopplift/utils/cart.dart';
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

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-0.9, -0.5),
  end: Alignment(0.9, 0.5),
  tileMode: TileMode.clamp,
);

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  _ShimmerLoadingState createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        //update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      //The ancestor Shimmer widget isn't laid
      //out yet. Return an empty box
      return SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final OffsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -OffsetWithinShimmer.dx,
            -OffsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  Listenable get shimmerChanges => _shimmerController;

  bool get isSized => (context.findRenderObject() as RenderBox).hasSize;

  Size get size => (context.findRenderObject() as RenderBox).size;

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class Shimmer extends StatefulWidget {
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  const Shimmer({
    Key? key,
    required this.linearGradient,
    this.child,
  }) : super(key: key);

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool cartbutton = false;
  List<bool>? favbutton = [false];
  int? prodLength = 0;

  var update = FirebaseFirestore.instance.collection("all_products");
  //gets all the products stored in the firebase
  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() {
    var get = FirebaseFirestore.instance;

    return get.collection("all_products").get();
  }

  late Future<QuerySnapshot<Map<String, dynamic>>> products;
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

  String cat = "All Products";
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  void initState() {
    allCat();
    products = getProducts();
    favbutton = Provider.of<CartData>(context, listen: false).getFavbutton();
    favbutton!.add(false);

    super.initState();
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
              body: (isLoading)
                  ? LoadingWidget(isLoading: isLoading)
                  : Shimmer(
                      linearGradient: _shimmerGradient,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(
                            SizeConfig.sW! * 3,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerLoading(
                                isLoading: isLoading,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      enableInfiniteScroll: false,
                                      viewportFraction: 1,
                                      height: SizeConfig.sH! * 25,
                                      autoPlay: !isLoading,
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
                                            image: AssetImage(
                                                "images/carousel.jpg"),
                                            fit: BoxFit.cover),
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
                                            image: AssetImage(
                                                "images/carousel2.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ],
                                ),
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
                                  ShimmerLoading(
                                    isLoading: isLoading,
                                    child: CatCard(
                                      onpressed: () {
                                        setState(() {
                                          cat = "Clothes";
                                          clothesCat();
                                        });
                                      },
                                      height: height,
                                      icon: FontAwesomeIcons.tshirt,
                                      text: "Clothes",
                                    ),
                                  ),
                                  ShimmerLoading(
                                    isLoading: isLoading,
                                    child: CatCard(
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
                                  ),
                                  ShimmerLoading(
                                    isLoading: isLoading,
                                    child: CatCard(
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
                                  ),
                                  ShimmerLoading(
                                    isLoading: isLoading,
                                    child: CatCard(
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
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: SizeConfig.sH! * 2),
                                child: Text(
                                  "$cat",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sW! * 6,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              FutureBuilder(
                                  future: products,
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio:
                                                size.aspectRatio / 2,
                                            mainAxisExtent: SizeConfig.sH! * 42,
                                            crossAxisSpacing:
                                                SizeConfig.sW! * 2,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            final item =
                                                snapshot.data!.docs[index];

                                            // these lines check to see if there's any item in the favorite or cart lists and toggle the icon respectively
                                            // Provider.of<CartData>(context,
                                            //         listen: false)
                                            //     .getFavItems()
                                            //     .forEach((element) {
                                            //   print(element.get("id"));
                                            //   if (element.get("id") == item["id"]) {
                                            //     favbutton![index] = true;
                                            //   } else if (element.get("id") !=
                                            //       item["id"]) {
                                            //     favbutton![index] = false;
                                            //   }
                                            // });
                                            if (Provider.of<CartData>(context,
                                                    listen: false)
                                                .getFavItems()
                                                .isEmpty)
                                              favbutton![index] = false;
                                            // favbutton![index] = true;
                                            // } else
                                            //   favbutton![index] = false;
                                            // if (Provider.of<CartData>(context,
                                            //             listen: false)
                                            //         .getCartItems()
                                            //         .contains(item) ==
                                            //     false) {
                                            //   cartbutton = true;
                                            // } else
                                            //   cartbutton = false;
                                            return Container(
                                              height: SizeConfig.sH! * 40,
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    // onTap: () => Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           ProductDescScreen(item)),
                                                    // ),
                                                    child: Container(
                                                      height:
                                                          SizeConfig.sH! * 30,
                                                      width: double.infinity,
                                                      child: Image.network(
                                                          item["url"],
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${item["name"]}",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize:
                                                          SizeConfig.sW! * 5,
                                                    ),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    SizeConfig
                                                                            .sW! *
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
                                                              : Colors.black,
                                                          size: SizeConfig.sW! *
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
                                                                  .removeFromFav(Provider.of<
                                                                              CartData>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .getFavItems()[index]);
                                                              showInSnackBar(
                                                                  "${item["name"]} Removed from Favorites",
                                                                  context);
                                                            } else if (favbutton![
                                                                    index] ==
                                                                false) {
                                                              favbutton![
                                                                  index] = true;
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
                                                          item["cartbutton"]!
                                                              ? Icons
                                                                  .shopping_cart_outlined
                                                              : FontAwesomeIcons
                                                                  .check,
                                                          color: item[
                                                                  "cartbutton"]!
                                                              ? Colors.black
                                                              : Colors.green,
                                                        ),
                                                        onTap: () {
                                                          setState(() {
                                                            if (item["size"]!
                                                                .isEmpty) {
                                                              if (cartbutton ==
                                                                  true) {
                                                                cartbutton =
                                                                    false;
                                                                // item.quantity = 1;
                                                                // Provider.of<CartData>(
                                                                //         context,
                                                                //         listen: false)
                                                                //     .addToCart(
                                                                //         clothes[index]);
                                                                // Provider.of<CartData>(
                                                                //         context,
                                                                //         listen: false)
                                                                //     .addToTotal(
                                                                //         item.price!);
                                                                // showInSnackBar(
                                                                //     "${item["name"]} Added to Cart",
                                                                //     context);
                                                              } else {
                                                                cartbutton =
                                                                    true;
                                                                // item.setQuantity(1);

                                                                // Provider.of<CartData>(
                                                                //         context,
                                                                //         listen: false)
                                                                //     .removeFromCart(
                                                                //         clothes[index]);
                                                                // Provider.of<CartData>(
                                                                //         context,
                                                                //         listen: false)
                                                                //     .decreaseTotal(
                                                                //         clothes[index]
                                                                //             .price!);
                                                                // showInSnackBar(
                                                                //     "${item["name"]} Removed from Cart",
                                                                //     context);
                                                              }
                                                            } else {
                                                              // showSizeSheet(
                                                              //     context,
                                                              //     item,
                                                              //     setState,
                                                              //     quantity);
                                                            }
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Text("No data");
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.5),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          )),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  LoadingWidget({Key? key, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Shimmer(
      linearGradient: _shimmerGradient,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(
            SizeConfig.sW! * 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                isLoading: isLoading,
                child: Container(
                  height: SizeConfig.sH! * 23,
                  color: Colors.black,
                ),
              ),
              ShimmerLoading(
                isLoading: isLoading,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.sH! * 1,
                    bottom: SizeConfig.sH! * 1.2,
                  ),
                  child: Container(
                    height: SizeConfig.sH! * 4,
                    width: SizeConfig.sW! * 45,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(SizeConfig.sH! * 2)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: CatCard(
                      onpressed: () {},
                      height: height,
                      icon: FontAwesomeIcons.tshirt,
                      text: "Clothes",
                    ),
                  ),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: CatCard(
                      onpressed: () {},
                      height: height,
                      icon: FontAwesomeIcons.shoePrints,
                      text: "Shoes",
                    ),
                  ),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: CatCard(
                      onpressed: () {},
                      height: height,
                      icon: Icons.watch_outlined,
                      text: "Accessories",
                    ),
                  ),
                  ShimmerLoading(
                    isLoading: isLoading,
                    child: CatCard(
                      height: height,
                      icon: Icons.all_inclusive_outlined,
                      text: "All Products",
                      onpressed: () {},
                    ),
                  ),
                ],
              ),
              ShimmerLoading(
                isLoading: isLoading,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.sH! * 1,
                    bottom: SizeConfig.sH! * 1.2,
                  ),
                  child: Container(
                    height: SizeConfig.sH! * 4,
                    width: SizeConfig.sW! * 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(SizeConfig.sH! * 2)),
                  ),
                ),
              ),
              Row(
                children: [
                  Grid(isLoading: isLoading),
                  SizedBox(
                    width: SizeConfig.sW! * 3,
                  ),
                  Grid(isLoading: isLoading),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  const Grid({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ShimmerLoading(
            isLoading: isLoading,
            child: Container(
              height: SizeConfig.sH! * 30,
              color: Colors.black,
            ),
          ),
          ShimmerLoading(
            isLoading: isLoading,
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.sH! * 1,
              ),
              child: Container(
                height: SizeConfig.sH! * 3.5,
                width: SizeConfig.sW! * 30,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(SizeConfig.sH! * 2)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLoading(
                isLoading: isLoading,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.sH! * 1,
                  ),
                  child: Container(
                    height: SizeConfig.sH! * 3.5,
                    width: SizeConfig.sW! * 18,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(SizeConfig.sH! * 2)),
                  ),
                ),
              ),
              ShimmerLoading(
                isLoading: isLoading,
                child: InkWell(
                  child: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.black,
                    size: SizeConfig.sW! * 6,
                  ),
                ),
              ),
              ShimmerLoading(
                isLoading: isLoading,
                child: InkWell(
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
