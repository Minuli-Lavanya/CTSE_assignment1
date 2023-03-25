import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meet_me/userHome.dart';
import 'package:meet_me/registration.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'model/userModel.dart';
import 'notificationApi.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> recipents = ["0717965299"];
  String message = "this is a message";

  @override
  Widget build(BuildContext context) {
    final notificationButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () => NotificationApi.showNotification(
                title: 'New Lunch Meeting has been Added',
                body:
                    'Hey Users a New Lunch meeting has been added check meeting page for more details',
                payload: 'Dave.abs',
              ),
          child: Text(
            "notification",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 16),
                    notificationButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//login function
}

void _sendSMS(
  String message,
  List<String> recipents,
) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
