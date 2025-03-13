
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/model_view/DashboardScreenRepository.dart';
import 'package:jsp/model_view/LoginRespository.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/StoriesResponse.dart';
import '../screens/MembershipForm.dart';

class  Createstoriescontroller extends GetxController
{




  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isLoading3 = false.obs;


  final api =Dashboardscreenrepository();

  final  networkApiServices=  NetworkApiServices();

  // final  _registerResponse =
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
// final  userList=maincompanyResponse().obs;

  var mobile_no;

  final storiesResponse=StoriesResponse().obs;


  final bannerCarouseResponse=BannerCarouseResponse().obs;


  final reelsResponse=ReelsResponse().obs;






  @override
  void onInit() {
    super.onInit();

    // print(Preference.shared.getString(Preference.USER_MOBILE));


    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);


    getBannerData();

    getStories();
    reelsData();








  }












  String maskPhoneNumber(String phone) {
    // Take the first 4 digits and add '******' for the rest
    if (phone.length == 10) {
      return phone.substring(0, 4) + "******";
    }
    return phone; // Return as is if the phone number is not valid (not 10 digits)
  }










  void getStories() async{
    isLoading(true);
    update();


    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no;



    api.StoriesApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      storiesResponse.value=value;


      print( "myfinalResponse:"+storiesResponse.value.message.toString());


      isLoading(false);
      update();
      // if(otpVerificationResponse!=null  ) {
      //
      //
      //
      //
      //   if(otpVerificationResponse.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //     //
      //     // print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //     //
      //     //
      //     // Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
      //
      //
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Your OTP has been successfully submitted and updated.",
      //
      //       "",
      //       backgroundColor: AppColor.appColor,
      //
      //
      //
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //     );
      //
      //
      //     Get.offAll(() => MembershipForm());
      //
      //
      //
      //
      //   } else if(otpVerificationResponse.value.status==404)
      //   {
      //
      //
      //
      //
      //     isLoading(false);
      //
      //     Get.snackbar(
      //       "Invalid your otp",
      //       "",
      //       backgroundColor: AppColor.whitecolor,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //     );
      //
      //     update();
      //
      //
      //
      //   }
      //
      //
      //
      //
      //   //
      //   // else
      //   // if(user_login_response.value.status==false) {
      //   //
      //   //   isLoading(false);
      //   //   update();
      //   //   Get.snackbar(
      //   //     user_login_response.value.message.toString(),
      //   //     "",
      //   //     backgroundColor: AppColor.activebtncolor,
      //   //
      //   //
      //   //     forwardAnimationCurve: Curves.easeOutBack,
      //   //
      //   //     snackPosition: SnackPosition.BOTTOM,
      //   //
      //   //
      //   //
      //   //   );
      //   //
      //   //
      //   // }
      //   //
      //   //
      //   //
      //
      // }
      // //
      // // else
      // // {
      // //
      // //
      // //
      // //   isLoading(false);
      // //
      // //   update();
      // //
      // //
      // //   Get.snackbar(
      // //     "something went wrong",
      // //     "",
      // //     backgroundColor: AppColor.activebtncolor,
      // //     forwardAnimationCurve: Curves.easeOutBack,
      // //     snackPosition: SnackPosition.BOTTOM,
      // //
      // //
      // //
      // //
      // //   );
      // //
      // //
      // //
      // //
      // // }
      // //
      // //
      // //
      // //
      // //
      //
      //




    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading(false);
      update();

    });


  }








  void getBannerData() async{
    isLoading2(true);
    update();


    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no;



    api.getBannerApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      bannerCarouseResponse.value=value;


      print( "myfinalResponse:"+storiesResponse.value.message.toString());


      isLoading2(false);
      update();
      // if(otpVerificationResponse!=null  ) {
      //
      //
      //
      //
      //   if(otpVerificationResponse.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //     //
      //     // print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //     //
      //     //
      //     // Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
      //
      //
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Your OTP has been successfully submitted and updated.",
      //
      //       "",
      //       backgroundColor: AppColor.appColor,
      //
      //
      //
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //     );
      //
      //
      //     Get.offAll(() => MembershipForm());
      //
      //
      //
      //
      //   } else if(otpVerificationResponse.value.status==404)
      //   {
      //
      //
      //
      //
      //     isLoading(false);
      //
      //     Get.snackbar(
      //       "Invalid your otp",
      //       "",
      //       backgroundColor: AppColor.whitecolor,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //     );
      //
      //     update();
      //
      //
      //
      //   }
      //
      //
      //
      //
      //   //
      //   // else
      //   // if(user_login_response.value.status==false) {
      //   //
      //   //   isLoading(false);
      //   //   update();
      //   //   Get.snackbar(
      //   //     user_login_response.value.message.toString(),
      //   //     "",
      //   //     backgroundColor: AppColor.activebtncolor,
      //   //
      //   //
      //   //     forwardAnimationCurve: Curves.easeOutBack,
      //   //
      //   //     snackPosition: SnackPosition.BOTTOM,
      //   //
      //   //
      //   //
      //   //   );
      //   //
      //   //
      //   // }
      //   //
      //   //
      //   //
      //
      // }
      // //
      // // else
      // // {
      // //
      // //
      // //
      // //   isLoading(false);
      // //
      // //   update();
      // //
      // //
      // //   Get.snackbar(
      // //     "something went wrong",
      // //     "",
      // //     backgroundColor: AppColor.activebtncolor,
      // //     forwardAnimationCurve: Curves.easeOutBack,
      // //     snackPosition: SnackPosition.BOTTOM,
      // //
      // //
      // //
      // //
      // //   );
      // //
      // //
      // //
      // //
      // // }
      // //
      // //
      // //
      // //
      // //
      //
      //




    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading2(false);
      update();

    });


  }














  void reelsData() async{
    isLoading3(true);
    update();


    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no;



    api.getReelsApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      reelsResponse.value=value;


      print( "myfinalResponse:"+storiesResponse.value.message.toString());


      isLoading3(false);
      update();





      // if(otpVerificationResponse!=null  ) {
      //
      //
      //
      //
      //   if(otpVerificationResponse.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //     //
      //     // print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //     //
      //     //
      //     // Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
      //
      //
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Your OTP has been successfully submitted and updated.",
      //
      //       "",
      //       backgroundColor: AppColor.appColor,
      //
      //
      //
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //     );
      //
      //
      //     Get.offAll(() => MembershipForm());
      //
      //
      //
      //
      //   } else if(otpVerificationResponse.value.status==404)
      //   {
      //
      //
      //
      //
      //     isLoading(false);
      //
      //     Get.snackbar(
      //       "Invalid your otp",
      //       "",
      //       backgroundColor: AppColor.whitecolor,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //     );
      //
      //     update();
      //
      //
      //
      //   }
      //
      //
      //
      //
      //   //
      //   // else
      //   // if(user_login_response.value.status==false) {
      //   //
      //   //   isLoading(false);
      //   //   update();
      //   //   Get.snackbar(
      //   //     user_login_response.value.message.toString(),
      //   //     "",
      //   //     backgroundColor: AppColor.activebtncolor,
      //   //
      //   //
      //   //     forwardAnimationCurve: Curves.easeOutBack,
      //   //
      //   //     snackPosition: SnackPosition.BOTTOM,
      //   //
      //   //
      //   //
      //   //   );
      //   //
      //   //
      //   // }
      //   //
      //   //
      //   //
      //
      // }
      // //
      // // else
      // // {
      // //
      // //
      // //
      // //   isLoading(false);
      // //
      // //   update();
      // //
      // //
      // //   Get.snackbar(
      // //     "something went wrong",
      // //     "",
      // //     backgroundColor: AppColor.activebtncolor,
      // //     forwardAnimationCurve: Curves.easeOutBack,
      // //     snackPosition: SnackPosition.BOTTOM,
      // //
      // //
      // //
      // //
      // //   );
      // //
      // //
      // //
      // //
      // // }
      // //
      // //
      // //
      // //
      // //
      //
      //




    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading3(false);
      update();

    });


  }




}
