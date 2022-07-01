import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:licenta_2022_vr/models/delivery_address_model.dart';
import 'package:licenta_2022_vr/providers/check_out_provider.dart';
import 'package:licenta_2022_vr/providers/product_provider.dart';
import 'package:licenta_2022_vr/providers/review_cart_provider.dart';
import 'package:licenta_2022_vr/screens/check_out/delivery/single_delivery_element.dart';

import 'package:licenta_2022_vr/screens/check_out/payment/order_item.dart';
import 'package:licenta_2022_vr/screens/check_out/payment/succes_payment.dart';
import 'package:licenta_2022_vr/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../../config/colors.dart';

class PaymentSumarry extends StatefulWidget {

  final DeliveryAddressModel deliveryAddressList;
  PaymentSumarry({this.deliveryAddressList});


  @override
  State<PaymentSumarry> createState() => _PaymentSumarryState();
}
enum PaymentOptions{
  Ramburs,
  Card,
}


class _PaymentSumarryState extends State<PaymentSumarry> {
  var currentType= PaymentOptions.Ramburs;



  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider=Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double total = reviewCartProvider.getTotalPrice();
    double discount=15;
    double shipping =10;
    double discountValue;
    double totalPrice;
    double outsideCityShipping;
    if(total>100) {
       discountValue = (total * discount) / 100;
       totalPrice = total - discountValue;
    } else {
      discountValue = 0;
    }

    double heavyShipping;
    if(total >350){
      heavyShipping =10;
    }else{
      heavyShipping =0;
    }

      outsideCityShipping=0;

    //distance based to do


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "Finalizare Comanda",
          style: TextStyle(fontSize: 18, color: textColor),

        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Suma totala"),
        subtitle: Text(
          "${total+ heavyShipping+ outsideCityShipping+shipping??totalPrice+ heavyShipping+ outsideCityShipping+shipping} lei",
          style: TextStyle(
            color: primaryColor,
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
        trailing: Container(
          width: 200,
          child:  MaterialButton(
            onPressed: (){
               reviewCartProvider.deleteCompleteCartData();
              if(currentType==PaymentOptions.Card){
                Fluttertoast.showToast(msg: "Momentan plata cu cardul nu este disponibila in zona dumneavoastra");
              }else{
                reviewCartProvider.deleteCompleteCartData();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomSplash(),),);

              }




            },
            child: Text("Accepta si finalizeaza", style: TextStyle(color: textColor),),
            color: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context ,index){
            return Column(
              children: [
                SingleDeliveryElement(
                address : "strada :${widget.deliveryAddressList.street}, cladirea: ${widget.deliveryAddressList.building},etajul: ${widget.deliveryAddressList.floor},apartamentul: ${widget.deliveryAddressList.apartament},cod postal: ${widget.deliveryAddressList.areaCode},orasul: ${widget.deliveryAddressList.city},alte mentiuni :${widget.deliveryAddressList.other}",
                  elementTitle: "${widget.deliveryAddressList.firstName} ,${widget.deliveryAddressList.lastName}",
                  number: widget.deliveryAddressList.telephone,
                  addressType: widget.deliveryAddressList.addressType == "AddressTypes.Acasa"
                      ? "Acasa"
                      : widget.deliveryAddressList.addressType == "AddressTypes.Altele"
                      ? "Altele"
                      : "Birou",

                ),
                Divider(
                  height: 5,
                ),
                ExpansionTile(
                  children: reviewCartProvider.getReviewCartDataList
                      .map((e){
                        return OrderItem(e:e);
                  })
                      .toList(),
                    title: Text("Lista contine ${reviewCartProvider.getReviewCartDataList.length} produse")
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Sub Total",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text("${total} lei",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Taxa de livrare",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("${shipping} lei",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Voucher",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("${discountValue} lei",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Tarif extravilan",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("${outsideCityShipping} lei ",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Tarif greutate marita",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("${heavyShipping} lei",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Divider(),
                ListTile(
                  leading: Text("Modlaitate de Plata"),
                ),
                RadioListTile(
                  value: PaymentOptions.Ramburs,
                  groupValue: currentType,
                  title: Text("Ramburs"),
                  onChanged: (PaymentOptions value){
                    setState((){
                      currentType = value;
                    });

                  },
                  secondary: Icon(Icons.money, color: Colors.black,),
                ),
                RadioListTile(
                  value: PaymentOptions.Card,
                  groupValue: currentType,
                  title: Text("Card"),
                  onChanged: (PaymentOptions value){
                    setState((){
                      currentType = value;
                    });

                  },
                  secondary: Icon(Icons.credit_card, color: Colors.black,),
                ),

              ],
            );
        },
        )
        ),

      );

  }
}
