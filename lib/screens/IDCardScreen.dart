
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/Preference.dart';
import '../Utils/custom_widgets.dart';
import '../controller/IDCardScreenController.dart';
import 'DashboardScreen.dart';

import 'package:share_plus/share_plus.dart';



import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';









import 'package:open_file/open_file.dart';

class IDCardScreen extends StatelessWidget {


  final GlobalKey _globalKey = GlobalKey();


  // Request storage permission
  Future<bool> _requestPermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  // Capture the widget as an image
  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      print("Error capturing image: $e");
      throw Exception("Failed to capture image");
    }
  }

  // Save the PDF file and open it
  Future<void> _saveAndOpenPdf(Uint8List imageBytes) async {
    if (!await _requestPermission()) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Storage permission is required to save PDF.')),
      );
      return;
    }

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Image(
            pw.MemoryImage(imageBytes),
            fit: pw.BoxFit.contain,
          ),
        ),
      ),
    );

    try {
      // Get the directory to save the file
      final directory = await getExternalStorageDirectory();
      final path = '${directory!.path}/output.pdf';
      final file = File(path);

      // Save the PDF file
      await file.writeAsBytes(await pdf.save());

      // Notify the user and open the file
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('PDF saved at $path')),
      );
      await OpenFile.open(path);
    } catch (e) {
      print("Error saving or opening PDF: $e");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Failed to save or open PDF.')),
      );
    }
  }











  Future<void> _saveAndOpenPdf1(Uint8List imageBytes) async {
    if (!await _requestPermission()) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Storage permission is required to save PDF.')),
      );
      return;
    }

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Image(
            pw.MemoryImage(imageBytes),
            fit: pw.BoxFit.contain,
          ),
        ),
      ),
    );

    try {
      // Get the directory to save the file
      final directory = await getExternalStorageDirectory();
      final path = '${directory!.path}/output.pdf';
      final file = File(path);

      // Save the PDF file
      await file.writeAsBytes(await pdf.save());

      // Notify the user and open the file
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('PDF saved at $path')),
      );
      await OpenFile.open(path);

      // Share the PDF file
      await Share.shareXFiles(
        [XFile(path)],
        text: 'Check out this PDF I created!',
      );
    } catch (e) {
      print("Error saving, opening, or sharing PDF: $e");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Failed to save, open, or share PDF.')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {



    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio
























    return Scaffold(

      backgroundColor: AppColor.whitecolor,
      body:




        SingleChildScrollView(



          child: Container(
            height: MediaQuery.of(context).size.height, // Constrain height to screen


            child: GetBuilder<IDCardScreenController>(
            init: IDCardScreenController(),
                builder: (s) =>




                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,



                      children: [







                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
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

                                //  padding: EdgeInsets.only(top: height*.),

                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Container(
                                      height: height*1.4,
                                      alignment: Alignment.center,
                                      child: Text(
                                        textAlign: TextAlign.start,

                                        "जन सहमति पार्टी",
                                        style: Newtextstyle.normalopenSans(Colors.white,height*1.2),),



                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '"जनता की सहमति, लोकतंत्र की मजबूती"',

                                        style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.5),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),







                              SizedBox(height: height * .4),
                            ],
                          ),
                        ),










                        SizedBox(height: height * .4),



                        Text(
                          '“सदस्यता ग्रहण करने के लिए धन्यवाद 🙏”',
                          style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.55),),




                        // Title
                        Padding(
                          padding:  EdgeInsets.only(top: height * .6),
                          child: Center(
                            child: Text(
                              "आइडी कार्ड",
                              style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*1),),

                          ),
                        ),
                        SizedBox(height: height * .4),
                        // ID Card









                        s. isLoading.value ?

                        CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor):



                        RepaintBoundary(



                          key: _globalKey,


                          child: Card(
                            color: Colors.black,
                          
                            elevation: 25,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          
                          
                            margin: EdgeInsets.symmetric(horizontal: height * .4),
                            child: Container(
                              padding: EdgeInsets.all(height * .4),
                          
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFFFA726),
                          
                          
                          
                          
                                boxShadow: [
                          
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: Offset(2, 4), // Shadow position
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [Color(0xFFff9700), Color(0xFFfe8100),Color(0xFFffa101),Color(0xFFffa101),], // Gradient colors
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                ),// Light orange card color
                              ),
                              child: Stack(
                          
                                children: [
                          
                          
                                  Positioned(child:
                          
                                  Container(
                          
                          
                                    //   color: Colors.black,
                                    // height: height*1.4,
                                    alignment: Alignment.center,
                                    child: Text(
                                      textAlign: TextAlign.center,
                          
                                      "जन सहमति पार्टी",
                                      style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.green,height*.7),),
                          
                          
                          
                                  ),
                          
                          
                          
                          
                          
                          
                          
                                  ),
                          
                            Positioned(
                              top: 30,
                              left: 60,
                              child:
                          
                          
                            Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '"जनता की सहमति, लोकतंत्र की मजबूती"',
                          
                                      style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.32),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                          
                            ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                          
                          
                          
                          
                          
                          
                          
                                      Column(
                          
                                        crossAxisAlignment: CrossAxisAlignment.start,
                          
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              'assets/images/logo.png'
                                              ,
                          
                                              // Replace with actual photo
                                              height: height * 1.4,
                                              width: height * 1.5,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                          
                          
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(0),
                                            child: Image.network(
                                              '${s.getProfilesResponse.value.data?.profilePicture??""}'
                          
                                              ,
                          
                                              // Replace with actual photo
                                              height: height * 1.5,
                                              width: height * 1.7,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                          
                          
                                          Container(
                                            alignment: Alignment.centerLeft,
                          
                                            child: Text(
                                              "Membership number",
                                              style: Newtextstyle.normalopenSans(Colors.black87,height*.15),),
                                          ),
                          
                          
                          
                          
                          
                                          Container(
                                            alignment: Alignment.centerLeft,
                          
                                            child: Text(
                                              "976343434343333",
                                              style: Newtextstyle.normalopenSans(Colors.black87,height*.21),),
                                          ),
                          
                          
                          
                          
                          
                          
                          
                          
                          
                                          // Footer Section
                                          Center(
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'जय बिहार\n',
                                                style: Newtextstyle.normaNoSpacinglopenSans(Colors.green,height*.4),),
                          
                          
                                                  TextSpan(
                                                    text: 'जय हिंद\n',
                                                    style: Newtextstyle.normaNoSpacinglopenSans(Colors.blue,height*.4),),
                          
                          
                                                  TextSpan(
                                                    text: 'जय भारत',
                          
                          
                                                    style: Newtextstyle.normaNoSpacinglopenSans(Colors.red,height*.4),),
                          
                          
                                                ],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                          
                          
                                        ],
                                      ),
                          
                                      // Left image
                          
                          
                                      SizedBox(width: 16),
                                      // Right details
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                          
                                            Container(
                          
                                              //  padding: EdgeInsets.only(top: height*.),
                          
                          
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                          
                                                 //  Container(
                                                 //
                                                 //
                                                 // //   color: Colors.black,
                                                 //   // height: height*1.4,
                                                 //    alignment: Alignment.center,
                                                 //    child: Text(
                                                 //      textAlign: TextAlign.center,
                                                 //
                                                 //      "जन सहमति पार्टी",
                                                 //      style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.green,height*.7),),
                                                 //
                                                 //
                                                 //
                                                 //  ),
                                                ],
                                              ),
                                            ),
                          
                          
                                            SizedBox(height: 50),
                                            Text(
                                              "Name / नाम: ${s.getProfilesResponse.value.data?.name??""}\nD.O.B: ${s.getProfilesResponse.value.data?.dob??""}\nPhone No: ${s.getProfilesResponse.value.data?.phone??""}\nAddress:${s.getProfilesResponse.value.data?.address??""}",
                                              style: Newtextstyle.normalopenSans(Colors.black87,height*.3),),
                          
                          
                          
                                            Container(
                                              alignment: Alignment.centerLeft,
                          
                                              child: Text(
                                                "",
                                                style: Newtextstyle.normalopenSans(Colors.black87,height*.15),),
                                            ),
                          
                          
                          
                                          ],
                          
                                        ),
                                      ),
                          
                                      //    AssetImage('assets/images/logo.png'),
                          
                          
                                      // Right-side Image
                                      Column(
                          
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                          
                          
                          
                                            // height: 200,
                                            // width: 200,
                          
                                          ///  color: Colors.red,
                          
                                            child: Image.asset(
                          
                          
                          
                          
                          
                          
                                              'assets/images/kunal.png', // Replace with leader photo
                                              height: height * 5,
                                              width: height * 3.3,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                          
                                          Container(
                                            alignment: Alignment.centerLeft,
                          
                                            child: Text(
                                              "+918448775513",
                                              style: Newtextstyle.normalopenSans(Colors.black87,height*.15),),
                                          ),
                          
                          
                          
                          
                                        ],
                                      ),
                                    ],
                                  ),
                          
                          
                                ],
                              ),
                            ),
                          ),
                        ),



                        SizedBox(height: 20),
                        // Download and Share Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [




                            GestureDetector(


                              onTap: ()

                              async {


                                try {
                                  final imageBytes = await _capturePng();
                                  await _saveAndOpenPdf(imageBytes);
                                } catch (e) {
                                  print("Error: $e");
                                }



                              },

                              child: Column(
                                children: [
                                  Icon(Icons.download, color: Colors.black),
                                  Text(
                                    "डाउनलोड",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),






                            GestureDetector(
                              onTap: ()



                              async {


                            try {
                            final imageBytes = await _capturePng();
                            await _saveAndOpenPdf1(imageBytes);
                            } catch (e) {
                            print("Error: $e");
                            }



                            },





                              child: Column(
                                children: [
                                  Icon(Icons.share, color: Colors.black),
                                  Text(
                                    "शेयर",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),




                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
                          decoration:  BoxDecoration(
                            color: AppColor.appColor,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(height*1.2),
                            ),
                          ),
                          child: Container(

                            height:  height * 1.3,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {







                                Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
                                print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
                                //

                                Get.offAll( DashboardScreen());



                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                side: BorderSide(color: AppColor.appColor, width: 2.5),
                                padding: EdgeInsets.symmetric(
                                  horizontal: height * .7,
                                  vertical: height * .2,
                                ),
                              ),
                              child: Text(
                                "  आगे बढ़े  ",
                                style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor,height*.6),



                              ),
                            ),
                          ),
                        ),






                      ],
                    ),



            ),
          ),
        )
    );
  }
}
