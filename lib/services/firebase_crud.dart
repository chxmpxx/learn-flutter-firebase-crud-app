import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCRUD {

  // collectionReference: สำหรับเข้าถึง collection บน FirebaseFirestore
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
  // ไว้อ่านข้อมูลจาก firebase
  Object? datas;

  // สร้างฟังก์ชันสำหรับเพิ่มข้อมูลใหม่
  addUser() async{
    Map<String, dynamic> mapData = {
      "id":"2",
      "firstname":"Miso",
      "lastname":"Somi",
      "age":"3"
    };
    collectionReference.add(mapData);
  }

  // สร้างฟังก์ชันสำหรับอ่านข้อมูล
  fetchUser() async {
    collectionReference.snapshots().listen((event) {
      datas = event.docs[1].data();
      print(datas);
    });    
  }

  // สร้างฟังก์ชันสำหรับแก้ไขข้อมูล
  updateUser() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.update({
      "firstname":"Chxmpxx",
      "lastname":"Arey",
      "age":"22"
    });
  }

  // สร้างฟังก์ชันสำหรับลบข้อมูล
  deleteUser() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.delete();
  }

}