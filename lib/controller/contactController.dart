import 'package:cloud_firestore/cloud_firestore.dart';

class ContactController {
  late FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future read() async {
    QuerySnapshot querySnapshot;
    List contacts = [];

    try{
      querySnapshot = await firestore.collection("contacts").orderBy('timestamps').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id":doc.id, "name": doc['name'], "number":doc["number"],"address":doc["address"],"email":doc["email"] };
          contacts.add(a);
        }
        return contacts;
      }
    }catch(e){
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("contacts").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String name, String number,String address, String email) async {
    try {
      await firestore
          .collection("contacts")
          .doc(id)
          .update({'name': name, 'number': number,'address':address,'email':email});
    } catch (e) {
      print(e);
    }
  }

  Future<void> create(String name, String number,String address,String email) async {
    try {
      await firestore.collection("contacts").add({
        'name': name,
        'number': number,
        'address': address,
        'email': email,
        'timestamps': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

}