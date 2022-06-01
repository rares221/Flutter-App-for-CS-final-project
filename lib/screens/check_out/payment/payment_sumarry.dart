import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/screens/check_out/payment/order_item.dart';

import '../../../config/colors.dart';

class PaymentSumarry extends StatefulWidget {
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
          "100 de lei",
          style: TextStyle(
            color: primaryColor,
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
        trailing: Container(
          width: 200,
          child: MaterialButton(
            onPressed: (){

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
                ListTile(
                  title: Text("Nume & Prenume"),
                  subtitle: Text("Strada, apartament, nr oras alte alea"),
                ),
                Divider(
                  height: 5,
                ),
                ExpansionTile(
                  children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),

                  ],
                    title: Text("Comanda numarul 86d34h")
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Sub Total",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text("85 de lei",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Taxa de livrare",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("15 lei",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Voucher",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("0 lei",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Tarif extravilan",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("0 lei",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Tarif greutate marita",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  trailing: Text("0 lei",style: TextStyle(fontWeight: FontWeight.bold),),
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
