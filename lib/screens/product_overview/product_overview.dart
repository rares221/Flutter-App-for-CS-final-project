import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';

enum SignInCharacter {fill, outline}


class ProductOverview extends StatefulWidget{
  final String productImage;
  final String productName;
  ProductOverview( {this.productName, this.productImage} );

  @override
  _ProductOverviewState  createState() => _ProductOverviewState();

}

class _ProductOverviewState extends State<ProductOverview> {

  SignInCharacter _character = SignInCharacter.fill;

  Widget bottomNavBar({
    Color iconColor,
    Color backgroundColor,
    Color color,
    String title,
    IconData iconData,
  }) {
    return Expanded(child: Container(
      padding: EdgeInsets.all(20),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              iconData,
              size: 17,
              color: iconColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white70),
          )


        ],
      ),

    )
    );
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Adauga la favorite",
            iconData: Icons.favorite_outline,
          ),
          bottomNavBar(
            backgroundColor: primaryColor,
            color: Colors.white70,
            iconColor: Colors.black,
            title: "Adauga in cos",
            iconData: Icons.shopping_cart_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.green,

        title: Text(
            "Detaliile produsului",
          style: TextStyle(color: textColor),
        ),

      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text( "Busuioc"),// widget.productImage ?? "" de inlocuit cu asta cand e gata homepage
                      subtitle: Text("50 de bani / legaura"),
                    ),
                    Container(
                      height: 220,
                      width: double.infinity,
                      padding: EdgeInsets.all(40),
                      child: Image.network('https://www.seekpng.com/png/detail/19-191759_watercolor-plant-png-basil-leaves.png',) ,//widget.productImage??"" si aici la fel
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        "Disponibilitatea produsului",
                        textAlign:TextAlign.start,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),

                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                              Radio(
                                value: SignInCharacter.fill,
                                groupValue: _character,
                                activeColor: Colors.green[700] ,
                                onChanged:(value) {
                                  setState((){
                                    _character = value;
                                  });

                                },
                              ),

                            ],
                          ),
                          Text("50 de bani"),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,color: primaryColor,),
                                Text("Adauga"),

                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),

          )
          ),
          Expanded(child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Despre produs", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("O varietate de sortimente crescute in toate zonele tarii. Adus zilnic in cele mai bune conditii de la crescator direct la usa clientului."),

              ],
            ),
          ),
          )
        ],
      ),

    );

  }

}