import 'package:ecommerceapp/pages/bottomnav.dart';
import 'package:ecommerceapp/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/support_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? name, email, password;
  TextEditingController nameController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formkey= GlobalKey<FormState>();

  registration()async{
    if(password!=null && name!=null && email!=null){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
                content: Text("Registered Successfully",
                style: TextStyle(
                  fontSize: 20,),
                )));
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
      } on FirebaseException catch(e){
        if (e.code=='weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text("Password is too weak",
                    style: TextStyle(
                      fontSize: 20,),
                  )));
        }
        else {
          if(e.code=="email-already-in-use"){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text("Account already exists",
                      style: TextStyle(
                        fontSize: 20,),
                    )));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/login.jpg"),
                Center(
                    child: Text("Sign Up", style: AppWidget.semiBoldTextFieldStyle(),)),
                SizedBox(height: 20,),
                Center(
                  child: Text("Please enter the details below to\n                      continue",
                    style: AppWidget.lightTExtFieldStyle(),),
                ),
                SizedBox(height: 40,),
                Text("Name", style: AppWidget.semiBoldTextFieldStyle(),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F5F9),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty){
                        return 'Please Enter your Name';
                      }
                      else
                        return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter name"
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Email", style: AppWidget.semiBoldTextFieldStyle(),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F5F9),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty){
                        return 'Please Enter your Email';
                      }
                      else
                        return null;
                    },
                    controller: mailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "someone@example.com"
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Password", style: AppWidget.semiBoldTextFieldStyle(),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F5F9),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value){
                      if (value==null || value.isEmpty){
                        return 'Please Enter your Password';
                      }
                      else
                        return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password"
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    if (_formkey.currentState!.validate()){
                      setState(() {
                        name= nameController.text;
                        email= mailController.text;
                        password= passwordController.text;
                      });
                    }
                    registration();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text("Sign Up", style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: AppWidget.lightTExtFieldStyle(),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIn()));
                      },
                      child: Text("Sign In", style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
