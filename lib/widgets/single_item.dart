import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
class SingleItem extends StatelessWidget{

  String productImage;
  String productName;
  int productPrice;
  bool validator= false;
  String productId;
  int productQuantity;
  SingleItem({this.validator, this.productPrice, this.productImage ,this.productName,this.productId,this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                height: 80,
                  child: Center(
                    child: Image.network(productImage),
                  ),
               ),
              ),
              Expanded(
                child: Container(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: validator==false
                        ?MainAxisAlignment.spaceAround
                        :MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(productName ,style: TextStyle(color:textColor, fontWeight: FontWeight.bold)),
                          Text("$productPrice" ,style: TextStyle(color:Colors.grey,)),

                        ],

                      ),
                      validator==false?Container(
                        margin: EdgeInsets.only(right: 15) ,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child:  Text("kg" ,style: TextStyle(color:Colors.grey,)),
                            ),
                            Center(
                              child: Icon(Icons.arrow_drop_down, size: 20,color: primaryColor,),
                            ),
                          ],
                        ),
                      ):Text("kg")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: validator==false?EdgeInsets.symmetric(horizontal: 15, vertical: 32):EdgeInsets.only(left: 15,right: 15),
                  child: validator==false?Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add , color:primaryColor,size: 20, ),
                          Text( "$productPrice lei" ,style: TextStyle(color:primaryColor),),
                        ],
                      ),
                    ),
                  ):Column(
                    children: [

                      Icon(Icons.delete,size: 30,color: Colors.black54,),
                      SizedBox(height: 5,),

                      Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:  [
                                 Icon(
                                      Icons.add ,
                                      color:primaryColor,
                                      size: 20, ),
                                  Text("   Adauga",style: TextStyle(color: primaryColor),
                                  ),


                                ],
                              ),
                            ),
                          ),
                    ],
                  )
                ),
              ),


            ],
          ),
        ),
        validator==false?Container(

        ):Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }

}