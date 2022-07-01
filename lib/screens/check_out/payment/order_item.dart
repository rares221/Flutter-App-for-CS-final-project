import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/models/review_cart_model.dart';
import 'package:licenta_2022_vr/providers/review_cart_provider.dart';
class OrderItem extends StatelessWidget{
  bool activeItem ;
  final ReviewCartModel e;
  OrderItem({this.e});
  @override
  Widget build(BuildContext context) {
   return ListTile(
     leading: Image.network(
     e.cartImage,
     width: 60,
     ),
     title: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(e.cartName, style: TextStyle(color: Colors.grey[600]),),
         Text("${e.cartUnit}", style: TextStyle(color: Colors.grey[600]),),
         Text("${e.cartPrice} lei ", style: TextStyle(color: Colors.grey[600]),),
       ],
     ),
     subtitle: Text("${e.cartQuantity} in cos") ,
   );
  }

}