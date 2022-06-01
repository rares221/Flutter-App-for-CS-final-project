import 'package:flutter/material.dart';

import '../../../config/colors.dart';
import '../../../widgets/custom_text_field.dart';

class AddDeliveryAddress extends StatefulWidget{
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressTypes{
  Acasa,
  Birou,
  Altele
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var currentType= AddressTypes.Acasa;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: primaryColor,
          elevation: 0.0,
          title: Text(
            "Adresa ta noua",
            style: TextStyle(fontSize: 18, color: textColor),

          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          width: 48,
          child: MaterialButton(
            onPressed: (){

            },
            child: Text("Adauga ca adresa noua" ,style: TextStyle(color: textColor),),
            color: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: ListView(
              children: [
                CustomTextField(
                  customText: "Nume",
                ),
                CustomTextField(
                  customText: "Prenume",
                ),
                CustomTextField(
                  customText: "Numar de telefon",
                ),
                CustomTextField(
                  customText: "Cladire",
                ),
                CustomTextField(
                  customText: "Strada",
                ),
                CustomTextField(
                  customText: "Etaj",
                ),
                CustomTextField(
                  customText: "Apartament",
                ),
                CustomTextField(
                  customText: "Cod postal (optional)",
                ),
                CustomTextField(
                  customText: "Oras",
                ),
                CustomTextField(
                  customText: "Alte precizari (ex: un lift defect)",
                ),
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                    height: 45,
                      width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Adauga locatia curenta", style: TextStyle(color: Colors.blue),),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(" Adauga tipul adresei setate"),
                ),
                RadioListTile(
                    value: AddressTypes.Acasa,
                    groupValue: currentType,
                    title: Text("Acasa"),
                  onChanged: (AddressTypes value){
                    setState((){
                      currentType = value;
                    });

                  },
                  secondary: Icon(Icons.home_outlined, color: Colors.black,),
                ),
                RadioListTile(
                  value: AddressTypes.Birou,
                  groupValue: currentType,
                  title: Text("Birou"),
                  onChanged: (AddressTypes value){
                    setState((){
                      currentType = value;
                    });

                  },
                  secondary: Icon(Icons.work_outline, color: Colors.black,),
                ),
                RadioListTile(
                  value: AddressTypes.Altele,
                  groupValue: currentType,
                  title: Text("Alt tip de adresa"),
                  onChanged: (AddressTypes value){
                    setState((){
                      currentType = value;
                    });

                  },
                  secondary: Icon(Icons.sticky_note_2_outlined, color: Colors.black,),
                ),

              ],
          ),
        ),
      );
  }
}