

import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/screens/home/drawer_side.dart';
class MyProfile extends StatelessWidget{
 

  Widget listTile({IconData icon, String title }){
    return Column(
      children: [
        Divider(
          height: 1,
        ),

        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );

  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: primaryColor,
    appBar: AppBar(
      iconTheme: IconThemeData(color: textColor),
      backgroundColor: primaryColor,
      elevation: 0.0,
      title: Text(
          "Profilul tau",
        style: TextStyle(fontSize: 18, color: textColor),

      ),
    ),
    drawer: DrawerSide(),
     body: Stack(
       children: [
         Column(
           children: [
             Container(
               height: 100,
               color: primaryColor,
             ),

             Container(
               height: 500,
               width: double.infinity,
               padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
               decoration: BoxDecoration(
                 color: scaffoldBackgroundColor,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(30),
                 ),
               ),
               child: ListView(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Container(
                         width: 250,
                         height: 80,
                         padding: EdgeInsets.only(left: 20),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   "Vlasie Rares",
                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor
                                   ),
                                 ),
                                 SizedBox(height: 10,),
                                 Text("licentaVRtest1@gmail.com")
                                 

                               ],
                             ),
                             CircleAvatar(
                               radius: 15,
                               backgroundColor: primaryColor,
                               child: CircleAvatar(
                                 radius: 12,
                                 child: Icon(Icons.edit_outlined,color: textColor,),
                                 backgroundColor: scaffoldBackgroundColor,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   listTile(
                     icon: Icons.shop_outlined,
                     title: "Comenzile mele"
                   ),
                   listTile(
                       icon: Icons.location_on_outlined,
                       title: "Adresa mea"
                   ),
                   listTile(
                       icon: Icons.person_outlined,
                       title: "Recomanda unui prieten"
                   ),
                   listTile(
                       icon: Icons.file_copy_outlined,
                       title: "Termeni si conditii"
                   ),
                   listTile(
                       icon: Icons.policy_outlined,
                       title: "Securitatea contului"
                   ),
                   listTile(
                       icon: Icons.add_chart_outlined,
                       title: "Sabloanele comenzilor mele"
                   ),
                   listTile(
                       icon: Icons.exit_to_app_outlined,
                       title: "Log out"
                   ),
                 ],
               ),
             ),

           ],
         ),
         Padding(
           padding: const EdgeInsets.only(left:20, top:40),
           child: CircleAvatar(
             radius: 50,
             backgroundColor: primaryColor,
             child: CircleAvatar(
               backgroundImage: NetworkImage("https://www.shareicon.net/data/128x128/2016/05/26/771188_man_512x512.png") ,
               radius: 45,
               backgroundColor: scaffoldBackgroundColor,
             ),
           ),
         ),
       ],
     ),
   );
  }

}