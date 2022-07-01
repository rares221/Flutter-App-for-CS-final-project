import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/models/delivery_address_model.dart';
import 'package:licenta_2022_vr/providers/check_out_provider.dart';
import 'package:licenta_2022_vr/screens/check_out/delivery/add_delivery_address.dart';
import 'package:licenta_2022_vr/screens/check_out/delivery/single_delivery_element.dart';
import 'package:licenta_2022_vr/screens/check_out/payment/payment_sumarry.dart';
import 'package:provider/provider.dart';
class DeliveryDetails extends StatefulWidget{

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAddressProvider =Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData() ;
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
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty? Text("Adauga o adresa noua"):Text("Finalizarea comenzii"),
          onPressed: (){
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliveryAddress(),
              ),
               ): Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaymentSumarry(deliveryAddressList: value),
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
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
                  ?Container(
                      child: Center(
                        child: Text("Nu aveti salvata nici o adresa"),
                      ),

              ):
          Column(
            children: deliveryAddressProvider.getDeliveryAddressList
                .map((e){
                  setState((){
                    value = e;

                  });
                  return SingleDeliveryElement(
                           address : "strada :${e.street}, cladirea: ${e.building},etajul: ${e.floor},apartamentul: ${e.apartament},cod postal: ${e.areaCode},orasul: ${e.city},alte mentiuni :${e.other}",
                          elementTitle: "${e.firstName} ,${e.lastName}",
                          number: e.telephone,
                    addressType: e.addressType == "AddressTypes.Acasa"
                        ? "Acasa"
                        : e.addressType == "AddressTypes.Altele"
                        ? "Altele"
                        : "Birou",

                         );
            }).toList(),

          )
        ],
      ),
    );
  }
}