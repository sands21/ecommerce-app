import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/pages/product_detail.dart';
import 'package:ecommerceapp/services/database.dart';
import 'package:flutter/material.dart';

import '../widget/support_widget.dart';

class CategoryProduct extends StatefulWidget {
String category;
CategoryProduct({required this.category});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  Stream? CategoryStream;

  getontheload()async{
    CategoryStream= await DatabaseMethods().getProducts(widget.category);

    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allProducts (){
    return StreamBuilder(stream: CategoryStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData? GridView.builder(
        padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index){
          DocumentSnapshot ds= snapshot.data.docs[index];

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Image.network(
                ds["Image"],
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,),
                SizedBox(height: 10,),
                Text(ds["Name"],
                  style: AppWidget.semiBoldTextFieldStyle(),),
                Spacer(),
                Row(
                  children: [
                    Text("\$"+ds["Price"],
                      style: TextStyle(
                        color: Color(0xFFfd6f3e),
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(width: 30,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(name: ds["Name"], image: ds["Image"], detail: ds["Detail"], price: ds["Price"])));
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Color(0xFFfd6f3e),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(Icons.add, color: Colors.white,)),
                    )
                  ],
                )
              ],
            ),
          );


          }):Container();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff2f2f2),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
                child: allProducts())
          ],
        ),
      ),
    );
  }
}
