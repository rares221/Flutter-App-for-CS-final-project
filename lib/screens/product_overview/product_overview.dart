import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/count.dart';
import '../review_cart/review_cart.dart';




enum SinginCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  final int productQuantity;
  ProductOverview({this.productImage, this.productName,this.productPrice,  this.productId, this.productQuantity});

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
    Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }

  bool wishListCheck=false;
  
  getWishListCheck(){
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .get().then((value) =>{
          value.docs.forEach((element) {
            if(this.mounted) {
              if (value != null) {
                setState(() {
                  wishListCheck = element.get("wishListAddedCheck");
                });
              }
            }
          })
    } );
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider=Provider.of(context);
    getWishListCheck();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Adauga la favorite",
            iconData:wishListCheck==false? Icons.favorite_outline:Icons.favorite,
            onTap: (){
              setState((){
                wishListCheck = !wishListCheck;
              });
              if (wishListCheck==true){
                wishListProvider.addWishListData(
                  wishListId: widget.productId,
                  wishListImage: widget.productImage,
                  wishListName: widget.productName,
                  wishListPrice: widget.productPrice,
                  wishListQuantity: widget.productQuantity,
                );
              }
            }
          ),
          bottomNavigatorBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: Colors.white70,
            title: "Mergi la cos",
            iconData: Icons.shop_outlined,
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewCart(),),);
              }
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
                        Count(
                          productId: widget.productId,
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productPrice: widget.productPrice,
                          productQuantity: 1,
                        ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 30,
                        //     vertical: 10,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Colors.grey,
                        //     ),
                        //     borderRadius: BorderRadius.circular(
                        //       30,
                        //     ),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.add,
                        //         size: 17,
                        //         color: primaryColor,
                        //       ),
                        //       Text(
                        //         "ADD",
                        //         style: TextStyle(color: primaryColor),
                        //       )
                        //     ],
                        //   ),
                        // ),
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