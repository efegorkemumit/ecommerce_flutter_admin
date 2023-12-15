import 'package:ecommerce_flutter_admin/constans/app_constans.dart';
import 'package:ecommerce_flutter_admin/services/assets_manager.dart';
import 'package:ecommerce_flutter_admin/widget/title_text.dart';
import 'package:flutter/material.dart';

class EditorUploadProductScreen extends StatefulWidget {
  static const routName = "/EditorUploadProductScreen";

  const EditorUploadProductScreen({super.key});

  @override
  State<EditorUploadProductScreen> createState() => _EditorUploadProductScreenState();
}

class _EditorUploadProductScreenState extends State<EditorUploadProductScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
           onTap: (){
              FocusScope.of(context).unfocus();
          },
      child: Scaffold(
        bottomSheet: SizedBox(
          height: kBottomNavigationBarHeight +10,
          child: Material(
            color:Theme.of(context).scaffoldBackgroundColor,
            child: (
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(

                    onPressed: (){},
                    icon: const Icon(Icons.clear),
                    label: const Text("Clear"),

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: Colors.amber
                  ),

                ),
                ElevatedButton.icon(

                  onPressed: (){},
                  icon: const Icon(Icons.clear),
                  label: const Text("Upload Product"),

                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                  ),

                ),
              ],
            )
            ),
          ),
        ),

        appBar: AppBar(
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),


            ),
            title:  TitleTextWidget(label:  "Search products")
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),


                /////////////
/////////////Image
                /////////////

                /////////////
/////////////   Dropdown
                /////////////


                const SizedBox(
                  height: 20,
                ),

                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        child:Form(
                              key:_formKey,
                              child: Column(
                                children: [
                                  TextFormField(

                                  )
                                ],

                              ),




                )




                )





              ],
            ),
          ),
        ),


      ),



    );

  }
}
