import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadScreen extends StatefulWidget {
  PhotoUploadScreen({Key? key}) : super(key: key);

  @override
  State<PhotoUploadScreen> createState() => _PhotoUploadScreenState();
}

class _PhotoUploadScreenState extends State<PhotoUploadScreen> {

  // ตัวแปรไว้อ่าน path ไฟล์ในเครื่อง
  File? _imageFile;

  // สร้าง Object สำหรับเลือกรูปภาพ
  final picker = ImagePicker();

  // ฟังก์ชันเปิดจากแกลเลอรี่
  _openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }else {
        print('No Image selected');
      }
    });
    Navigator.of(context).pop();
  }
    // ฟังก์ชันเปิดจากกล้อง
  _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }else {
        print('No Image selected');
      }
    });
    // ปิดหน้าต่าง Pop-up
    Navigator.of(context).pop();
  }

  // สร้าง Pop-up เลือกช่องทางในการดึงรูป
  // ต้องเป็น Future เพราะมีการอ่าน path รูปเข้ามา
  Future<void> _showButtomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Wrap: ให้อยู่บรรทัดเดียวกัน
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Gallery'),
                onTap: (){
                  _openGallery(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: (){
                  _openCamera(context);
                },
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image to Firebase'),
        backgroundColor: Colors.pink[300],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _imageFile != null ? Image.file(_imageFile!, width: 400, height: 400,) : Text('ยังไม่มีการเลือกรูป'),
              _imageFile != null ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: (){},
                    child: Text('Upload to firebase'),
                  ),
                  RaisedButton(
                    onPressed: (){},
                    child: Text('Clear Image'),
                  ),
                ],
              ) : Container(),
              RaisedButton(
                onPressed: (){
                  _showButtomSheet(context);
                },
                color: Colors.pink[300],
                child: Text('Select Image', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        )
      ),
    );
  }
}