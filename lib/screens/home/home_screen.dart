import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/providers/product_provider.dart';
import 'package:licenta_2022_vr/providers/user_provider.dart';
import 'package:licenta_2022_vr/screens/home/drawer_side.dart';
import 'package:licenta_2022_vr/screens/home/single_product.dart';
import 'package:licenta_2022_vr/screens/home/sinlge_product_kg.dart';
import 'package:licenta_2022_vr/screens/product_overview/product_overview.dart';
import 'package:licenta_2022_vr/screens/profile/my_profile.dart';
import 'package:licenta_2022_vr/screens/search/search.dart';
import 'package:provider/provider.dart';

import '../review_cart/review_cart.dart';
class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProductProvider productProvider;
  UserProvider userProvider;

 @override




  Widget _buildHerbProducts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('La legatura'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                       search: productProvider.getHerbProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'toate produsele',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbProductDataList.map(
                  (herbsProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productPrice: herbsProductData.productPrice,
                          productName: herbsProductData.productName,
                          productImage: herbsProductData.productImage,
                          productId: herbsProductData.productId,
                          productQuantity: herbsProductData.productQuantity,
                        ),
                      ),
                    );
                  },
                  productId: herbsProductData.productId,
                  productPrice: herbsProductData.productPrice,
                  productImage: herbsProductData.productImage,
                  productName: herbsProductData.productName,
                  productQuantity: herbsProductData.productQuantity,
                );
              },
            ).toList(),
            // children: [

            // ],
          ),
        ),
      ],
    );
  }

  Widget _buildFruitProducts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fructe'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getFruitProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'toate produsele',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFruitProductDataList.map(
                  (fruitProductData) {
                    return SingleProduct(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productPrice: fruitProductData.productPrice,
                              productName: fruitProductData.productName,
                              productImage: fruitProductData.productImage,
                              productId: fruitProductData.productId,
                              productQuantity: fruitProductData.productQuantity,
                            ),
                          ),
                        );
                      },
                      productPrice: fruitProductData.productPrice,
                      productImage: fruitProductData.productImage,
                      productName: fruitProductData.productName,
                      productId: fruitProductData.productId,
                      productQuantity: fruitProductData.productQuantity,
                    );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSeasonProducts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('De sezon'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getSeasonProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'toate produsele',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getSeasonProductDataList.map(
                  (seasonProductData) {
                    return SingleProduct(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productPrice: seasonProductData.productPrice,
                              productName: seasonProductData.productName,
                              productImage: seasonProductData.productImage,
                              productId: seasonProductData.productId,
                              productQuantity: seasonProductData.productQuantity,
                            ),
                          ),
                        );
                      },
                      productPrice: seasonProductData.productPrice,
                      productImage: seasonProductData.productImage,
                      productName: seasonProductData.productName,
                      productId: seasonProductData.productId,
                      productQuantity: seasonProductData.productQuantity,
                    );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildVegiProducts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Legume'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getVegiProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'toate produsele',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getVegiProductDataList.map(
                  (vegiProductData) {
                    return SingleProduct(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productPrice: vegiProductData.productPrice,
                              productName: vegiProductData.productName,
                              productImage: vegiProductData.productImage,
                              productId: vegiProductData.productId,
                             productQuantity: vegiProductData.productQuantity,
                            ),
                          ),
                        );
                      },
                      productPrice: vegiProductData.productPrice,
                      productImage: vegiProductData.productImage,
                      productName: vegiProductData.productName,
                      productId: vegiProductData.productId,
                      productQuantity: vegiProductData.productQuantity,

                    );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbProductData();
    productProvider.fetchFruitProductData();
    productProvider.fetchVegiProductData();
    productProvider.fetchSeasonProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    userProvider = Provider.of(context);
    userProvider.getUserData();
   return Scaffold(
     backgroundColor: Color(0xffd4d6d2),
     drawer: DrawerSide(
       userProvider: userProvider ,
     ),
     appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.black),
       title: Text("Acasa", style: TextStyle(color: Colors.black),),
       backgroundColor: Color(0xff2ae840),
       actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: CircleAvatar(
             child: IconButton(
               padding: EdgeInsets.zero,
               icon: Icon(
                 Icons.search,size: 17,
                 color: Colors.black,),
               onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search(search: productProvider.search,),),);
               },
             ),
             backgroundColor: Color(0xffc2fac8),
             radius: 12,
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 5),
           child: GestureDetector(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewCart(),),);
             },
             child: CircleAvatar(
               child: Icon(Icons.shop,size: 17,color: Colors.black,),
               backgroundColor: Color(0xffc2fac8),
               radius: 12,
             ),
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
                           "60% ",
                           style: TextStyle(fontSize: 50, color: Colors.white,fontWeight: FontWeight.bold),

                         ),

                       ),
                       Text(
                         "La Toate legumele",
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

           _buildHerbProducts(context),

           _buildVegiProducts(context),

          _buildFruitProducts(context),

          _buildSeasonProducts(context),


         ],
       ),
     ),

   );
  }
}