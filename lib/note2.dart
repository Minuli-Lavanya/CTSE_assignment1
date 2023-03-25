import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:lunch_partner/home.dart';
import 'package:lunch_partner/registration.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:telephony/telephony.dart';


import 'model/userModel.dart';
import 'notificationApi.dart';


class Not2Page extends StatefulWidget {
  const Not2Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Not2Page> createState() => _Not2PageState();
}

class _Not2PageState extends State<Not2Page> {
  final Telephony telephony = Telephony.instance;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _valueSms = TextEditingController();


  @override
  void initState() {
    super.initState();
    _phoneController.text = '+94717965299';
    _msgController.text = 'A new Lunch meeting has been added Check Meeting page for more details';
    _valueSms.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter the receivers Number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                        labelText: 'Number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _msgController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your message';
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Message Text',
                      labelText: 'Message Text',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => _sendSMS(), child: const Text('Send Sms')),
                ElevatedButton(onPressed: () => _getSMS(), child: const Text('Read SMS')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendSMS() async {
    int _sms = 0;
    while (_sms < int.parse(_valueSms.text)) {
      telephony.sendSms(to: _phoneController.text, message: _msgController.text);
      _sms ++;
    }
  }

  _getSMS() async {
    List<SmsMessage> _messages = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        filter: SmsFilter.where(SmsColumn.ADDRESS).equals(_phoneController.text)
    );

    for(var msg in _messages) {
      print(msg.body);
    }
  }
}