import 'dart:convert';

import 'package:ecommerceapp/services/constant.dart';
import 'package:ecommerceapp/services/database.dart';
import 'package:ecommerceapp/services/shared_pref.dart';
import 'package:ecommerceapp/widget/support_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class ProductDetail extends StatefulWidget {
  String image, name, detail, price;
  ProductDetail({required this.name, required this.image, required this.detail, required this.price });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? name, mail;

  getthesharedpref()async{
    name= await SharedPreferenceHelper().getUserName();
    mail= await SharedPreferenceHelper().getUserEmail();
    setState(() {

    });
  }

  ontheload()async{
    await getthesharedpref();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  Map<String, dynamic>? paymentIntent;


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
                    child: Image.network(
                    widget.image,
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
                        Text(widget.name, style: AppWidget.boldTextFieldStyle(),),
                        Text("\$"+widget.price,
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
                    Text(widget.detail),
                    SizedBox(height: 160,),
                    GestureDetector(
                      onTap: (){
                        makePayment(widget.price);
                      },
                      child: Container(
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

  Future<void> makePayment(String amount)async{
    try{
      paymentIntent= await createPaymentIntent(amount, 'INR');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent?['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: 'Oggy'
          )).then((value) {});

      displayPaymentSheet();
    } catch (e,s){
      print('exception: $e$s');
    }
  }

  displayPaymentSheet()async{
    try{
      await Stripe.instance.presentPaymentSheet().then((value) async{
        Map<String, dynamic> orderInfoMap={
          "Product": widget.name,
          "Price": widget.price,
          "Name": name,
          "Email": mail,
          "ProductImage": widget.image
        };
        await DatabaseMethods().orderDetails(orderInfoMap);
        showDialog(
            context: context,
            builder: (_)=> AlertDialog(
              content: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green,),
                      Text("Payment Successful")
                    ],
                )
              ],
            ),
      ));
        paymentIntent=null;
    }).onError((error, stackTrace){
      print("Error is :---> $error $stackTrace");
      });
    } on StripeException catch(e){
      print("Error is ----> $e");
      showDialog(context: context, builder: (_)=> AlertDialog(
        content: Text("Cancelled"),
      ));
    } catch (e){
      print("$e");
    }
  }

  createPaymentIntent(String amount, String currency)async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer $secretkey',
            'Content_Type': 'application/x-www-form-urlencodded'
          }, body: body,
      );
      return jsonDecode(response.body);
    } catch (err) {
      print("err charging user: ${err.toString()}");
    }
  }

    calculateAmount(String amount){
      final calculatedAmount=(int.parse(amount)*100);
      return calculatedAmount.toString();
  }
}
