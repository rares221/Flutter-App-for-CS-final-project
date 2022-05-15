import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/screens/profile/my_profile.dart';
class Homescreen extends StatelessWidget{
 @override
  Widget singleProduct(){
   return  Container(
     margin: EdgeInsets.symmetric(horizontal: 10),
     height: 230,
     width: 160,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(10),
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Expanded(
           flex:2,
           child: Image.network(
             'https://www.seekpng.com/png/detail/19-191759_watercolor-plant-png-basil-leaves.png',
           ),
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Busuioc",style: TextStyle( fontWeight: FontWeight.bold,color: Colors.black),),
                 Text("50 de bani/legatura",style: TextStyle( color: Colors.black38),),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Expanded(
                       child: Container(
                         height: 20,
                         width: 60,
                         child: OutlinedButton(
                           style: OutlinedButton.styleFrom(
                             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                             side: BorderSide(color: Colors.green, width: 2),
                           ),
                           onPressed: () {},
                           child: Row(
                             children: [
                               Expanded(flex:10, child: Text("legatura",style: TextStyle(color: Colors.black,fontSize: 9),)),
                               Expanded(child: Icon(Icons.arrow_drop_down,color: Colors.green,size: 20,))
                             ],
                           ),
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         height: 20,
                         width: 60,
                         child: OutlinedButton(
                           style: OutlinedButton.styleFrom(
                             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                             side: BorderSide(color: Colors.green, width: 2),
                           ),
                           onPressed: () {},
                           child: Row(
                             children: [
                               Expanded(child: Icon(Icons.remove,color: Colors.green,size: 15,)),
                               Expanded(child: Text(" 1",style: TextStyle(color: Colors.black),)),
                               Expanded(child: Icon(Icons.add,color: Colors.green,size: 15,))
                             ],
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),

               ],
             ),
           ),
         )
       ],
     ),
   );
 }

  @override
  Widget listTile({IconData icon , String tile, Function onTap}){
   return ListTile(
     onTap: onTap ,
     leading: Icon(
        icon,
       size: 32,
     ),
     title: Text(tile , style: TextStyle(color: Colors.black), ),
   );
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xffd4d6d2),
     drawer: Drawer(
       child: Container(
         color: Colors.green,
         child: ListView(
           children: [
             DrawerHeader(
                 child: Row(
                  children: [
                  CircleAvatar(
                   backgroundColor: Colors.white54,
                    radius: 45,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xff08bf08),
                    ),

                  ),
                    SizedBox(
                     width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("   Bine ai venit!"),
                        SizedBox(height: 7,),
                        Container(
                          height: 25,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text("Autentificare", style: TextStyle(color: Colors.black),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                            )

                          ),
                        )
                      ],
                    )
                ],
              ),
             ),
             listTile(icon: Icons.home_outlined,tile:"Acasa"),
             listTile(icon: Icons.shopping_bag_outlined,tile:"Finalizare cos"),
             listTile(
                 icon: Icons.person_outlined,
                 tile:"Profil",
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfile(),),);
                 }
             ),
             listTile(icon: Icons.notifications_outlined,tile:"Notificari"),
             listTile(icon: Icons.star_outline,tile:"Rating"),
             listTile(icon: Icons.favorite_outline,tile:"Wishlist"),
             listTile(icon: Icons.copy_outlined,tile:"Plangeri&Reclamatii"),
             listTile(icon: Icons.format_quote_outlined,tile:"Intrebari comune"),

             Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               height: 350,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Contact", style: TextStyle(color: Colors.black),),
                   SizedBox(
                     height: 20,
                   ),
                   Row(

                     children: [
                       Text("Telefon:", style: TextStyle(color: Colors.black54),),
                       SizedBox(width: 25,),
                       Text("+075573827734", style: TextStyle(color: Colors.black54),)
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(

                     children: [
                       Text("Email:", style: TextStyle(color: Colors.black54),),
                       SizedBox(width: 15,),
                       Text("Piata_Hermes@retry.com", style: TextStyle(color: Colors.black54),)
                     ],
                   )
                 ],
               ),
             )

           ],

         ),
       ),

     ),
     appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.black),
       title: Text("Acasa", style: TextStyle(color: Colors.black),),
       backgroundColor: Color(0xff2ae840),
       actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: CircleAvatar(
             child: Icon(Icons.search,size: 17,color: Colors.black,),
             backgroundColor: Color(0xffc2fac8),
             radius: 12,
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 5),
           child: CircleAvatar(
             child: Icon(Icons.shop,size: 17,color: Colors.black,),
             backgroundColor: Color(0xffc2fac8),
             radius: 12,
           ),
         )
       ],
     ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
       child: ListView(
         children: [
           Container(
             height: 150,
             decoration: BoxDecoration(
               image: DecorationImage(
                 fit: BoxFit.cover,
                 image: NetworkImage('https://media.bzi.ro/unsafe/1060x600/smart/filters:contrast(3):format(jpeg):blur(1):quality(80)/http://www.bzi.ro/wp-content/uploads/2020/10/fructe-si-legume.jpg'),
               ),
               borderRadius: BorderRadius.circular(20),
             ),
             child: Row(
               children: [
                 Expanded( flex: 2,child: Container(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(right: 110),
                         child: Container(
                           width: 130,
                           height: 30,
                           decoration: BoxDecoration(
                               color: Color(0xff2ae840),
                                borderRadius: BorderRadius.only(
                                 bottomRight: Radius.circular(70),
                                  bottomLeft: Radius.circular(70),
                             )
                           ),
                           child: Center(
                             child: Text(
                               "Hermes",
                               style: TextStyle(fontSize: 15,
                                 color: Colors.white,
                                 shadows:[
                                   BoxShadow(
                                     blurRadius: 5,
                                     color: Colors.green.shade900,
                                     offset: Offset(3,3),

                                   ),
                                 ],
                               ),

                             ),
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                           "30% ",
                           style: TextStyle(fontSize: 50, color: Colors.white,fontWeight: FontWeight.bold),

                         ),

                       ),
                       Text(
                         "La toate legumele",
                         style: TextStyle(fontSize: 20, color: Colors.white,),
                       )
                     ],
                   ),

                 ),
                 ),
                 Expanded(child: Container(

                 ),
                 ),
               ],
             ),

           ),

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                     "La legatura",
                   style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 Text(
                   "Toate produsele",
                   style: TextStyle(color: Colors.grey),
                 ),


               ],

             ),
           ), //legatura
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),

               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   "Legume",
                   style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 Text(
                   "Toate produsele",
                   style: TextStyle(color: Colors.grey),
                 ),


               ],

             ),
           ), //legume
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),

               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   "Fructe",
                   style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 Text(
                   "Toate produsele",
                   style: TextStyle(color: Colors.grey),
                 ),


               ],

             ),
           ), //fructe
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),

               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   "De sezon",
                   style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 Text(
                   "Toate produsele",
                   style: TextStyle(color: Colors.grey),
                 ),


               ],

             ),
           ), //de sezon
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),
                 singleProduct(),

               ],
             ),
           ),


         ],
       ),
     ),

   );
  }
  
}