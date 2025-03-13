//
//
//
// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jsp/model_view/DashboardScreenRepository.dart';
// import 'package:jsp/model_view/LoginRespository.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/Preference.dart';
// import '../data/BannerCarouseResponse.dart';
// import '../data/network/network_api_services.dart';
// import '../data/response/status.dart';
// import '../models/OtpVerificationResponse.dart';
// import '../models/ReelsResponse.dart';
// import '../models/StoriesResponse.dart';
// import '../screens/MembershipForm.dart';
//
// class  Postercreationcontroller extends GetxController
// {
//
//
//
//
//   var isLoading = false.obs;
//   var isLoading2 = false.obs;
//   var isLoading3 = false.obs;
//
//
//   final api =Dashboardscreenrepository();
//
//   final  networkApiServices=  NetworkApiServices();
//
//   // final  _registerResponse =
//   final  rxRequestStatus=Status.LOADING.obs;
//   final RxString  Error=''.obs;
// // final  userList=maincompanyResponse().obs;
//
//   var mobile_no;
//
//   final storiesResponse=StoriesResponse().obs;
//
//
//   final bannerCarouseResponse=BannerCarouseResponse().obs;
//
//
//   final reelsResponse=ReelsResponse().obs;
//
//
//
//
//
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // print(Preference.shared.getString(Preference.USER_MOBILE));
//
//
//     mobile_no =Preference.shared.getString(Preference.USER_MOBILE);
//
//
//     getBannerData();
//
//
//
//
//
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//   String maskPhoneNumber(String phone) {
//     // Take the first 4 digits and add '******' for the rest
//     if (phone.length == 10) {
//       return phone.substring(0, 4) + "******";
//     }
//     return phone; // Return as is if the phone number is not valid (not 10 digits)
//   }
//
//
//
//
//
//
//
//
//
//
//   void getStories() async{
//     isLoading(true);
//     update();
//
//
//     var map = new Map<String, dynamic>();
//     map['phone'] = mobile_no;
//
//
//
//     api.StoriesApi(map).then((value)
//     {
//
//
//       rxRequestStatus.value=Status.COMPLETED;
//       storiesResponse.value=value;
//
//
//       print( "myfinalResponse:"+storiesResponse.value.message.toString());
//
//
//       isLoading(false);
//       update();
//
//
//     }
//
//     ).onError((error, stackTrace)
//     {
//
//
//       rxRequestStatus.value=Status.ERROR;
//       Error.value=error.toString();
//
//       isLoading(false);
//       update();
//
//     });
//
//
//   }
//
//
//
//
//
//
//
//
//   void getBannerData() async{
//     isLoading2(true);
//     update();
//
//
//     var map = new Map<String, dynamic>();
//     map['phone'] = mobile_no;
//
//
//
//     api.getBannerApi(map).then((value)
//     {
//
//
//       rxRequestStatus.value=Status.COMPLETED;
//       bannerCarouseResponse.value=value;
//
//
//       print( "myfinalResponse:"+storiesResponse.value.message.toString());
//
//
//       isLoading2(false);
//       update();
//
//
//     }
//
//     ).onError((error, stackTrace)
//     {
//
//
//       rxRequestStatus.value=Status.ERROR;
//       Error.value=error.toString();
//
//       isLoading2(false);
//       update();
//
//     });
//
//
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//   void reelsData() async{
//     isLoading3(true);
//     update();
//
//
//     var map = new Map<String, dynamic>();
//     map['phone'] = mobile_no;
//
//
//
//     api.getReelsApi(map).then((value)
//     {
//
//
//       rxRequestStatus.value=Status.COMPLETED;
//       reelsResponse.value=value;
//
//
//       print( "myfinalResponse:"+storiesResponse.value.message.toString());
//
//
//       isLoading3(false);
//       update();
//
//
//
//
//     }
//
//     ).onError((error, stackTrace)
//     {
//
//
//       rxRequestStatus.value=Status.ERROR;
//       Error.value=error.toString();
//
//       isLoading3(false);
//       update();
//
//     });
//
//
//   }
//
//
//
//
// }









import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsp/controller/DashboardScreenController.dart';
import 'package:jsp/model_view/MemberShipRespositry.dart';
import 'package:jsp/screens/DashboardScreen.dart';
import 'package:jsp/screens/OTPVerificationScree.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../Utils/custom_widgets.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';

import 'package:http/http.dart' as http;




import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class  Postercreationcontroller extends GetxController
{

  String selectedDate = "जन्म तिथि"; // Default text

  var isLoading = false.obs;
  final api =Membershiprespositry();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final stateResponse=StateResponse().obs;

  final districtResponse= DistrictResponse().obs;

  TextEditingController name_controller = TextEditingController();
  GlobalKey repaintBoundaryKey = GlobalKey();



  TextEditingController mobileno_controller = TextEditingController();
  TextEditingController nirvachan_controller = TextEditingController();
  TextEditingController panchayt_controller = TextEditingController();
  TextEditingController village_controller = TextEditingController();
  TextEditingController pincode_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();








  Future<File?> captureContainerAsImageFile() async {
    try {
      RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        Uint8List imageBytes = byteData.buffer.asUint8List();

        // Save the image to a temporary file
        final directory = await getTemporaryDirectory();
        File file = File('${directory.path}/container_image.png');
        await file.writeAsBytes(imageBytes);

        return file;
      }
    } catch (e) {
      print('Error capturing image: $e');
    }
    return null;
  }

  /// Sends the image file to the server as multipart/form-data
  Future<void> sendImageToServer(File imageFile) async {
    try {



      var user_id =Preference.shared.getString(Preference.USER_ID);

      print(" dx  xd${user_id}");




      // try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://jsp.socialpost.co.in/api/stories/store'),

        // Replace with your server URL
      );




      request.fields['user_id'] =  user_id!; // Add 'name' field

      request.fields['type'] =  "image"; // Add 'name' field




      request.files.add(await http.MultipartFile.fromPath(
        'image', // Field name expected by the server
        imageFile!.path,
      ));



      var response = await request.send();



      var responseString = await response.stream.bytesToString();
      //   var jsonResponse = jsonDecode(responseString);

      // Print or process the JSON response
      print(responseString);

      // Send the request
      //var response = await request.send();

      if (response.statusCode == 200) {

        isLoading(false);
        update();


        bool test = Get.isRegistered<Dashboardscreencontroller>();

        if(test)
        {

          final homecontroller= Get.find<Dashboardscreencontroller>();
          homecontroller.getStories();

          print("checking111");
          homecontroller.update();


        }


        Get.off(DashboardScreen());









        ScaffoldMessenger.of(Get.context!!).showSnackBar(
          SnackBar(content: Text("Created story successfully!")),
        );

        print('Image uploaded successfully!');
      } else {

        isLoading(false);
        update();
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      isLoading(false);
      update();
      print('Error uploading image: $e');
    }
  }





  /// Captures the image and sends it to the server
  void captureAndSendImage() async {

    isLoading(true);
    update();


    File? imageFile = await captureContainerAsImageFile();
    if (imageFile != null) {
      print('Captured image saved at: ${imageFile.path}');
      await sendImageToServer(imageFile);
    } else {
      print('Failed to capture the image.');
    }
  }
  var mobile_no;
  File? imageFile;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);



  }

  void showImagePicker(BuildContext context, double height) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Container(

              color: Colors.white,


              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.2,



              margin:  EdgeInsets.only(top: height*1,bottom:  height*1),
              padding:  EdgeInsets.all(height*.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                        child: Column(
                          children:  [
                            Icon(
                              Icons.image,
                              size: 60.0,
                            ),
                            SizedBox(height:  height*.1),
                            Text(
                              "Gallery",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: height*.4, color: Colors.black),
                            )
                            ,
                            //    SizedBox(height:  height*.4),



                          ],
                        ),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.pop(context);
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: SizedBox(
                          child: Column(
                            children:  [
                              Icon(
                                Icons.camera_alt,
                                size: 60.0,
                              ),
                              SizedBox(height: height*.1),


                              Text(
                                "Camera",
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(fontSize: height*.4, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          _imgFromCamera();
                          Navigator.pop(context);
                        },
                      ))
                ],
              ));
        });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));
        imageFile = File(value.path);

        update();



      }
    });
  }


  void showToastBar(String message){


    //
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.black,
    //   textColor: Colors.white,
    //   fontSize: 13.0,
    // );
    //









    Get.snackbar(
      // user_login_response.value.message.toString(),
      message,

      "",
      backgroundColor: AppColor.appColor,


      forwardAnimationCurve: Curves.easeOutBack,
      snackPosition: SnackPosition.BOTTOM,



    );



  }


  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));

        imageFile = File(value.path);
        update();

      }
    });
  }







  Future<void> uploadImage() async {
    // if (imageFile == null) {
    //   ScaffoldMessenger.of(Get.context!!).showSnackBar(
    //     SnackBar(content: Text("Please select an image first!")),
    //   );
    //   return;
    // }
    print(" dx  xd");
    var user_id =Preference.shared.getString(Preference.USER_ID);

    print(" dx  xd${user_id}");




   // try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://jsp.socialpost.co.in/api/stories/store'),

        // Replace with your server URL
      );




      request.fields['user_id'] =  user_id!; // Add 'name' field

      request.fields['type'] =  "image"; // Add 'name' field




      request.files.add(await http.MultipartFile.fromPath(
        'image', // Field name expected by the server
        imageFile!.path,
      ));



      var response = await request.send();



      var responseString = await response.stream.bytesToString();
   //   var jsonResponse = jsonDecode(responseString);

      // Print or process the JSON response
      print(responseString);


     // print(" images ${response.stream}");


      //   if (response.statusCode == 200) {
      //     ScaffoldMessenger.of(Get.context!!).showSnackBar(
      //       SnackBar(content: Text("Upload successful!")),
      //     );
      //   } else {
      //     ScaffoldMessenger.of(Get.context!!).showSnackBar(
      //       SnackBar(content: Text("Upload failed!")),
      //     );
      //   }




    // } catch (e) {
   //   print(e);
      ScaffoldMessenger.of(Get.context!!).showSnackBar(
        SnackBar(content: Text("An error occurred!")),
      );
  //  }
  }



  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      //  locale: const Locale('hi', 'IN'), // Set to Hindi locale if needed
    );
    if (picked != null) {
      selectedDate = "${picked.day}-${picked.month}-${picked.year}"; // Format date
      update();
    }
  }




}
class StateData {
  final int id;
  final String name;

  StateData({required this.id, required this.name});

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      id: json['id'],
      name: json['name'],
    );
  }
}