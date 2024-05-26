import 'dart:io';

import 'package:ecommerceapp/services/database.dart';
import 'package:ecommerceapp/widget/support_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _picker=ImagePicker();
  File? selectedImage;
  TextEditingController nameComtroller = new TextEditingController();
  
  Future getImage()async{
    var image=await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {

    });
  }

  uploadItem() async {
    if(selectedImage!=null && nameComtroller.text!=""){
      String addId= randomAlphaNumeric(10);
      Reference firebaseStorageRef= FirebaseStorage
          .instance.ref()
          .child("blogImage")
          .child(addId);

      final UploadTask task= firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl =await (await task).ref.getDownloadURL();

      Map<String, dynamic> addProduct={
        "Name": nameComtroller.text,
        "Image": downloadUrl,

      };
      await DatabaseMethods().addProduct(addProduct, value!).then((value) {
        selectedImage=null;
        nameComtroller.text="";
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text("Product has been added successfully",
                  style: TextStyle(
                    fontSize: 20,),
                )));
      });
    }
  }

  String? value;
  final List<String> categoryitem=[
    'Watch', 'Laptop', 'TV', 'Headphone'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context);
          },
            child: Icon(Icons.arrow_back_outlined)),
        title: Text("Add Products",
        style: AppWidget.semiBoldTextFieldStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,top: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Product Image",
              style: AppWidget.lightTExtFieldStyle(),
              ),
              SizedBox(height: 20,),
              selectedImage==null? GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ):
              Center(
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                        child: Image.file(selectedImage!, fit: BoxFit.cover,)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Product Name",
                style: AppWidget.lightTExtFieldStyle(),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFececf8)
                ),
                child: TextField(
                  controller: nameComtroller,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Text("Product Type",
                style: AppWidget.lightTExtFieldStyle(),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: categoryitem.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item,
                          style: AppWidget.semiBoldTextFieldStyle(),))).toList(),
                    onChanged: ((value)=> setState(() {
                      this.value=value;
                  })),
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 36,
                    value: value,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                  child: ElevatedButton(
                      onPressed: (){
                        uploadItem();
                      },
                      child: Text("Add Product", style: TextStyle(
                        fontSize: 20,
                      ),)))
            ],
          ),
        ),
      ),
    );
  }
}
