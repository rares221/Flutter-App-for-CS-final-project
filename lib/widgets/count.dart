import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';

class Count extends StatefulWidget {

  String productName;
  String productImage;
  String productId;
  String productQuantity;
  int productPrice;
  Count({this.productName, this.productImage, this.productId, this.productQuantity,this.productPrice,});

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool checker = false;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider=Provider.of(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: checker == true
          ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
           InkWell(
            onTap: () {
              if (count > 1) {
                setState(() {
                  count--;
                });
              }
              if (count == 1) {
                setState(() {
                  checker = false;
                });
              }
            },
             child: Icon(
              Icons.remove,
              size: 15,
              color: primaryColor,
            ),
          ),
           Text(
            "$count",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
            InkWell(
            onTap: () {
              setState(() {
                count++;
              });
             },
             child: Icon(
               Icons.add,
               size: 15,
               color: primaryColor,
             ),
            ),
          ],
        )
          : Center(
            child: InkWell(
             onTap: () {
              setState(() {
               checker = true;
              });
               reviewCartProvider.addReviewCartData(
                 cartId: widget.productId,
                 cartImage: widget.productImage,
                 cartName: widget.productName,
                 cartPrice:widget.productPrice,
                 cartQuantity: count,
               );
            },
             child: Text(
              "Adauga",
              style: TextStyle(color: primaryColor),
            ),
          ),
      ),
    );
  }
}