import 'dart:io';
import 'package:flutter/material.dart';
import 'package:native_features/Widgets/add_image.dart';
import 'package:native_features/Provider/PLaces_Provider.dart';
import 'package:provider/provider.dart';
import 'package:native_features/Widgets/location_input.dart';

class add_Product_screen extends StatefulWidget {
  static const routee = '/add-place';
  static String Add = '';

  @override
  _add_Product_screenState createState() => _add_Product_screenState();
}

class _add_Product_screenState extends State<add_Product_screen> {
  final _Textcontroller1 = TextEditingController();
  final _Textcontroller2 = TextEditingController();
  final _Textcontroller3 = TextEditingController();
  late File _image_taken;
  void _loadplace(File image_taken) {
    _image_taken = image_taken;
  }

  void _saveplace() {
    if (_Textcontroller1.text.isEmpty ||
        _image_taken == null ||
        _Textcontroller2.text.isEmpty ||
        _Textcontroller3.text.isEmpty) {
      return;
    }
    Provider.of<Places_Provider>(context, listen: false).getplace(
      _Textcontroller1.text,
      _image_taken,
      _Textcontroller2.text,
      _Textcontroller3.text,
      add_Product_screen.Add,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Container(
              padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: Text("Add a Video")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'NewYear Celebration',
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        controller: _Textcontroller1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Descriptor',
                          hintText: 'Thank You 2022',
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        controller: _Textcontroller2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          hintText: 'Celebration',
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        controller: _Textcontroller3,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                          child: Add_image(_loadplace)),
                      SizedBox(
                        width: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LocationPage(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _saveplace,
              icon: Icon(Icons.add_outlined),
              label: Text("Add Place"),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent, // background
                onPrimary: Colors.white, // foreground
              ),
            ),
          ],
        ));
  }
}
