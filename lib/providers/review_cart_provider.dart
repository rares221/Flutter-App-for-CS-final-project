import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:licenta_2022_vr/models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    String cartId,
    String cartName,
    String cartImage,
    int cartPrice,
    int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourCartReview")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,

      },
    );
  }

  List<ReviewCartModel> reviewCartDataList=[];

   void getReviewCartData() async{
     List<ReviewCartModel> newList=[];
     QuerySnapshot reviewCartValues= await  FirebaseFirestore.instance
         .collection("ReviewCart")
         .doc(FirebaseAuth.instance.currentUser.uid)
         .collection("YourCartRevie")
         .get();
     reviewCartValues.docs.forEach((element) {
       ReviewCartModel reviewCartModel=ReviewCartModel(
         cartId: element.get("cartId"),
         cartName: element.get("cartName"),
         cartImage: element.get("cartImage"),
         cartPrice: element.get("cartPrice"),
         cartQuantity: element.get("cartQuantity")
       );
       newList.add(reviewCartModel);

     });
     reviewCartDataList=newList;
     notifyListeners();
   }

  List<ReviewCartModel> get  getReviewCartDataList{
    return reviewCartDataList;
   }


}


