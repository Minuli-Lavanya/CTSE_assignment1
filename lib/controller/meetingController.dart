
import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingController {
  late FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }


  Future read() async {
    QuerySnapshot querySnapshot;
    List docs = [];

    try{
      querySnapshot = await firestore.collection('meeting').orderBy('timestamp').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id":doc.id, "title": doc['title'], "location":doc["location"], "date":doc["date"], "time":doc["time"] };
          docs.add(a);
        }
        return docs;
      }
    }catch(e){
      print(e);
    }
  }


  Future<void> create(String title, String location, String date, String time) async {
    try {
      await firestore.collection("meeting").add({
        'title': title,
        'location': location,
        'date': date,
        'time': time,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("meeting").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
//ff
  Future<void> update(String id, String title, String location, String date, String time) async {
    try {
      await firestore
          .collection("meeting")
          .doc(id)
          .update({'title': title, 'location': location,'date':date,'time':time});
    } catch (e) {
      print(e);
    }
  }


}