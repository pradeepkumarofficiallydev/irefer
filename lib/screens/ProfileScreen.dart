import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/Utils/NewTextstyle.dart';
import 'package:jsp/screens/EditProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    double fontSize = height * 0.5; // Responsive font size
    double iconSize = height * 0.6; // Responsive icon size
    double paddingSize = height * 0.2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize),),
        //backgroundColor: Colors.blue,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Get.back();
        }),
        actions: [IconButton(icon: Icon(Icons.close), onPressed: () {})],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Profile Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 30, child: Text("P")), // Profile Picture
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pradeep", style: Newtextstyle.nanoText18Bold(AppColor.blackcolor,fontSize*.8),),
                            Text("+91 9520583930",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                            Text("pradeepkumarrdx74@gmail.com",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                            Text("UPP922952 | 00Z9U", style: Newtextstyle.nanoText(AppColor.greycolor,fontSize*.5),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(onPressed: () {
                            Get.to(EditProfileScreen());
                          }, child: Text("Edit Profile",style: Newtextstyle.nanoText(AppColor.appColor,fontSize*.5),)),
                          TextButton(onPressed: () {}, child: Text("Verify",style: Newtextstyle.nanoText(AppColor.appColor,fontSize*.5),)),
                        ],
                      ),
                    ],
                  ),
                ),


                /// Accordion Sections
                ExpansionTile(
                  //leading: Icon(Icons.qr_code),
                  title: Text("Complete Your Profile",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.7),),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: height*.3,
                        horizontal: height*.2
                      ),
                      padding: EdgeInsets.symmetric(vertical: height*.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        _progressStep(Icons.person, "About You", true,fontSize*.5),
                        _progressStep(Icons.verified_user, "KYC", true,fontSize*.5),
                        _progressStep(Icons.email, "Verify Email", false,fontSize*.5),
                        _progressStep(Icons.credit_card, "Approval", false,fontSize*.5),
                      ],
                                    ),
                    ),
                    ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.qr_code),
                  title: Text("My QR",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.7),),
                  children: [Text("QR Details Here")],
                ),
                ExpansionTile(
                  leading: Icon(Icons.help),
                  title: Text("Frequently Asked Questions",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.7),),
                  children: [Text("FAQ Content Here")],
                ),
                ExpansionTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Manage Account",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.7),),
                  children: [Text("Delete Account")],
                ),

                /// Logout Section
                ListTile(
                  leading: Icon(Icons.logout, ),
                  title: Text("Logout", style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.7),),
                  onTap: () {},
                  trailing: Text("Version: p10012025", style: TextStyle(color: Colors.grey)),
                ),

                /// Relationship Manager Details

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: width*1.2,
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("BASIC Relationship Manager Details",style: Newtextstyle.nanoText18Bold(AppColor.blackcolor,fontSize*.6),),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                      Text("Agent Support",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mobile",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                      Text("+91 7270069008",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                      Text("Hello@basichomeloan.com",style: Newtextstyle.nanoText(AppColor.blackcolor,fontSize*.5),),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressStep(IconData icon, String label, bool completed,double height) {
    return Column(
      children: [
        Icon(icon, color: completed ? Colors.green : Colors.grey, size: 30),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: completed ? Colors.green : Colors.grey,
          fontFamily: 'Maine',
          fontSize: height)),
      ],
    );
  }
}
