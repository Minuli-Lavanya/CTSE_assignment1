import 'package:flutter/material.dart';
import 'package:meet_me/controller/meetingController.dart';

class ViewMeeting extends StatefulWidget {
  ViewMeeting({Key? key, required this.meeting, required this.db})
      : super(key: key);
  Map meeting;
  MeetingController db;

  @override
  _ViewMeetingState createState() => _ViewMeetingState();
}

class _ViewMeetingState extends State<ViewMeeting> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.meeting);
    titleController.text = widget.meeting['title'];
    locationController.text = widget.meeting['location'];
    dateController.text = widget.meeting['date'];
    timeController.text = widget.meeting['time'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text("Meeting Details"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                widget.db.delete(widget.meeting["id"]);
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
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Meeting title"),
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
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () {
                widget.db.update(
                    widget.meeting['id'],
                    titleController.text,
                    locationController.text,
                    dateController.text,
                    timeController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
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
