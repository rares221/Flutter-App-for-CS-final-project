import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
class SingleDeliveryElement extends StatelessWidget{
  final String elementTitle;
  final String address;
  final String addressType;
  final String number;

  const SingleDeliveryElement({this.elementTitle, this.address, this.addressType, this.number});
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       ListTile(
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(elementTitle),
             Container(
               width: 50,
               padding: EdgeInsets.all(1),
               height: 20,
               decoration: BoxDecoration(
                 color: primaryColor,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Center(
                 child: Text(
                   addressType,
                   style: TextStyle(
                   fontSize: 13,
                     color: Colors.white,
                 ),
                 ),
               ) ,
             ),
           ],
         ),
         leading: CircleAvatar(
           backgroundColor: primaryColor,
           radius: 8,
         ),
         subtitle: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(address),
             SizedBox(
               height: 5,
             ),
             Text(number)
           ],
         ),
       ),
       Divider(
         height: 35,
       )
     ],
   );
  }

}