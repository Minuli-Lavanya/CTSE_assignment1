import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_me/controller/meetingController.dart';
import 'package:meet_me/meeting/datepicker.dart';
//import 'package:meet_me/meeting/displaydate.dart';
//import 'package:meet_me/meeting/timepicker.dart';
//import 'package:meet_me/meeting/displaydate.dart';
import 'package:meet_me/meeting/timepicker.dart';

class AddMeeting extends StatefulWidget {
  AddMeeting({Key? key, required this.db}) : super(key: key);
  MeetingController db;
  @override
  _AddMeetingState createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    locationController.text = "Devon";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("Add Invitation"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // widget.db.delete(widget.country["id"]);
                // Navigator.pop(context, true);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Invitation Title"),
                controller: titleController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Location"),
                controller: locationController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Date"),
                controller: dateController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Time"),
                controller: timeController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueAccent,
          child: MaterialButton(
              onPressed: () {
                widget.db.create(titleController.text, locationController.text,
                    dateController.text, timeController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
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
