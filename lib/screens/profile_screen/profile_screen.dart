import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/screens/cart_category/cart_screen.dart';
import 'package:shopplift/screens/fav_screen.dart';
import 'package:shopplift/screens/profile_screen/address_book_screen.dart';
import 'package:shopplift/screens/profile_screen/details_screen.dart';
import 'package:shopplift/screens/sign_in_screen.dart';
import 'package:shopplift/utils/cart.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

import 'orders_screen.dart';

class ProfileScreen extends StatelessWidget {
  static String id = "ProfileScreen.id";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: SizeConfig.sH! * 2,
                    left: SizeConfig.sW! * 2,
                    right: SizeConfig.sW! * 2),
                height: SizeConfig.sW! * 53,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      primary,
                      secondary,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back,
                                size: SizeConfig.sW! * 8, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: SizeConfig.sW! * 7,
                              color: Colors.white,
                            ),
                          ),
                          CartIcon(),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.sW! * 5,
                            right: SizeConfig.sW! * 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome!",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sW! * 6.5,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Login to see your details",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sW! * 4.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, SignInScreen.id),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.sH! * 4,
                                    bottom: SizeConfig.sH! * 2),
                                height: SizeConfig.sW! * 12,
                                width: SizeConfig.sW! * 30,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(SizeConfig.sH! * 1),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      primary,
                                      secondary,
                                    ],
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: SizeConfig.sW! * 5,
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ProfileListTile(
                leading: Icons.shopping_bag_outlined,
                title: "Orders",
                ontap: OrderScreen.id,
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              ProfileListTile(
                leading: Icons.book_outlined,
                title: "Details",
                ontap: DetailsScreen.id,
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              ProfileListTile(
                leading: FontAwesomeIcons.addressBook,
                title: "Address Book",
                ontap: AddressBookScreen.id,
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              ProfileListTile(
                leading: FontAwesomeIcons.heart,
                ontap: FavScreen.id,
                title: "WishList",
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              ProfileListTile(
                leading: FontAwesomeIcons.inbox,
                title: "Inbox",
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              SizedBox(
                height: SizeConfig.sH! * 4,
              ),
              // Center(
              //   child: InkWell(
              //     onTap: () {},
              //     child: Text(
              //       "LOGIN",
              //       style: TextStyle(
              //         fontSize: SizeConfig.sH! * 3,
              //         color: primaryDark,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined,
              size: SizeConfig.sW! * 8, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, CartScreen.id),
        ),
        Container(
          margin: EdgeInsets.only(left: SizeConfig.sH! * 4),
          height: SizeConfig.sW! * 6,
          width: SizeConfig.sW! * 6,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(SizeConfig.sH! * 2),
          ),
          child: Center(
            child: Text(
              "${Provider.of<CartData>(context).getCartItems().length}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
