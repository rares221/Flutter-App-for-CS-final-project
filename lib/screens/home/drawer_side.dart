import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/models/user_model.dart';
import 'package:licenta_2022_vr/providers/user_provider.dart';
import 'package:licenta_2022_vr/screens/home/home_screen.dart';
import 'package:licenta_2022_vr/screens/profile/my_profile.dart';
import 'package:licenta_2022_vr/screens/review_cart/review_cart.dart';
import 'package:provider/provider.dart';

import '../wish_list/wish_list.dart';

class DrawerSide extends StatefulWidget {

  UserProvider userProvider;
  DrawerSide({ this.userProvider});

  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {



  Widget listTile({String tile, IconData icon, Function onTap}) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 28,
        ),
        title: Text(
          tile,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        backgroundImage: NetworkImage(
                         userData.userImage ??
                              "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
                icon: Icons.home_outlined,
                tile: "Acasa",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen(),),);
                }
            ),

            listTile(
                icon: Icons.shopping_bag_outlined,
                tile: "Finalizare cos",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewCart(),),);
                }

            ),
            listTile(
                icon: Icons.person_outlined,
                tile: "Profil",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => MyProfile(userProvider:widget.userProvider),),);
                }
            ),
            listTile(icon: Icons.notifications_outlined,
                tile: "Notificari"
            ),
            listTile(icon: Icons.star_outline,
                tile: "Apreciaza-ne"
            ),
            listTile(
                icon: Icons.favorite_outline,
                tile: "Favorite",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WishLsit(),
                    ),
                  );
                }),
            listTile(icon: Icons.copy_outlined,
                tile: "Plangeri&Reclamatii"
            ),
            listTile(icon: Icons.format_quote_outlined,
                tile: "Intrebari comune"
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
                      Text(
                        "Telefon:", style: TextStyle(color: Colors.black54),),
                      SizedBox(width: 25,),
                      Text("+075573827734",
                        style: TextStyle(color: Colors.black54),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(

                    children: [
                      Text("Email:", style: TextStyle(color: Colors.black54),),
                      SizedBox(width: 15,),
                      Text("Piata_Hermes@gmail.com",
                        style: TextStyle(color: Colors.black54),)
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