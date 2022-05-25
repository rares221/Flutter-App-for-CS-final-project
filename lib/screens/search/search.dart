import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:licenta_2022_vr/widgets/single_item.dart';

import '../../models/product_model.dart';

enum Orderby {lowToHigh, highToLow, aplphabetically}

class Search extends StatefulWidget{
  final List<ProductModel> search;
  Search({this.search});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String query="";

  Orderby _defaultOrder= Orderby.aplphabetically;


  List<ProductModel> searchItem(String query){
    List<ProductModel> searchSpec =widget.search.where((element){
      return element.productName.toLowerCase().contains(query);
    } ).toList();
    return searchSpec;

  }


    @override
    Widget build(BuildContext context) {
    List<ProductModel> _searchItem= searchItem(query);
      void bottomSheet() => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: new Text(
                    'Sorteaza dupa',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile(
                    value: Orderby.lowToHigh,
                    groupValue: _defaultOrder,
                    title: Text("Pret crescator"),
                    onChanged: (vav) {
                      setState(() {
                        _defaultOrder = vav;
                      });
                      Navigator.of(context).pop();
                    }),
                RadioListTile(
                    value: Orderby.highToLow,
                    groupValue: _defaultOrder,
                    title: Text("Pret descrescator"),
                    onChanged: (vav) {
                      setState(() {
                        _defaultOrder = vav;
                      });
                      Navigator.of(context).pop();
                    }),
                RadioListTile(
                  value: Orderby.aplphabetically,
                  groupValue: _defaultOrder,
                  title: Text("Alfabetic"),
                  onChanged: (vav) {
                    setState(() {
                      _defaultOrder = vav;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  height: 46,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 17),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text("Aplica filtrele"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: primaryColor,
                    onPressed: () {},
                  ),
                )
              ],
            );
          });

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        title: Text("Cauta",style: TextStyle(color: textColor),),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child:IconButton(
                onPressed: (){
                  bottomSheet();
                },
                icon: Icon(Icons.sort),
              ),
            ),

        ],


      ),
      body: ListView(
            children: [
              ListTile(
                  title: Text("Produse"),
                 ),
              Container(
                height: 52,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value){
                    print(value);
                    setState((){
                    query = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,

                    ),
                    fillColor: Color(0xffc2c2c2),
                    filled: true,
                    hintText: "Cauta orice produs iti doresti",
                    suffixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: _searchItem.map((data) {
                  return  SingleItem(
                    validator: false,
                    productImage: data.productImage,
                    productPrice: data.productPrice,
                    productName: data.productName,
                    productQuantity: 1,
                  );
                }).toList(),
              ),

            ]
        ),
      );
  }
}