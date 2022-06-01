import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/providers/check_out_provider.dart';
import 'package:licenta_2022_vr/providers/product_provider.dart';
import 'package:licenta_2022_vr/providers/review_cart_provider.dart';
import 'package:licenta_2022_vr/providers/user_provider.dart';
import 'package:licenta_2022_vr/providers/wish_list_provider.dart';
import 'package:licenta_2022_vr/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:licenta_2022_vr/screens/product_overview/product_overview.dart';
import 'package:licenta_2022_vr/screens/profile/my_profile.dart';
import 'package:licenta_2022_vr/screens/review_cart/review_cart.dart';
import 'package:provider/provider.dart';
import 'auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
           ChangeNotifierProvider<ProductProvider>(
              create: (context)=>ProductProvider(),
           ),
          ChangeNotifierProvider<UserProvider>(
            create: (context)=>UserProvider(),
          ),
          ChangeNotifierProvider<ReviewCartProvider>(
            create: (context)=>ReviewCartProvider(),
          ),
          ChangeNotifierProvider<WishListProvider>(
            create: (context)=>WishListProvider(),
          ),
          ChangeNotifierProvider<CheckOutProvider>(
            create: (context)=>CheckOutProvider(),
          ),
    ],

        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return HomeScreen();
            }
            return SignIn();
          },
        ),
      ),
    );
  }
}

