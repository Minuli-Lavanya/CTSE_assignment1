import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controller/locationController.dart';

class UpdateLocation extends StatefulWidget {
  UpdateLocation({ Key? key,  required this.locations,  required this.db}) : super(key: key);
  Map locations;
  LocationController db;
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<UpdateLocation> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.locations);
    nameController.text = widget.locations['name'];
    cityController.text = widget.locations['city'];
    codeController.text = widget.locations['code'];
    addressController.text = widget.locations['address'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(

        title: Text("Location Update"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                widget.db.delete(widget.locations["id"]);
                Fluttertoast.showToast(msg: "Location Deleted Successfully");
                Navigator.pop(context, true);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: inputDecoration("Place Name"),
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: inputDecoration("Place City"),
                controller: cityController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: inputDecoration("Place Code"),
                controller: codeController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: inputDecoration("Place Address"),
                controller: addressController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.blueAccent,
            child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                onPressed: () {
                  widget.db.update(widget.locations['id'], nameController.text, cityController.text, codeController.text, addressController.text);
                  Fluttertoast.showToast(msg: "Location Update Successfully");
                  Navigator.pop(context, true);
                },
                child: Text(
                  "Save and Update",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                )),
          )
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 4.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 3.0,
        ),
      ),
    );
  }
}