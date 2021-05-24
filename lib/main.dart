import 'package:flutter/material.dart';
import 'package:shopplift/cart.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/cart_screen.dart';
import 'package:shopplift/checkout_screen.dart';
import 'package:shopplift/fav_screen.dart';
import 'package:shopplift/transfer_success_dialogue.dart';
import 'package:shopplift/welcome_screen.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

const primary = Color(0xFF2B18A3);
const primaryLight = Color(0xFF88C9FA);
Color primaryDark = Colors.blue.shade900;

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
          initialRoute: FancyDraw.id,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: _appTheme(),
          routes: {
            FancyDraw.id: (context) => FancyDraw(),
            FavScreen.id: (context) => FavScreen(),
            CheckOutScreen.id: (context) => CheckOutScreen(),
            CartScreen.id: (context) => CartScreen(),
            TransferSuccessDialogue.id: (context) => TransferSuccessDialogue(),
            WelcomeScreen.id: (context) => WelcomeScreen(),
          }),
    );
  }
}
