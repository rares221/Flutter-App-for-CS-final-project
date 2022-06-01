import 'package:flutter/material.dart';

import '../../../config/colors.dart';

class PaymentSumarry extends StatefulWidget {
  @override
  State<PaymentSumarry> createState() => _PaymentSumarryState();
}

class _PaymentSumarryState extends State<PaymentSumarry> {
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
          "300 de lei",
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

                  ],
                    title: Text("Comanda numarul 86d34h")
                ),
              ],
            );
        },
        )
        ),

      );

  }
}
