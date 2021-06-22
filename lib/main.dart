import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/screens/cart_category/cart_screen.dart';
import 'package:shopplift/screens/cart_category/checkout_screen.dart';
import 'package:shopplift/screens/fav_screen.dart';
import 'package:shopplift/screens/profile_screen/address_book_screen.dart';
import 'package:shopplift/screens/profile_screen/details_screen.dart';
import 'package:shopplift/screens/profile_screen/orders_screen.dart';
import 'package:shopplift/screens/profile_screen/profile_screen.dart';
import 'package:shopplift/screens/sign_up_screen.dart';
import 'package:shopplift/screens/cart_category/transfer_success_dialogue.dart';
import 'package:shopplift/screens/sign_in_screen.dart';
import 'package:shopplift/screens/welcome_screen.dart';
import 'package:shopplift/utils/cart.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

const primary = Color(0xFF2B18A3);
const primaryLight = Color(0xFF88C9FA);
Color primaryDark = Color(0xFF2B18A3);

const accentColor = Color(0xFF2B18A3);
const dividerColor = Color(0xFFE9D8E1);
const secondary = Color(0xFFF353D5);

ThemeData _appTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    secondaryHeaderColor: secondary,
    accentColor: accentColor,
    dividerColor: dividerColor,
    textTheme: TextTheme().copyWith(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartData(),
      child: MaterialApp(
          initialRoute: WelcomeScreen.id,
          debugShowCheckedModeBanner: false,
          theme: _appTheme(),
          routes: {
            FancyDraw.id: (context) => FancyDraw(),
            FavScreen.id: (context) => FavScreen(),
            CheckOutScreen.id: (context) => CheckOutScreen(),
            CartScreen.id: (context) => CartScreen(),
            TransferSuccessDialogue.id: (context) => TransferSuccessDialogue(),
            SignInScreen.id: (context) => SignInScreen(),
            SignUpScreen.id: (context) => SignUpScreen(),
            WelcomeScreen.id: (context) => WelcomeScreen(),
            ProfileScreen.id: (context) => ProfileScreen(),
            OrderScreen.id: (context) => OrderScreen(),
            DetailsScreen.id: (context) => DetailsScreen(),
            AddressBookScreen.id: (context) => AddressBookScreen(),
          }),
    );
  }
}
