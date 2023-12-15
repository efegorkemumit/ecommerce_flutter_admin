import 'package:ecommerce_flutter_admin/constans/app_constans.dart';
import 'package:ecommerce_flutter_admin/constans/validator.dart';
import 'package:ecommerce_flutter_admin/models/product_model.dart';
import 'package:ecommerce_flutter_admin/services/assets_manager.dart';
import 'package:ecommerce_flutter_admin/widget/subtitle_text.dart';
import 'package:ecommerce_flutter_admin/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditorUploadProductScreen extends StatefulWidget {
  static const routName = "/EditorUploadProductScreen";

  const EditorUploadProductScreen({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  State<EditorUploadProductScreen> createState() => _EditorUploadProductScreenState();
}

class _EditorUploadProductScreenState extends State<EditorUploadProductScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  late TextEditingController  _titleController, _priceController, _descriptionController,
  _quanttiyContoller;
  String? _categoryValue;
  bool isEditing = false;
  String? productNetworkImage;

  @override
  void initState(){
    if(widget.productModel !=null)
    {
      isEditing =true;
      productNetworkImage = widget.productModel!.productImage;
      _categoryValue= widget.productModel!.productCategory;


    }

    _titleController = TextEditingController(text:widget.productModel?.productTitle);
    _priceController = TextEditingController(text:widget.productModel?.productPrice);
    _descriptionController = TextEditingController(text:widget.productModel?.productDescription);
    _quanttiyContoller = TextEditingController(text:widget.productModel?.productQuantity);

    super.initState();

    @override
    void dispose(){
      _titleController.dispose();
      _priceController.dispose();
      _descriptionController.dispose();
      _quanttiyContoller.dispose();

      super.dispose();
    }
    void removePickedImage(){
      setState(() {
        _pickedImage= null;
        productNetworkImage =null;
      });
    }

    void clearForm(){
      _titleController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _quanttiyContoller.clear();
      removePickedImage();
    }



  }

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
                                    controller: _titleController,
                                    key: const ValueKey('Title'),
                                    maxLength: 80,
                                    minLines: 1,
                                    maxLines: 2,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    decoration: const InputDecoration(
                                      hintText: "Product title",
                                    ),
                                    validator: (value){
                                      return MyValidators.uploadProdText(
                                        value: value,
                                        toBeReturnedString: "Plaese Enter a valid title"
                                      );
                                    },

                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          flex:1,
                                           child:  TextFormField(
                                            controller: _priceController,
                                            key: const ValueKey('Price \$'),

                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintText: "Price",
                                              prefix:  SubTitleTextWidget(label: "\$  ",
                                                color: Colors.blue,
                                                fontSize: 15,
                                              )
                                            ),
                                            validator: (value){
                                              return MyValidators.uploadProdText(
                                                  value: value,
                                                  toBeReturnedString: "Plaese Enter a missing"
                                              );
                                            },

                                          ),




                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        flex:1,
                                        child:  TextFormField(
                                          controller: _quanttiyContoller,
                                          key: const ValueKey('Quantity'),

                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.newline,
                                          decoration: const InputDecoration(
                                              hintText: "Quantity",
                                              prefix:  SubTitleTextWidget(label: "QTY : ",
                                                color: Colors.blue,
                                                fontSize: 15,
                                              )
                                          ),
                                          validator: (value){
                                            return MyValidators.uploadProdText(
                                                value: value,
                                                toBeReturnedString: "Quantity is missed"
                                            );
                                          },

                                        ),




                                      ),

                                    ],
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    controller: _descriptionController,
                                    key: const ValueKey('Description'),
                                    minLines: 5,
                                    maxLines: 8,
                                    maxLength: 1000,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      hintText: "Product title",
                                    ),
                                    validator: (value){
                                      return MyValidators.uploadProdText(
                                          value: value,
                                          toBeReturnedString: "Desciprion is problem"
                                      );
                                    },

                                  ),

                                  const SizedBox(
                                    height: kBottomNavigationBarHeight+10
                                  ),

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
