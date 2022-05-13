import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/screens/home/home_screen.dart';

import 'auth/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}

