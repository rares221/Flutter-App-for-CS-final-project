import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/models/product_model.dart';
import 'package:licenta_2022_vr/widgets/count.dart';
import 'package:licenta_2022_vr/widgets/product_unit.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final Function onTap;
  final String productId;
  final int productQuantity;
  final List<dynamic> productUnit;
  SingleProduct({this.productImage, this.productName,this.onTap, this.productPrice, this.productId, this.productQuantity, this.productUnit,});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(

                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.productPrice}/ lei ${widget.productUnit.first} ",//de introdus
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProductUnit(
                               onTap:(){ showModalBottomSheet(
                                     context: context,
                                     builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: widget.productUnit.map<Widget>((data) {
                                         return Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: InkWell(
                                                 onTap: ()async{
                                                   setState((){
                                                     unitData = data;
                                                   });
                                                   Navigator.of(context).pop();
                                                 },
                                                 child: Text(
                                                   data,
                                                   style: TextStyle(
                                                       color: Colors.black,
                                                       fontSize: 18
                                                   ),
                                                 ),
                                               ),
                                             )
                                           ],
                                         );
                                       }).toList(),
                                      );
                                     }
                                    );
                                 },
                                title: unitData == null?firstValue:unitData,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Count(
                              productId: widget.productId,
                              productName: widget.productName,
                              productImage: widget.productImage,
                              productPrice: widget.productPrice,
                              productUnit: unitData == null?firstValue:unitData,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}