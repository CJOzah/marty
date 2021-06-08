import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  Future<QuerySnapshot> getImages() {
    return fb.collection("images").get();
  }

  var _image;

  Future getImage() async {
    final _picker = ImagePicker();
    var image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              FutureBuilder(
                future: getImages(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            title: Text(snapshot.data!.docs[index]["name"]),
                            leading: Image.network(
                                snapshot.data!.docs[index]["url"],
                                fit: BoxFit.fill),
                          );
                        });
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text("No data");
                  }
                  return CircularProgressIndicator();
                },
              ),
              ElevatedButton(child: Text("Pick Image"), onPressed: getImage),
              _image == null
                  ? Text('No image selected.')
                  : Image.file(
                      _image,
                      height: 300,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
