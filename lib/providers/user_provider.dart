import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier{
  void addUserData({User currentUser,String userName, String userImage, String userEmail}) async{
    await FirebaseFirestore.instance.collection("UserData").doc(currentUser.uid).set(
        {
          "userName": userImage,
          "userEmail":userEmail,
          "userImage": userImage,
          "userUid": currentUser.uid,
        },
    );
  }
}