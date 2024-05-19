import 'package:ecommerceapp/widget/support_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f1),
      body: Container(
        padding: EdgeInsets.only(top: 50,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(10),
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30),
                      border: Border.all()
                  ),
                    child: Icon(Icons.arrow_back_outlined)),
              ),
                Center(
                    child: Image.asset("images/headphone2.png",
                      height: 400,))
            ]),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, -1),
                      color: Colors.grey,
                      blurRadius: 6,
                      spreadRadius: 3
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Headphone", style: AppWidget.boldTextFieldStyle(),),
                        Text("\$300",
                            style: TextStyle(
                                color: Color(0xFFfd6f3e),
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Details", style: AppWidget.semiBoldTextFieldStyle(),),
                    SizedBox(height: 10,),
                    Text("Noice headphones. Big drivers for heavy bass and 12 mics for smooth phone calls. Very comfy cushions for uninterrupted on time."),
                    SizedBox(height: 160,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFfd6f3e)
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text("Buy Now", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
