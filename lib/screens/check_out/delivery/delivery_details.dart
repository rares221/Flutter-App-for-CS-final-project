import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/screens/check_out/delivery/add_delivery_address.dart';
import 'package:licenta_2022_vr/screens/check_out/delivery/single_delivery_element.dart';
import 'package:licenta_2022_vr/screens/check_out/payment/payment_sumarry.dart';
class DeliveryDetails extends StatelessWidget{
  List<Widget> addressMock =[
     SingleDeliveryElement(
     address : "Busteni 9 , Cluj-Napoca,",
     elementTitle: "Vlasie Rares",
     addressType: "Acasa",
     number: "074809823",
     )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );

        },
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "Detalii de livrare",
          style: TextStyle(fontSize: 18, color: textColor),

        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: addressMock.isEmpty? Text("Adauga o adresa noua"):Text("Finalizarea comenzii"),
          onPressed: (){
            addressMock.isEmpty
                ? Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliveryAddress(),
              ),
               ): Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaymentSumarry(),
              ),
            );

          },
          color: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Adresa de livrare: "),
            leading: Image.asset(
                "assets/pin.png",
                height: 35,

            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          Column(
            children: [
              addressMock.isEmpty
                  ?Container(

              )
                  : SingleDeliveryElement(
                address : "Busteni 9 , Cluj-Napoca,",
                elementTitle: "Vlasie Rares",
                addressType: "Acasa",
                number: "074809823",
              )

            ],
          )
        ],
      ),
    );
  }
  
}