import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/DashboardScreenController.dart';
import 'package:jsp/screens/ProfileScreen.dart';

import '../Utils/custom_widgets.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    double fontSize = height * 0.5; // Responsive font size
    double iconSize = height * 0.6; // Responsive icon size
    double paddingSize = height * 0.2; // Responsive padding


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.appColor, // Replace with AppColor.appColor
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Primelending",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.notifications, color: Colors.white, size: iconSize),
                  SizedBox(width: paddingSize),
                  InkWell(
                    onTap: (){
                      Get.to(ProfileScreen());
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: iconSize / 2,
                      child: Text("P", style: TextStyle(fontSize: fontSize * 0.7)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body:
    GetBuilder<Dashboardscreencontroller>(
    init: Dashboardscreencontroller(),
    builder: (s) =>
      Padding(
        padding: EdgeInsets.all(paddingSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search by keyword",
                  hintStyle: TextStyle(
                    fontFamily: 'Maine',
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.blue, size: iconSize),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(paddingSize * 2),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.symmetric(vertical: paddingSize),
                ),
                style: TextStyle(fontSize: fontSize * 0.7),
              ),
              SizedBox(height: height * 0.6),
          
              // Banner Placeholder
              s.isLoading2.value ?

              Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor)):
              CarouselSlider(
                items: s.imageUrls.map((url) {
                  return Image.network(
                    url,  // Now it contains the complete URL
                    fit: BoxFit.fill,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: height*3,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    // productDetailController.changeImage(index);
                  },
                ),
              ),

              SizedBox(height: height * 0.6),
          
              // KYC Rejection Box
              Container(
                padding: EdgeInsets.all(paddingSize),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(paddingSize),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: iconSize / 2,
                      child: Icon(Icons.person, color: Colors.orange, size: iconSize * 0.7),
                    ),
                    SizedBox(width: paddingSize),
                    Expanded(
                      child: Text(
                        "KYC Rejected",
                        style: TextStyle(
                          fontFamily: 'Maine',
                          color: Colors.orange,
                          fontSize: fontSize*.6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: paddingSize * 2, vertical: paddingSize/2),
                      ),
                      child: Text("View Reason", style: TextStyle(
                          fontFamily: 'Maine',
                          fontSize: fontSize*.6)),
                    ),
                    SizedBox(width: paddingSize),
                    Icon(Icons.close, color: Colors.orange, size: iconSize ),
                  ],
                ),
              ),
          
              //Add code here
              /// 🛠 My Tools Section
              SizedBox(height: height * 0.3),
              Text("My Tools", style: TextStyle(
                  fontFamily: 'Maine',
                  fontSize: fontSize*.8, fontWeight: FontWeight.bold)),
              SizedBox(height: height * 0.3),
              Container(
                margin: EdgeInsets.symmetric(horizontal: paddingSize),
                padding: EdgeInsets.symmetric(horizontal: paddingSize*.2,vertical: paddingSize),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _toolItem("EMI Calculator", Icons.calculate, iconSize, fontSize*.7),
                    _toolItem("Offer Calculator", Icons.home, iconSize, fontSize*.7),
                    _toolItem("Payout Calculator", Icons.currency_rupee, iconSize, fontSize*.7),
                  ],
                ),
              ),
              SizedBox(height: height * 0.6),
          
              /// 📊 My Leads Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Leads", style: TextStyle(
                      fontFamily: 'Maine',
                      fontSize: fontSize*.8, fontWeight: FontWeight.bold)),
                  Text("Last 3 Months", style: TextStyle(
                      fontFamily: 'Maine',
                      fontSize: fontSize * 0.7, color: Colors.grey)),
                ],
              ),
              SizedBox(height: height * 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _leadItem("New", "2", iconSize, fontSize),
                  _leadItem("Logged In", "0", iconSize, fontSize),
                  _leadItem("Sanction", "0", iconSize, fontSize),
                  _leadItem("Disbursed", "0", iconSize, fontSize),
                ],
              ),
              SizedBox(height: height * 0.6),
          
              /// 📌 Pending Tasks Section
              Text("Pending Task", style: TextStyle(
                  fontFamily: 'Maine',
                  fontSize: fontSize*.8, fontWeight: FontWeight.bold)),
              SizedBox(height: height * 0.3),
              Container(
                padding: EdgeInsets.all(paddingSize),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(paddingSize),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _taskItem("Follow Ups", "2", fontSize),
                        _taskItem("Disbursal Pending", "0", fontSize),
                      ],
                    ),
                    Divider(color: Colors.grey.shade300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today, color: Colors.red, size: iconSize * 0.6),
                        SizedBox(width: paddingSize),
                        Text(
                          "1 task overdue",
                          style: TextStyle(
                              fontFamily: 'Maine',
                              fontSize: fontSize * 0.7, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 6),
          
            ],
          ),
        ),
      ),
    )
    );
  }
  /// 🎯 Helper Widgets

  Widget _toolItem(String title, IconData icon, double iconSize, double fontSize) {
    return Column(
      children: [
        Icon(icon, color: Colors.black, size: iconSize),
        SizedBox(height: 5),
        Text(title, style: TextStyle(
            fontFamily: 'Maine',
            fontSize: fontSize * 0.7)),
      ],
    );
  }

  Widget _leadItem(String title, String count, double iconSize, double fontSize) {
    return Container(
      padding: EdgeInsets.all(iconSize * 0.2),
      width: iconSize * 3.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(iconSize * 0.3),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text(count, style: TextStyle(fontFamily: 'Maine',
              fontSize: fontSize, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(
              fontFamily: 'Maine',
              fontSize: fontSize * 0.6, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _taskItem(String title, String count, double fontSize) {
    return Expanded(
      child: Column(
        children: [
          Text(count, style: TextStyle(
              fontFamily: 'Maine',
              fontSize: fontSize, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(
              fontFamily: 'Maine',
              fontSize: fontSize * 0.7, color: Colors.grey)),
        ],
      ),
    );
  }
}











