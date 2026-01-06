import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/model_view/LoginRespository.dart';
import 'package:jsp/models/ResendOtpResponse.dart';
import 'package:jsp/screens/dashboard_screen.dart';
import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../models/OtpVerificationResponse.dart';

class  OtpVerificationController extends GetxController
{

  late Timer _timer;
  int start = 10;

  bool isLoading2 = false;


  final pinController = TextEditingController();


  var isLoading = false.obs;
  final api =AuthRepository();

  final  networkApiServices=  NetworkApiServices();

  // final  _registerResponse =
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
// final  userList=maincompanyResponse().obs;

  var mobile_no;

  final otpVerificationResponse=OtpVerificationResponse().obs;


 final resendotpresponse=Resendotpresponse().obs;





  @override
  void onInit() {
    super.onInit();

    // print(Preference.shared.getString(Preference.USER_MOBILE));


      mobile_no =Preference.shared.getString(Preference.USER_MOBILE);






  }














  String maskPhoneNumber(String phone) {
    // Take the first 4 digits and add '******' for the rest
    if (phone.length == 10) {
      return phone.substring(0, 4) + "******";
    }
    return phone; // Return as is if the phone number is not valid (not 10 digits)
  }








  //
  //
  // void User_Verificy_Fun() async{
  //   isLoading(true);
  //   update();
  //
  //
  //
  //
  //
  //   print("otps ${pinController.text}");
  //
  //
  //   var map = new Map<String, dynamic>();
  //   map['phone'] = mobile_no;
  //
  //
  //
  //   map['otp'] = pinController.text.toString();
  //
  //
  //   api.OtpVerificationApi(map).then((value)
  //   {
  //
  //
  //     rxRequestStatus.value=Status.COMPLETED;
  //     otpVerificationResponse.value=value;
  //
  //
  //     print( "myfina:"+otpVerificationResponse.value.message.toString());
  //
  //
  //
  //     if(otpVerificationResponse!=null  ) {
  //
  //
  //
  //
  //       if(otpVerificationResponse.value.status==200) {
  //
  //
  //
  //
  //         isLoading(false);
  //
  //         update();
  //
  //
  //         //
  //         // print( "myfinalResponsessss:"+user_login_response.value.message.toString());
  //         //
  //         //
  //         // Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
  //
  //
  //
  //
  //
  //
  //         Get.snackbar(
  //           // user_login_response.value.message.toString(),
  //           "Your OTP has been successfully submitted and updated.",
  //
  //           "",
  //           backgroundColor: AppColor.appColor,
  //
  //
  //
  //           forwardAnimationCurve: Curves.easeOutBack,
  //           snackPosition: SnackPosition.BOTTOM,
  //
  //
  //
  //         );
  //
  //
  //         if(otpVerificationResponse.value.profile_status==true)
  //           {
  //
  //             print(" dcddc");
  //
  //
  //             Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
  //             print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
  //             //
  //           //  Get.offAll(() => MembershipForm());
  //             Get.offAll(() => DashboardScreen());
  //
  //
  //
  //
  //           }else{
  //
  //
  //
  //           Get.offAll(() => MembershipForm());
  //
  //
  //         }
  //
  //
  //
  //
  //
  //
  //
  //       } else if(otpVerificationResponse.value.status==404)
  //         {
  //

  //
  //
  //
  //           isLoading(false);
  //
  //           Get.snackbar(
  //             "Invalid your otp",
  //             "",
  //             backgroundColor: AppColor.whitecolor,
  //             forwardAnimationCurve: Curves.easeOutBack,
  //             snackPosition: SnackPosition.BOTTOM,
  //
  //           );
  //
  //           update();
  //
  //
  //
  //         }
  //
  //
  //
  //
  //       //
  //       // else
  //       // if(user_login_response.value.status==false) {
  //       //
  //       //   isLoading(false);
  //       //   update();
  //       //   Get.snackbar(
  //       //     user_login_response.value.message.toString(),
  //       //     "",
  //       //     backgroundColor: AppColor.activebtncolor,
  //       //
  //       //
  //       //     forwardAnimationCurve: Curves.easeOutBack,
  //       //
  //       //     snackPosition: SnackPosition.BOTTOM,
  //       //
  //       //
  //       //
  //       //   );
  //       //
  //       //
  //       // }
  //       //
  //       //
  //       //
  //
  //     }
  //     //
  //     // else
  //     // {
  //     //
  //     //
  //     //
  //     //   isLoading(false);
  //     //
  //     //   update();
  //     //
  //     //
  //     //   Get.snackbar(
  //     //     "something went wrong",
  //     //     "",
  //     //     backgroundColor: AppColor.activebtncolor,
  //     //     forwardAnimationCurve: Curves.easeOutBack,
  //     //     snackPosition: SnackPosition.BOTTOM,
  //     //
  //     //
  //     //
  //     //
  //     //   );
  //     //
  //     //
  //     //
  //     //
  //     // }
  //     //
  //     //
  //     //
  //     //
  //     //
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
  //
  //   });
  //
  //
  // }
  //

  void ResendOtpfun() async{


    isLoading(true);
    update();


    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no;



    api.Resend_Otp(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      resendotpresponse.value=value;


      /// Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);


      if(resendotpresponse!=null  ) {




        print( "myfinalResponsess:"+resendotpresponse.value.status.toString());




        if(resendotpresponse.value.status==200) {
          isLoading(false);

          update();



          Get.snackbar(
            "Please verify the OTP sent to your phone.",
            "",


            backgroundColor: AppColor.whitecolor,
            colorText: Colors.black,

            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.BOTTOM,


          );






          //    Get.to(()=>Otp(),arguments: [mobile]);
          //
          //
          // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
          //
          //
          // Get.to(() => MyHomeScreen());
          //
          //





        }


        else


           {



          isLoading(false);

          update();


          Get.snackbar(
            otpVerificationResponse.value.message.toString(),
            "",
            backgroundColor: AppColor.whitecolor,

            colorText: Colors.black,


            forwardAnimationCurve: Curves.easeOutBack,

            snackPosition: SnackPosition.BOTTOM,





          );



        }



      }




      else
      {



        isLoading(false);

        update();

        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.whitecolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,



        );




      }



    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });





  }



  void startTimer() {

    // print("dededee");

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {


          print("pradeep");


          // setState(() {

          timer.cancel();
          isLoading2 = false;

          update();



          //   });



        } else {
          //   setState(() {

          print("dededee");


          start--;
          update();


          // });
        }
      },
    );
  }







}
