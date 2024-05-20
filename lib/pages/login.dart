import 'package:ecommerceapp/pages/signup.dart';
import 'package:ecommerceapp/widget/support_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/login.jpg"),
              Center(
                  child: Text("Sign In", style: AppWidget.semiBoldTextFieldStyle(),)),
              SizedBox(height: 20,),
              Center(
                child: Text("Please enter the details below to\n                      continue",
                style: AppWidget.lightTExtFieldStyle(),),
              ),
              SizedBox(height: 40,),
              Text("Email", style: AppWidget.semiBoldTextFieldStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
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
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                    hintText: "Password"
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?", style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),),
                ],
              ),
              SizedBox(height: 25,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("LOGIN", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppWidget.lightTExtFieldStyle(),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                    },
                    child: Text("Sign Up", style: TextStyle(
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
    );
  }
}
