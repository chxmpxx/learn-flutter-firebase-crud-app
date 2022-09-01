import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // กำหนดให้สามารถเรียกใช้ API แบบ https
  WidgetsFlutterBinding.ensureInitialized();

  // เรียกใช้ Firbase โดย initial ไว้ตรงนี้
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.teal
      ),
      home: HomeScreen(),
    );
  }
}
