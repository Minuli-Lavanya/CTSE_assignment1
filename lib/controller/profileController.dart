import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  late FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }


  Future<void> delete(String id) async {
    try {
      await firestore.collection("users").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future update(String uid, String email, String firstName, String secondName, String phoneNum) async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .update({
        email: 'email',
        firstName: 'firstName',
        secondName: 'secondName',
        phoneNum: 'phoneNum',});
    } catch (e) {
      print(e);
    }
  }

}