import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_me/locationListHome.dart';
import 'package:meet_me/locations/locationsList.dart';
import 'package:meet_me/profile.dart';

import 'contacts/contactsList.dart';
import 'login.dart';
import 'meeting/meetingList.dart';
import 'model/userModel.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
    final viewContacts = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ContactList()));
          },
          child: Text(
            "View Contacts",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final yourMeeting = Material(
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
            "Your Meeting",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final profile = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          child: Text(
            "Profile",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final addMeeting = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LocationListHome()));
          },
          child: Text(
            "Add Meeting",
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
            "Logout",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 350,
                child: Image.asset("assets/cv.png", fit: BoxFit.contain),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 80,
              ),
              viewContacts,
              SizedBox(height: 10),
              yourMeeting,
              SizedBox(height: 10),
              profile,
              SizedBox(height: 10),
              addMeeting,
              SizedBox(height: 10),
              Logout
              // ActionChip(
              //     label: Text("View Contacts"),
              //     backgroundColor: Colors.teal[100],
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => ContactList()));
              //     }),
              // ActionChip(
              //     label: Text("Your Meetings"),
              //     backgroundColor: Colors.teal[100],
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => MeetingList()));
              //     }),
              // ActionChip(
              //     label: Text("Profile"),
              //     backgroundColor: Colors.teal[100],
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => ProfileScreen()));
              //     }),
              // ActionChip(
              //     label: Text("Add meeting"),
              //     backgroundColor: Colors.teal[100],
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(builder: (context) => LocationListHome()));
              //     }),
              // ActionChip(
              //     label: Text("Logout"),
              //     backgroundColor: Colors.teal[100],
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
