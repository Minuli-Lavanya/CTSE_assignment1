
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationController {
  late FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future read() async {
    QuerySnapshot querySnapshot;
    List docs = [];

    try{
      querySnapshot = await firestore.collection('locations').orderBy('timestamp').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id":doc.id, "name": doc['name'], "city":doc["city"], "code":doc["code"], "address": doc["address"]  };
          docs.add(a);
        }
        return docs;
      }
    }catch(e){
      print(e);
    }
  }

  Future<void> create(String name, String city, String code, String address) async {
    try {
      await firestore.collection("locations").add({
        'name': name,
        'city': city,
        'code': code,
        'address': address,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("locations").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String name, String city, String code, String address) async {
    try {
      await firestore
          .collection("locations")
          .doc(id)
          .update({'name': name, 'city': city, 'code': code, 'address': address,});
    } catch (e) {
      print(e);
    }
  }


}