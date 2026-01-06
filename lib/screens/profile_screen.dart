import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/Utils/NewTextstyle.dart';
import 'package:jsp/controller/user_profile_controller.dart';
import 'package:jsp/screens/login_screen.dart';

import '../Utils/SecureStorageService.dart';
import 'edit_profile_screen.dart';
import 'my_earning/my_earning_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


     var controller=Get.put(UserProfileController());


    double fontSize = height * 0.5; // Responsive font size
    double iconSize = height * 0.6; // Responsive icon size
    double paddingSize = height * 0.2;
    return Scaffold(


      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 4),
        child: Stack(
          children: [
            Container(
              height: height * 2,
              width: double.infinity,
              color: AppColor.appColor,
              padding: EdgeInsets.symmetric(horizontal: height * .6, vertical: height * .6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
               // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, color: Colors.black, size: height * .7),
                  ),
                  Spacer(),
                  Text('My Profile', style: Newtextstyle.normalopenSans2(AppColor.blackcolor, height * .4)),
                  SizedBox(width: height * .7),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),

      backgroundColor: AppColor.whitecolor,

      // appBar: AppBar(
      //   title: Text("Profile",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize),),
      //   //backgroundColor: Colors.blue,
      //   leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      //     Get.back();
      //   }),
      //   actions: [IconButton(icon: Icon(Icons.close), onPressed: () {})],
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Profile Section
                ///
                ///
               Obx(()=>
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


                            Text(controller.getProfilesResponse.value.data?.name??"", style: Newtextstyle.nanoText18Bold(AppColor.blackcolor,fontSize*.8),),
                            Text("+91 ${controller.getProfilesResponse.value.data?.mobile??""}",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
                            Text(controller.getProfilesResponse.value.data?.email??"",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
                            Text("${controller.getProfilesResponse.value.data?.panno??""}", style: Newtextstyle.normalopenSans(AppColor.grayColor,fontSize*.5),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(onPressed: () {
                            Get.to(EditProfileScreen());


                          }, child: Text("Edit Profile",style: Newtextstyle.normalopenSans(AppColor.appColor,fontSize*.5),)),
                          TextButton(onPressed: () {}, child: Text("Verify",style: Newtextstyle.normalopenSans(AppColor.appColor,fontSize*.5),)),
                        ],
                      ),
                    ],
                  ),
                ),
               ),


                /// Accordion Sections
                ExpansionTile(
                  //leading: Icon(Icons.qr_code),
                  title: Text("Complete Your Profile",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.7),),
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



                InkWell(
                  onTap: ()
                  {


                    Get.to(EarningsScreen());



                  },

                  child: Container(


                    child: Text("My Earning",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.7),
                  ),
                  ),
                ),

                ExpansionTile(
                //  leading: Icon(Icons.qr_code),
                  title: Text("My Earning",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.7),),
                  //

                  // children: [Text("QR Details Here")],
                ),



                ExpansionTile(
                  leading: Icon(Icons.qr_code),
                  title: Text("My QR",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.7),),
                  children: [Text("QR Details Here")],
                ),


                ExpansionTile(
                  leading: Icon(Icons.help),
                  title: Text("Frequently Asked Questions",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.7),),
                  children: [

                    Text("FAQ Content Here")

                  ],
                ),


                // ExpansionTile(
                //   leading: Icon(Icons.account_circle),
                //   title: Text("Manage Account",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.7),),
                //   children: [Text("Delete Account")],
                // ),

                /// Logout Section
                ListTile(
                  leading: Icon(Icons.logout, ),
                  title: Text("Logout", style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.7),),
                  onTap: () {



                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: AppColor.whitecolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            //this right here
                            child: Container(
                              alignment: Alignment.center,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [

                                       Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top: 10),
                                          child: const Text(
                                            "Are you sure you want to logout?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'MontserratAlternates'),


                                          )),
                                      Container(
                                        // width: 100,
                                        // height: 20,

                                        margin: EdgeInsets.only(top: 25),

                                        alignment: Alignment.center,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,

                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 20),

                                              // color: Color(0xFF024e7d),

                                              child: ElevatedButton(
                                                style: ElevatedButton
                                                    .styleFrom(
                                                  backgroundColor:
                                                  AppColor.grayColor,
                                                ),

                                                onPressed: () async {
                                                  //  Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);



                                                  final SecureStorageService
                                                  storageService =
                                                  SecureStorageService();
                                                  await storageService
                                                      .deleteAccessToken();
                                                  Get.offAll(Loginscreen()) ;





                                                },

                                                child: const Text(
                                                  "Yes",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),

                                                // color: const Color(0xFF1BC0C5),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 20),

                                              // color: Color(0xFF024e7d),

                                              child: ElevatedButton(
                                                style: ElevatedButton
                                                    .styleFrom(
                                                    backgroundColor:
                                                    Colors.black),

                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, true);
                                                },

                                                child:const Text(
                                                  "No",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),

                                                // color: const Color(0xFF1BC0C5),
                                              ),
                                            ),






                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });











                  },
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
                  Text("Refer Relationship Manager Details",style: Newtextstyle.nanoText18Bold(AppColor.blackcolor,fontSize*.6),),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
                      Text("Agent Support",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mobile",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
                      Text("+91 7270069008",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
                      Text("Hello@referl.com",style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize*.5),),
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


