import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseActionService {
  final VoidCallback onConnectionLost;

  FirebaseActionService(
    this.onConnectionLost,
  );
  //creates a document in the database and stores the cart items inside

}
