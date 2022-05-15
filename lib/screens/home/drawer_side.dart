import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/screens/home/home_screen.dart';
import 'package:licenta_2022_vr/screens/profile/my_profile.dart';

class DrawerSide extends StatelessWidget{

  Widget listTile({IconData icon , String tile, Function onTap}){
    return ListTile(
      onTap: onTap ,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(tile , style: TextStyle(color: textColor), ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            listTile(
                icon: Icons.home_outlined,
                tile:"Acasa",
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homescreen(),),);
                }
            ),
            listTile(
                icon: Icons.shopping_bag_outlined,
                tile:"Finalizare cos",
            ),
            listTile(
                icon: Icons.person_outlined,
                tile:"Profil",
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfile(),),);
                }
            ),
            listTile(icon: Icons.notifications_outlined,
                tile:"Notificari"
            ),
            listTile(icon: Icons.star_outline,
                tile:"Rating"
            ),
            listTile(icon: Icons.favorite_outline,
                tile:"Wishlist"
            ),
            listTile(icon: Icons.copy_outlined,
                tile:"Plangeri&Reclamatii"
            ),
            listTile(icon: Icons.format_quote_outlined,
                tile:"Intrebari comune"
            ),

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

    );
  }

}