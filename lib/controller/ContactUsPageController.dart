
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsp/model_view/MemberShipRespositry.dart';
import 'package:jsp/screens/DashboardScreen.dart';
import 'package:jsp/screens/OTPVerificationScree.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/DashboardScreenRepository.dart';
import '../model_view/LoginRespository.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';
import '../models/UserLoginResponse.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class  Contactuspagecontroller extends GetxController
{

  int selectedGender = 1; // 0 for no selection, 1 for "पुरुष", 2 for "महिला", 3 for "अन्य"

  String selectedDate = "जन्म तिथि"; // Default text

  var isLoading = false.obs;
  final api =Dashboardscreenrepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final stateResponse=StateResponse().obs;

  final districtResponse= DistrictResponse().obs;

  TextEditingController name_controller = TextEditingController();

  TextEditingController subject_controller = TextEditingController();

  TextEditingController dec_controller = TextEditingController();

  TextEditingController mobileno_controller = TextEditingController();




  var mobile_no;
  File? imageFile;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);



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


  bool isInputValid( String name,String phone,  String subject_controller, String dec_controller) {


    print("ddcdcdcdc       {$name}");



    return  name.isNotEmpty && (phone.length>=10) && subject_controller.isNotEmpty &&dec_controller.isNotEmpty ;
  }


  void showInputError( String name,String phone,  String subject_controller, String dec_controller) {



    if (name.isEmpty) {
      showToastBar("Please fill Name");
    }

    else   if (phone.length<10) {
      showToastBar("Please enter a 10-digit phone number.");
    }




    else  if (subject_controller.isEmpty) {
      showToastBar("Please fill subject");
    }





    else if (dec_controller.isEmpty) {
      showToastBar("Please fill डिस्क्रिपशन");
    }



  }





  void ContactusFun() async{
    isLoading(true);
    update();



    var map = new Map<String, dynamic>();
    map['mobile'] = mobileno_controller.text.toString();
    map['name'] = name_controller.text.toString();

    map['subject'] = subject_controller.text.toString();

    map['description'] = dec_controller.text.toString();

    api.ContactusApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
   //   stateResponse.value=value;


      update();





        Get.snackbar(
          "ContactUs Created successfully!",
          "",
          backgroundColor: AppColor.appColor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,




        );



      Get.off(DashboardScreen());

      // if(stateResponse.value.status==200) {
      //
      //
      //
      //
      //
      //
      //
      // }
      //
      // else
      // {
      //
      //
      //
      //   isLoading(false);
      //
      //   update();
      //
      //
      //   Get.snackbar(
      //     "something went wrong",
      //     "",
      //     backgroundColor: AppColor.appColor,
      //     forwardAnimationCurve: Curves.easeOutBack,
      //     snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //
      //   );
      //
      //
      //
      //
      // }
      //
      //
      //








    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }










}
