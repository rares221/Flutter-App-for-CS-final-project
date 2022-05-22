import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';




enum SinginCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  ProductOverview({this.productImage, this.productName,this.productPrice, this.productId});

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SinginCharacter _character = SinginCharacter.fill;

  Widget bottomNavigatorBar({
    Color iconColor,
    Color backgroundColor,
    Color color,
    String title,
    IconData iconData,
  }) {
    return Expanded(
      child: Container(
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
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Adauga la favorite",
            iconData: Icons.favorite_outline,
          ),
          bottomNavigatorBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: Colors.white70,
            title: "Adauga in cos",
            iconData: Icons.shop_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "Detalii produs",
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
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(widget.productName),
                      subtitle: Text("Astazi doar  ${widget.productPrice} lei"),
                    ),
                  ),
                  Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(
                        widget.productImage ?? "",
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Disponibilitatea produsului",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
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
                              value: SinginCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Text("la doar ${widget.productPrice} lei"),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: primaryColor,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(color: primaryColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ListView(
                children: [
                  Text(
                    "About This Product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " O varietate de soiuri locale, recoltate in fiecare zi de producator si aduse in fata usii tale de cei mai pregatiti livratori ai nostrii. Comanda chiar astazi",
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}