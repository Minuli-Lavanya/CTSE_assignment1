
import 'package:flutter/material.dart';
import 'package:meet_me/controller/locationController.dart';
import 'package:meet_me/adminHome.dart';
import 'package:meet_me/controller/meetingController.dart';
import 'package:meet_me/locations/addLocation.dart';
import 'package:meet_me/locations/updateLocation.dart';
import 'package:meet_me/meeting/form.dart';
import 'package:meet_me/userHome.dart';

import 'meeting/meetingList.dart';

class LocationListHome extends StatefulWidget {
  const LocationListHome({Key? key}) : super(key:key);

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationListHome>{
  late LocationController db;
  late MeetingController mdb;
  List docs = [];

  initialise() {
    db = LocationController();
    mdb = MeetingController();
    mdb.initiliase();
    db.initiliase();
    db.read().then((value) => {
      setState((){
        docs = value;
      })
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => UserHome()));
            },
          ),
          centerTitle: true,
          title: Text('Location List'),
          backgroundColor: Colors.blueAccent,
      ),
      body:ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddMeeting(db: mdb,)))
                      .then((value) => {
                    if(value != null) {
                      initialise()
                    }
                  });
                },
                contentPadding: EdgeInsets.only(right: 30,left: 36),
                title: Text(docs[index]['name']),
                trailing: Text(docs[index]['city']),
              ),
            );
          }),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  _goBack(BuildContext context) {
    Navigator.pop(context);
  }
}