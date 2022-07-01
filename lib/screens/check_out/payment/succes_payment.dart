import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/screens/home/home_screen.dart';

class CustomSplash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:

         Column(
          children: [
            Image.asset('assets/check.gif'),
            const Text("Comanda a fost plasata cu succes", style: TextStyle(color: Colors.black,fontSize: 20),)
          ],
        ),
        backgroundColor: Colors.white,
        nextScreen: HomeScreen(),
      splashIconSize: 250,
    );
  }

}