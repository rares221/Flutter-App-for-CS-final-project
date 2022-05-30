import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../models/product_model.dart';
import '../../widgets/single_item.dart';

class WishLsit extends StatefulWidget {
  @override
  _WishLsitState createState() => _WishLsitState();
}

class _WishLsitState extends State<WishLsit> {
  WishListProvider wishListProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Nu mersi"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continua"),
      onPressed: () {
        wishListProvider.deleteWishtList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Produsul favorit"),
      content: Text("Sunteti sigur(a) ca doriti sa stergeti acest produs din lsita de produse favorite?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishtListData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "Favorite",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: wishListProvider.getWishList.isEmpty?Center(
        child: Text("Nici un produs favorit"),
      ): ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                wishListCheck: true,
                validator: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context,data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}