


import 'package:ecommerce_flutter_admin/screens/editorUploadProduct.dart';
import 'package:ecommerce_flutter_admin/screens/search_screen.dart';
import 'package:ecommerce_flutter_admin/services/assets_manager.dart';
import 'package:ecommerce_flutter_admin/widget/order/order_screen.dart';
import 'package:flutter/material.dart';

class DashboardButtonModel{
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,

});

  static List<DashboardButtonModel> dashboardBtnList(context)=>[

    DashboardButtonModel(
        text: "Add new product",
        imagePath: AssetsManager.bagimg1,
        onPressed: (){
          Navigator.pushNamed(context, EditorUploadProductScreen.routName);
        },
    ),
    DashboardButtonModel(
      text: "All Product",
      imagePath: AssetsManager.file,
      onPressed: (){
        Navigator.pushNamed(context, SearchScreen.routName);
      },
    ),

    DashboardButtonModel(
      text: "View Orders",
      imagePath: AssetsManager.file,
      onPressed: (){
        Navigator.pushNamed(context, OrderScreen.routName);
      },
    ),


  ];




}