import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/models/review_cart_model.dart';
import 'package:licenta_2022_vr/providers/review_cart_provider.dart';
import 'package:licenta_2022_vr/screens/home/drawer_side.dart';
import 'package:licenta_2022_vr/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider= Provider.of(context);
    reviewCartProvider.getReviewCartData();
   return Scaffold(
     bottomNavigationBar: ListTile(
       title: Text("Suma totala",style: TextStyle(fontSize: 18,color: textColor),),
       subtitle:Text("170 de lei") ,
       trailing: Container(
         width: 160,
         child: MaterialButton(
           child: Text("Plateste",style: TextStyle(fontSize: 17),),
           color: primaryColor,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
           onPressed: (){

           },
         ),
       ),
     ),
     appBar: AppBar(
       iconTheme: IconThemeData(color: textColor),
       backgroundColor: primaryColor,
       elevation: 0.0,
       title: Text(
         "Cosul tau",
         style: TextStyle(fontSize: 18, color: textColor),

       ),
     ),
     drawer: DrawerSide(),
     body:reviewCartProvider.getReviewCartDataList.isEmpty?Center(
       child: Text("Nici un produs selectat"),
     ):
     ListView.builder(
       itemCount: reviewCartProvider.getReviewCartDataList.length,
       itemBuilder:(context,index) {
         ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
         return Column(
           children: [
           SizedBox(
                 height: 10,
             ),
          SingleItem(
                 validator: true,
                 productImage: data.cartImage,
                 productName: data.cartName,
                 productPrice: data.cartPrice,
                 productId: data.cartId,
                 productQuantity:data.cartQuantity,
              ),

           ],
         );
       },
       ),

     );


  }
  
}