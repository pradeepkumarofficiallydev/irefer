//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:jsp/screens/otp_verification_screen.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/Preference.dart';
// import '../data/network/network_api_services.dart';
// import '../data/response/status.dart';
// import '../model_view/LoginRespository.dart';
// import '../models/UserLoginResponse.dart';
//
// class  LoginController extends GetxController
// {
//
//
//   var isLoading = false.obs;
//   final api =AuthRepository();
//   final  networkApiServices=  NetworkApiServices();
//   final  rxRequestStatus=Status.LOADING.obs;
//   final RxString  Error=''.obs;
//   final user_login_response=UserLoginResponse().obs;
//
//   TextEditingController mobileno_controller = TextEditingController();
//
//
//
//   @override
//   void onInit() {
//     super.onInit();
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
//   void User_Login_fun() async{
//     isLoading(true);
//     update();
//
//
//
//
//     var map = new Map<String, dynamic>();
//     map['phone'] = mobileno_controller.text.toString();
//     api.User_Login_Api(map).then((value)
//     {
//
//
//       rxRequestStatus.value=Status.COMPLETED;
//       user_login_response.value=value;
//
//
//       print( "myfinalResponse:"+user_login_response.value.message.toString());
//
//
//
//       if(user_login_response!=null  ) {
//
//
//        // Get.to(() => OTPVerificationScreen());
//
//
//         if(user_login_response.value.status==200) {
//
//           isLoading(false);
//
//           update();
//
//
//
//           print( "myfinalResponsessss:"+user_login_response.value.message.toString());
//
//
//          Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
//
//
//           //
//           //
//           // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
//           //
//           //
//           // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
//           //
//
//
//
//
//
//
//
//
//           Get.snackbar(
//             // user_login_response.value.message.toString(),
//             "Send otp your registered mobile number",
//
//             "",
//             backgroundColor: AppColor.whitecolor,
//
//
//             forwardAnimationCurve: Curves.easeOutBack,
//             snackPosition: SnackPosition.BOTTOM,
//
//
//
//           );
//
//
//           Get.to(() => OTPVerificationScreen());
//
//
//
//
//         }
//
//
//
//
//
//           else
//           if(user_login_response.value.status==404) {
//
//             isLoading(false);
//             update();
//             Get.snackbar(
//             user_login_response.value.message.toString(),
//             "",
//             backgroundColor: AppColor.activebtncolor,
//
//
//             forwardAnimationCurve: Curves.easeOutBack,
//
//             snackPosition: SnackPosition.BOTTOM,
//
//
//
//           );
//
//
//         }
//           }
//
//       else
//       {
//
//
//
//         isLoading(false);
//
//         update();
//
//
//         Get.snackbar(
//           "something went wrong",
//           "",
//           backgroundColor: AppColor.activebtncolor,
//           forwardAnimationCurve: Curves.easeOutBack,
//           snackPosition: SnackPosition.BOTTOM,
//
//
//
//
//         );
//
//
//
//
//       }
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
//     }
//
//     ).onError((error, stackTrace)
//     {
//
//
//       rxRequestStatus.value=Status.ERROR;
//       Error.value=error.toString();
//
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
//   bool isInputValid( String phone ) {
//     return  phone.isNotEmpty && (phone.length>=10) ;
//   }
//
//   void showInputError( String phone  ) {
//     if (phone.isEmpty) {
//       showToastBar("Please fill phone no.");
//     }
//
//     else   if (phone.length<10) {
//       showToastBar("Please enter a 10-digit phone number.");
//     }
//
//
//   }
//
//
//   void showToastBar(String message){
//
//
//     //
//     // Fluttertoast.showToast(
//     //   msg: message,
//     //   toastLength: Toast.LENGTH_LONG,
//     //   gravity: ToastGravity.BOTTOM,
//     //   timeInSecForIosWeb: 1,
//     //   backgroundColor: Colors.black,
//     //   textColor: Colors.white,
//     //   fontSize: 13.0,
//     // );
//     //
//
//
//
//
//
//
//
//
//
//     Get.snackbar(
//       // user_login_response.value.message.toString(),
//       message,
//
//       "",
//       backgroundColor: AppColor.appColor,
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
//
//   }
//
//
//
//
// }
