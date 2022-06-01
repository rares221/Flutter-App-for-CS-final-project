import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/providers/check_out_provider.dart';
import 'package:licenta_2022_vr/screens/check_out/map_dir/custom_google_map.dart';
import 'package:provider/provider.dart';

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
    CheckOutProvider checkOutProvider= Provider.of(context);
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
          child:checkOutProvider.loadingBuffer ==false ? MaterialButton(
            onPressed: (){
              checkOutProvider.textValidator(context, currentType);
            },
            child: Text("Adauga ca adresa noua" ,style: TextStyle(color: textColor),),
            color: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ): Center(
            child: CircularProgressIndicator(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: ListView(
              children: [
                CustomTextField(
                  customText: "Nume",
                  controller: checkOutProvider.firstName,
                ),
                CustomTextField(
                  customText: "Prenume",
                  controller: checkOutProvider.lastName,
                ),
                CustomTextField(
                  customText: "Numar de telefon",
                  controller: checkOutProvider.telephone,
                ),

                CustomTextField(
                  customText: "Strada",
                  controller: checkOutProvider.street,
                ),
                CustomTextField(
                  customText: "Cladire",
                  controller: checkOutProvider.building,
                ),
                CustomTextField(
                  customText: "Etaj",
                  controller: checkOutProvider.floor,
                ),
                CustomTextField(
                  customText: "Apartament",
                  controller: checkOutProvider.apartament,
                ),
                CustomTextField(
                  customText: "Cod postal (optional)",
                  controller: checkOutProvider.areaCode,
                ),
                CustomTextField(
                  customText: "Oras",
                  controller: checkOutProvider.city,
                ),
                CustomTextField(
                  customText: "Alte precizari (ex: un lift defect)",
                  controller: checkOutProvider.other,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomGoogleMap(),),);
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