import 'package:ecommerceapp/widget/support_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/TV.png"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hey Rajarshi",
                        style: AppWidget.boldTextFieldStyle()
                    ),
                    Text("Good Morning",
                      style: AppWidget.lightTExtFieldStyle(),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("images/boy.jpg",
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,),
                )
              ],
            ),
            SizedBox(height: 30),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Whatchu need?",
                      hintStyle: AppWidget.lightTExtFieldStyle(),
                      prefixIcon: Icon(Icons.search, color: Colors.black)
                  ),
                )
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                    style: AppWidget.semiBoldTextFieldStyle()
                ),
                Text("see all",
                    style: TextStyle(
                        color: Color(0xFFfd6f3e),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                    height: 120,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: Color(0xFFfd6f3e),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text("All", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    )),
                Expanded(
                  child: Container(
                    height: 120,
                    // margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTitle(image: categories[index]);
                        }),
                  
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Products",
                    style: AppWidget.semiBoldTextFieldStyle()
                ),
                Text("see all",
                    style: TextStyle(
                        color: Color(0xFFfd6f3e),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 240,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        Image.asset("images/headphone2.png",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,),
                        Text("Headphone", style: AppWidget.semiBoldTextFieldStyle(),),
                        Row(
                          children: [
                            Text("\$100", style: TextStyle(
                              color: Color(0xFFfd6f3e),
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xFFfd6f3e),
                                borderRadius: BorderRadius.circular(10)
                              ),
                                child: Icon(Icons.add, color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        Image.asset("images/watch2.png",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,),
                        Text("Watch", style: AppWidget.semiBoldTextFieldStyle(),),
                        Row(
                          children: [
                            Text("\$50", style: TextStyle(
                                color: Color(0xFFfd6f3e),
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Color(0xFFfd6f3e),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(Icons.add, color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        Image.asset("images/laptop2.png",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,),
                        Text("Laptop", style: AppWidget.semiBoldTextFieldStyle(),),
                        Row(
                          children: [
                            Text("\$1000", style: TextStyle(
                                color: Color(0xFFfd6f3e),
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Color(0xFFfd6f3e),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(Icons.add, color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  String image;
  CategoryTitle({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      height: 90,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image,
          height: 50,
          width: 50,
          fit: BoxFit.cover,),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
