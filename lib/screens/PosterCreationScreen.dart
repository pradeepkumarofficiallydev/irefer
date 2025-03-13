import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import '../controller/PosterCreationController.dart';

class PosterCreationScreen extends StatefulWidget {
  @override
  _PosterCreationScreenState createState() => _PosterCreationScreenState();
}

class _PosterCreationScreenState extends State<PosterCreationScreen> {
      final picker = ImagePicker();
  TextEditingController textEditingController =TextEditingController();




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   title: Text(
      //     'पोस्टर बनाएं',
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
         /// padding: EdgeInsets.all(16.0),
          child:
        
        
        
          GetBuilder<Postercreationcontroller>(
          init: Postercreationcontroller(),
            builder: (s) =>
        
        
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
        
        
        
        
        
        
              Container(
                padding:  EdgeInsets.symmetric( vertical: height * .5),
                margin:  EdgeInsets.only( bottom: height * .7),


                decoration:  BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(height*1.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: height * 1.2,width: height * .2 ,),
        
        
        
        
        
                    Container(
        
                      padding: EdgeInsets.symmetric(horizontal: height*.4),
        
        
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
        
                        children: [
        
        
        
                          GestureDetector(onTap: (){
        
                            Get.back();
        
        
        
        
        
        
                          },
        
        
                            child: Container(
                                alignment: Alignment.center,
                                child: Icon(Icons.arrow_back_ios_rounded)
        
        
        
        
        
        
        
        
                            ),
                          ),
        
        
        
        
        
        
                          Container(
        
                            margin: EdgeInsets.only(left: height*1.5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'पोस्टर बनाएं',
        
                              style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
                              textAlign: TextAlign.start,
                            ),
                          ),
        
        


                        ],
                      ),
                    ),
        
        
        
        
        
        
        
        
        
        
        
                    //    SizedBox(height: height * .4),
                  ],
                ),
              ),
        
        
        
        
              // Poster Container
              RepaintBoundary(
        
        
        
                key: s.repaintBoundaryKey,
        
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.orange,
                  //   borderRadius: BorderRadius.circular(15),
                  //   border: Border.all(color: Colors.orange, width: 2),
                  // ),
                  child: Stack(
                    children: [
        
                      Container(
                        padding: EdgeInsets.all(2),
                        height: 208,
                        child: Image.asset(
                          "assets/images/first_image.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 180,
                        child:
        
                        // Image.asset(
                        //   "assets/images/kunal.png",
                        //   fit: BoxFit.fill,
                        //   height: 130,
                        // ),
        
        
        
        
        
                        s.imageFile!=null?
        
                        Stack(
                          children: [
                            Image.file(
                             s. imageFile!,
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
        
                            ),
        
        
        
                            InkWell(
        
                                onTap: ()
        
                                {
        
        
                                  setState(() {
                                    s.imageFile=null;
                                  });
        
        
                                },
        
        
                                child: Icon(Icons.close,color: Colors.black,)),
        
                          ],
                        ):SizedBox()
        
        
        
        
        
        
        
        
                      ),
        
        
        
                      Positioned(
        
                        top: 140,
                        left: 10,
                        child: Text
        
        
                          ("${textEditingController.text}",
                          style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.6),),
        
                      )
        
        
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Download and Share Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.download),
                    label: Text('DOWNLOAD'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  // ElevatedButton.icon(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.share),
                  //   label: Text('SHARE'),
                  //   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  // ),
                  s.isLoading.value?
                  Center(
                    child: CustomWidgets.showCircularIndicator1(
                        context, height * .9, AppColor.appColor),
                  )
                      :

                  Container(
        
                    alignment: Alignment.centerLeft,
        
                    child: ElevatedButton(
                      onPressed: () async {
        
        
            // s.uploadImage();
        
        
        
                       s. captureAndSendImage();
        
        
        
        
        
        
        
        
        
        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side: BorderSide(color: AppColor.whitecolor, width: 2.5),
                        padding: EdgeInsets.symmetric(
                          horizontal: height * .7,
                          vertical: height * .2,
                        ),
                      ),
                      child: Text(
                      "Post",
        
                        style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.4),
        
        
        
                      ),
                    ),
                  ),
        
        
                ],
              ),
              SizedBox(height: 16),
              // Name Input Field
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'नाम',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Upload Button
        
        
              Container(
        
                alignment: Alignment.centerLeft,
        
                child: ElevatedButton(
                  onPressed: () async {
                    Map<Permission, PermissionStatus> statuses =
                    await [Permission.camera, Permission.photos].request();
        
                    if (
                    //statuses[Permission.photos]!.isGranted &&
                    statuses[Permission.camera]!.isGranted) {
                     s. showImagePicker(context, height);
                    } else {
                      print('No permission provided');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    side: BorderSide(color: AppColor.whitecolor, width: 2.5),
                    padding: EdgeInsets.symmetric(
                      horizontal: height * .7,
                      vertical: height * .2,
                    ),
                  ),
                  child: Text(
                    "फोटो अपलोड करें",
        
                    style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.4),
        
        
        
                  ),
                ),
              ),
        
            ],
        
        
          ),
          )
        ),
      ),
    );
  }
}