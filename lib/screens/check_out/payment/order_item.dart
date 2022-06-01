import 'package:flutter/material.dart';
class OrderItem extends StatelessWidget{
  bool activeItem ;
  @override
  Widget build(BuildContext context) {
   return ListTile(
     leading: Image.network("https://toppng.com/uploads/preview/potato-11526060716nzbs5sjigo.png",
     width: 60,
     ),
     title: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text("cartofi noi", style: TextStyle(color: Colors.grey[600]),),
         Text("unitate", style: TextStyle(color: Colors.grey[600]),),
         Text("pret", style: TextStyle(color: Colors.grey[600]),),
       ],
     ),
     subtitle: Text("cantitate") ,
   );
  }

}