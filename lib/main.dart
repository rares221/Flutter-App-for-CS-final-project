import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/screens/home/buffer.dart';
import 'package:licenta_2022_vr/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:licenta_2022_vr/screens/product_overview/product_overview.dart';
import 'package:licenta_2022_vr/screens/profile/my_profile.dart';
import 'auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Buffer(),
    );
  }
}

