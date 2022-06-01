import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOutProvider with ChangeNotifier {
  bool loadingBuffer = false ;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController floor = TextEditingController();
  TextEditingController apartament = TextEditingController();
  TextEditingController areaCode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController other = TextEditingController();
  TextEditingController location = TextEditingController();

  void textValidator(context, currentType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nu ati introdus numele");
    } else if (lastName.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus prenumele");
    } else if (telephone.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus numarul de telefon");
    }else if (street.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus numele strazii");
    }else if (building.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus tipul cladirii ex: casa/bloc");
    }else if (floor.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus floorul / daca nu exista introduceti -");
    }else if (apartament.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus apartamentul / daca nu exista introduceti -");
    }else if (areaCode.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus codul Postal / daca nu doriti sa il impartasiti, introduceti -");
    }else if (city.text.isEmpty){
      Fluttertoast.showToast(msg: "Nu ati introdus orasul");
    }else if (other.text.isEmpty){
      Fluttertoast.showToast(msg: "Daca nu aveti nici o precizare introduceti -");
    }else {
      loadingBuffer =true;
      notifyListeners();
      await FirebaseFirestore
          .instance
          .collection("Addresses")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
            "firstName": firstName.text,
            "lastName": lastName.text,
            "telephone": telephone.text,
            "street":street.text,
            "building":building.text,
            "floor": floor.text,
            "apartament": apartament.text,
            "areaCode": areaCode.text,
            "city": city.text,
            "other": other.text,
            "addressType": currentType.toString(),
      }).then((value)async{
        loadingBuffer = false;
        notifyListeners();
         Fluttertoast.showToast(msg: "Adresa adaugata cu succes");
          Navigator.of(context).pop();
          notifyListeners();
      });
      notifyListeners();
    }



  }
}