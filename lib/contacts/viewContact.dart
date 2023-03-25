import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../controller/contactController.dart';

class ViewContact extends StatefulWidget {
  ViewContact({Key? key, required this.contact, required this.db}) : super(key:key);
  Map contact;
  ContactController db;

  @override
  _ViewContactState createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.contact);
    nameController.text = widget.contact['name'];
    numberController.text = widget.contact['number'];
    addressController.text = widget.contact['address'];
    emailController.text = widget.contact['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(

        title: Text("Contact Details"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                widget.db.delete(widget.contact["id"]);
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
                decoration: inputDecoration("Contact Name"),
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: inputDecoration("Contact Number"),
                controller: numberController,

              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 20, ),
                decoration: inputDecoration("Address"),
                controller: addressController,
              ), SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: inputDecoration("Email"),
                controller: emailController,
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
                widget.db.update(widget.contact['id'], nameController.text,
                    numberController.text,addressController.text,emailController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              )),
          )
        ),
      )
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black,),
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