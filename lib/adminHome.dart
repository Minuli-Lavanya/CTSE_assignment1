import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunch_partner/contacts.dart';
import 'package:lunch_partner/locations/locationsList.dart';
import 'package:lunch_partner/meeting/meetingList.dart';
import 'package:lunch_partner/profile.dart';
import 'package:lunch_partner/youScreen.dart';

import 'login.dart';
import 'model/userModel.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final handleLocation = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LocationList()));
          },
          child: Text(
            "Handle Location",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final handleContacts = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Contact()));
          },
          child: Text(
            "Handle Contact Details",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final handleUsers = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text(
            "Handle Users",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final adminProfile = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => YouScreen()));
          },
          child: Text(
            "Add Video",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final handleMeetings = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MeetingList()));
          },
          child: Text(
            "Handle Meetings",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final Logout = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            logout(context);
          },
          child: Text(
            "Log Out",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To MEET ME"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 190,
                child: Image.asset("assets/cv.png", fit: BoxFit.contain),
              ),
              Text(
                "Welcome To MEET ME Admin",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10,
              ),
              handleLocation,
              SizedBox(
                height: 10,
              ),
              handleContacts,
              SizedBox(
                height: 10,
              ),
              handleUsers,
              SizedBox(
                height: 10,
              ),
              adminProfile,
              SizedBox(
                height: 10,
              ),
              handleMeetings,
              SizedBox(
                height: 10,
              ),
              Logout,
              SizedBox(
                height: 10,
              ),
              // ActionChip(
              //     label: Text("Handle Locations"),
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => LocationList()));
              //     }),
              // ActionChip(
              //     label: Text("Handle Contact"),
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => Contact()));
              //     }),
              // ActionChip(
              //     label: Text("Handle Users"),
              //     onPressed: () {
              //       logout(context);
              //     }),
              // ActionChip(
              //     label: Text("Admin Profile"),
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => ProfileScreen()));
              //     }),
              // ActionChip(
              //     label: Text("Handle Meetings"),
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => MeetingList()));
              //     }),
              // ActionChip(
              //     label: Text("Log out"),
              //     onPressed: () {
              //       logout(context);
              //     }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
