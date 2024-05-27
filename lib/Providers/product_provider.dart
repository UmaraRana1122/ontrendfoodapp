import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ontrendfoodapp/Models/produst_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> offersProductList = [];
  late ProductModel productModel;
  fetchOffersProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("OffersProduct").get();
    value.docs.forEach((element) {
      productModel = ProductModel(
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice: element.get("productPrice"));
      newList.add(productModel);
    });
    offersProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getOffersProductDataList {
    return offersProductList;
  }
}
