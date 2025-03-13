
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/screens/DashboardScreen.dart';


import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/AgendaRepository.dart';
import '../models/DistrictResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/GetTaskListRespnse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/SamanyabaithakListResponse.dart';
import '../models/StateResponse.dart';
import '../models/StoriesResponse.dart';
import '../models/UpdateProfilesResponse.dart';
import '../screens/MembershipForm.dart';





import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsp/model_view/MemberShipRespositry.dart';
import 'package:jsp/screens/OTPVerificationScree.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';
import '../models/UserLoginResponse.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class  Samanyabaithakcontroller extends GetxController
{

  TextEditingController controller=TextEditingController();
  TextEditingController controller1=TextEditingController();

  File? imageFile;

  final picker = ImagePicker();


  var isLoading = true.obs;

  final stateResponse=StateResponse().obs;

  final districtResponse= DistrictResponse().obs;

  final api =AgendaRepository();

  final  networkApiServices=  NetworkApiServices();

  // final  _registerResponse =
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;

  var mobile_no;


  final samanyabaithakListResponse= SamanyabaithakListResponse().obs;

  void SamanyabaithakListfun() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no.toString();
    api.SamanyabaithakList(map).then((value)
    async {


      rxRequestStatus.value=Status.COMPLETED;
      samanyabaithakListResponse.value=value;
      isLoading(false);
      update();







    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading(false);
      update();

    });


  }




  //
  // void getAgendaSingleData() async{
  //   isLoading(true);
  //   update();
  //
  //
  //
  //
  //   var map = new Map<String, dynamic>();
  //   map['phone'] = mobile_no.toString();
  //   api.getTaskListApi(map).then((value)
  //   async {
  //
  //
  //     rxRequestStatus.value=Status.COMPLETED;
  //     getTaskListRespnse.value=value;
  //     isLoading(false);
  //     update();
  //
  //
  //
  //
  //
  //
  //
  //   }
  //
  //   ).onError((error, stackTrace)
  //   {
  //
  //
  //     rxRequestStatus.value=Status.ERROR;
  //     Error.value=error.toString();
  //
  //     isLoading(false);
  //     update();
  //
  //   });
  //
  //
  // }
  //
  //


















  Future<void> uploadImage() async {
    // if (imageFile == null) {
    //   ScaffoldMessenger.of(Get.context!!).showSnackBar(
    //     SnackBar(content: Text("Please select an image first!")),
    //   );
    //   return;
    // }




    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Strings.baseUrl}todolist/store'),

        // Replace with your server URL
      );




      request.fields['title'] =  controller.text;; // Add 'name' field
      request.fields['description'] =  controller1.text; // Add 'name' field




      request.files.add(await http.MultipartFile.fromPath(
        'image', // Field name expected by the server
        imageFile!.path,
      ));



      var response = await request.send();




        if (response.statusCode == 200) {


          Get.off(DashboardScreen());


          ScaffoldMessenger.of(Get.context!!).showSnackBar(
            SnackBar(content: Text("Upload successful!")),
          );
        } else {
          ScaffoldMessenger.of(Get.context!!).showSnackBar(
            SnackBar(content: Text("Upload failed!")),
          );
        }




    } catch (e) {
      print(e);
      ScaffoldMessenger.of(Get.context!!).showSnackBar(
        SnackBar(content: Text("An error occurred!")),
      );
    }
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





  @override
  Future<void> onInit() async {
    super.onInit();

    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);


    SamanyabaithakListfun();







  }

}

