import 'package:ecommerce_flutter_admin/models/product_model.dart';
import 'package:ecommerce_flutter_admin/services/myapp_functions.dart';
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
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    XFile? _pickedImage;
    late TextEditingController _titleController,
    _priceController, _descriptionController, _quantitiycontroller;

    String? _categoryValue;
    bool isEditing = false;

    String? productNetworkImage;
    @override
    void initState(){
      if(widget.productModel !=null){
        isEditing = true;

        productNetworkImage = widget.productModel!.productImage;

        _categoryValue = widget.productModel?.productCategory;

      }
      _titleController = TextEditingController(
          text: widget.productModel?.productTitle
      );
      _priceController = TextEditingController(
          text: widget.productModel?.productPrice
      );
      _descriptionController = TextEditingController(
          text: widget.productModel?.productDescription
      );
      _quantitiycontroller = TextEditingController(
          text: widget.productModel?.productQuantity
      );
      super.initState();
    }

    @override
    void dispose(){
      _titleController.dispose();
      _priceController.dispose();
      _descriptionController.dispose();
      _quantitiycontroller.dispose();
      super.dispose();

    }
    void removePickedImage(){
      setState(() {
        _pickedImage=null;
        productNetworkImage = null;
      });
    }

    Future<void> uploadProduct() async{
      if(_pickedImage==null) {
        MyAppFunctions.showErrorOrWaningDialog(
            context: context, subtitle: "please pickup image", fct: () {},);
        return;

        }


      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {}
    }

    Future<void> _editProduct() async {
      final isValid=  _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if(_pickedImage == null && productNetworkImage == null){
        MyAppFunctions.showErrorOrWaningDialog(
          context: context, subtitle: "please pickup image", fct: () {},);
        return;



      }
      if (isValid) {}

    }

    Future<void> localImagePicker () async{
      final ImagePicker imagePicker = ImagePicker();
      await MyAppFunctions.ImagePickerDialog(
          context: context,
          cameraFCT: () async{
            _pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
            setState(() {

            });
          },
          galleryFCT: () async{
            _pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
            setState(() {

            });
          },
          removeFCT: (){
            setState(() {
              _pickedImage =null;
            });
          }
      );
    }

    return const Placeholder();
  }
}
