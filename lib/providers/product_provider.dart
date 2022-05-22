import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:licenta_2022_vr/models/product_model.dart';
import 'package:flutter/cupertino.dart';


class ProductProvider with ChangeNotifier {
  ProductModel productModel;

  List<ProductModel>search=[];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
    );
    search.add(productModel);
  }

  /////////////// herbProduct ///////////////////////////////
  List<ProductModel> herbProductList = [];

  fetchHerbProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("HerbProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    herbProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbProductDataList {
    return herbProductList;
  }

//////////////// Fruit Product ///////////////////////////////////////
  List<ProductModel> fruitProductList = [];

  fetchFruitProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("FruitProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    fruitProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFruitProductDataList {
    return fruitProductList;
  }

//////////////// Vegi Product ///////////////////////////////////////
  List<ProductModel> vegiProductList = [];

  fetchVegiProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("VegiProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    vegiProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getVegiProductDataList {
    return vegiProductList;
  }

  //////////////// Season Product ///////////////////////////////////////
  List<ProductModel> seasonProductList = [];
  fetchSeasonProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("SeasonProduct").get();

    value.docs.forEach(
          (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    seasonProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getSeasonProductDataList {
    return seasonProductList;
  }


///////////////// Search fix //////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }

}