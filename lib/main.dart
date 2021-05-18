import 'package:flutter/material.dart';
import 'package:shopplift/cart.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/cart_screen.dart';
import 'package:shopplift/checkout_screen.dart';
import 'package:shopplift/fav_screen.dart';
import 'package:shopplift/transfer_success_dialogue.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            FancyDraw.id: (context) => FancyDraw(),
            FavScreen.id: (context) => FavScreen(),
            CheckOutScreen.id: (context) => CheckOutScreen(),
            CartScreen.id: (context) => CartScreen(),
            TransferSuccessDialogue.id: (context) => TransferSuccessDialogue(),
          }),
    );
  }
}
