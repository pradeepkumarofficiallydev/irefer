import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/models/OtpVerificationResponse.dart';
import 'package:jsp/models/ProfessionsResponse.dart';
import 'package:jsp/models/UserRegisterResponse.dart';
import 'package:jsp/screens/dashboard_screen.dart';
import 'package:jsp/screens/otp_verification_screen.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/SecureStorageService.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/AuthRepository.dart';
import '../models/UserLoginResponse.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String? selectedOrganizationType = 'Individual';
  String? selectedProfession;
  bool agreeTerms = false;
  final List<String> professions = [
    'Select Profession',
    'Business',
    'Student',
    'Employee',
    'Freelancer',
    'Other'
  ];

  final SecureStorageService storageService = SecureStorageService();

  List<ProfessionsResponse> professionsList = [];
  var isLoading = false.obs;
  final api = AuthRepository();
  final networkApiServices = NetworkApiServices();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;
  final user_login_response = UserLoginResponse().obs;

  final otpVerificationResponse = OtpVerificationResponse().obs;

  final userRegisterResponse = UserRegisterResponse().obs;

  final professionsResponse = ProfessionsResponse().obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final TextEditingController gstinController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    // getProfessionFun();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      if (!agreeTerms) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Please agree to the terms and conditions')),
        );
        return;
      }

      registerFun();

      // // Handle form submission
      // print('Registration Data:');
      // print('Organization Type: $_selectedOrganizationType');
      // print('Name: ${_nameController.text}');
      // print('Mobile: ${_mobileController.text}');
      // print('Email: ${_emailController.text}');
      // print('PAN: ${_panController.text}');
      // print('Address: ${_addressController.text}');
      // print('PIN: ${_pinController.text}');
      // print('Profession: $_selectedProfession');
      // print('Referral Code: ${_referralController.text}');
      // print('GSTIN: ${_gstinController.text}');
      //
      //
    }
  }

  void login_fun() async {
    isLoading(true);
    update();

    Map<String, String> map = Map<String, String>();

    map = {
      "mobile": mobileController.text,
    };

    api.loginAPI(map).then((value) async {
      rxRequestStatus.value = Status.COMPLETED;
      user_login_response.value = value;

      isLoading(false);
      update();

      if (user_login_response.value.data != null) {
        if (user_login_response.value.success == true) {
          print("first");

          // Preference.shared.setString(Preference.USER_MOBILE, mobileController.text);

          //   Get.offNamed('/dashboard', arguments: {'refresh': true});
          Get.to(OTPVerificationScreen());

          print("third");
        } else {
          print("second");
        }

        // {message: OTP sent successfully to mobile, data: 635521, error: false, success: true}
      }

      //  print("my final response ${user_login_response.value.data?.data.firstName }");
    }).onError((error, stackTrace) {
      print(error);

      isLoading(false);
      update();

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  // void otp_verification_fun()  async{
  //
  //   isLoading(true);
  //   update();
  //
  //
  //
  //   Map<String, String> map =Map<String, String>();
  //
  //   map =   {
  //     "mobile": mobileController.text,
  //
  //   };
  //
  //
  //   api.loginAPI(map) .then((value)
  //   async {
  //
  //     rxRequestStatus.value=Status.COMPLETED;
  //     user_login_response.value=value;
  //
  //
  //     isLoading(false);
  //     update();
  //
  //
  //     if(user_login_response.value.data!=null)
  //     {
  //
  //
  //
  //
  //       //  await storageService.saveAccessToken(loginResponse.value.data?.token??"");
  //       //   Get.offNamed('/dashboard', arguments: {'refresh': true});
  //
  //
  //     //  Get.to(OTPVerificationScreen());
  //
  //
  //
  //
  //
  //
  //     }
  //
  //
  //     //  print("my final response ${user_login_response.value.data?.data.firstName }");
  //
  //
  //   }
  //
  //
  //   ).onError((error, stackTrace)
  //   {
  //
  //     isLoading(false);
  //     update();
  //
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

  void User_Verificy_Fun() async {
    isLoading(true);
    update();

    print("otps ${pinController.text}");

    print("otps ${mobileController.text}");

    var map = new Map<String, dynamic>();
    map['mobile'] = mobileController.text;

    map['otp'] = pinController.text.toString();

    api.OtpVerificationApi(map).then((value) async {
      rxRequestStatus.value = Status.COMPLETED;
      otpVerificationResponse.value = value;

      print("myfina:" + otpVerificationResponse.value.message.toString());

      if (otpVerificationResponse != null) {
        if (otpVerificationResponse.value.success == true) {
          isLoading(false);

          update();

          Get.snackbar(
            // user_login_response.value.message.toString(),
            "Your OTP has been successfully submitted and updated.",

            "",
            backgroundColor: AppColor.appColor,

            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.BOTTOM,
          );

          if (otpVerificationResponse.value.success == true) {
            print(" dcddc");

            await storageService
                .saveAccessToken(otpVerificationResponse.value?.token ?? "");

            Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
            print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
            //
            //  Get.offAll(() => MembershipForm());
            Get.offAll(() => DashboardScreen());
          } else {
            Get.offAll(() => DashboardScreen());
          }
        }

        // else if(otpVerificationResponse.value.status==404)
        // {
        //
        //
        //
        //
        //   isLoading(false);
        //
        //   Get.snackbar(
        //     "Invalid your otp",
        //     "",
        //     backgroundColor: AppColor.whitecolor,
        //     forwardAnimationCurve: Curves.easeOutBack,
        //     snackPosition: SnackPosition.BOTTOM,
        //
        //   );
        //
        //   update();
        //
        //
        //
        // }

        //
        // else
        // if(user_login_response.value.status==false) {
        //
        //   isLoading(false);
        //   update();
        //   Get.snackbar(
        //     user_login_response.value.message.toString(),
        //     "",
        //     backgroundColor: AppColor.activebtncolor,
        //
        //
        //     forwardAnimationCurve: Curves.easeOutBack,
        //
        //     snackPosition: SnackPosition.BOTTOM,
        //
        //
        //
        //   );
        //
        //
        // }
        //
        //
        //
      }
    }).onError((error, stackTrace) {
      isLoading(false);
      update();

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void registerFun() async {
    isLoading(true);
    update();

    // // Handle form submission
    // print('Registration Data:');

    // print('Organization Type: $_selectedOrganizationType');
    // print('Name: ${_nameController.text}');
    // print('Mobile: ${_mobileController.text}');
    // print('Email: ${_emailController.text}');
    // print('PAN: ${_panController.text}');
    // print('Address: ${_addressController.text}');
    // print('PIN: ${_pinController.text}');
    // print('Profession: $_selectedProfession');
    // print('Referral Code: ${_referralController.text}');
    // print('GSTIN: ${_gstinController.text}');
    //
    //

    //
    //   {
    //     "organisationtype":"Individual",
    //   "partnercode":"",
    //   "partnerempcode":"",
    //   "name":"cd",
    //   "email":"pk@gmail.com",
    //   "mobile":"9520583930",
    //   "panno":"BNJY6789R",
    //   "address":"",
    //   "pinno":"201007",
    //   "city":"",
    //   "district":"",
    //   "state":"",
    //   "profession":"679941c0f6fd08d3e4c85a63",
    //   "referralcode":"",
    //   "gstin":""
    // }

    var map = new Map<String, dynamic>();

    map['organisationtype'] = selectedOrganizationType;

    map['name'] = nameController.text.toString();
    map['mobile'] = mobileController.text.toString();

    map['email'] = emailController.text.toString();

    map['panno'] = panController.text.toString();
    map['address'] = addressController.text.toString();
    map['pinno'] = pinController.text.toString();

    map['referralcode'] = referralController.text.toString();
    map['gstin'] = gstinController.text.toString();
    map['profession'] = gstinController.text.toString();

    api.User_Resgister_Api(map).then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      userRegisterResponse.value = value;

      print("myfinalResponse:" + user_login_response.value.message.toString());

      if (userRegisterResponse != null) {
        // Get.to(() => OTPVerificationScreen());

        if (userRegisterResponse.value.success == true) {
          isLoading(false);

          update();

          print("myfinalResponsessss:" +
              user_login_response.value.message.toString());

          Preference.shared.setString(
              Preference.USER_MOBILE, mobileController.text.toString());

          //
          //
          // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
          //
          //
          // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
          //

          Get.snackbar(
            // user_login_response.value.message.toString(),
            "Send otp your registered mobile number",

            "",
            backgroundColor: AppColor.whitecolor,

            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.BOTTOM,
          );

          //    Get.to(() => OTPVerificationScreen());
        } else if (userRegisterResponse.value.success == false) {
          isLoading(false);
          update();
          Get.snackbar(
            user_login_response.value.message.toString(),
            "",
            backgroundColor: AppColor.activebtncolor,
            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        isLoading(false);

        update();

        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.activebtncolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void getProfessionFun() async {
    isLoading(true);
    update();

    print('DCDCDCD');

    var map = new Map<String, dynamic>();

    map['profession'] = gstinController.text.toString();

    //   var response= await http.get(Uri.parse("http://api.primelendinghub.in/api/allprofession")).timeout(const Duration( seconds: 30));

    api.getProfessionFun(map).then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      professionsResponse.value = value;

      // professionsList = professionsResponse.value.map((item) => ProfessionsResponse.fromJson(item)).toList();

      print("myfinalResponse:" + professionsResponse.value.toString());
    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  //
  // void ResendOtpfun() async{
  //
  //

  //   isLoading(true);
  //   update();
  //
  //
  //   var map = new Map<String, dynamic>();
  //   map['phone'] = mobile_no;
  //
  //
  //
  //   api.Resend_Otp(map).then((value)
  //   {
  //
  //
  //     rxRequestStatus.value=Status.COMPLETED;
  //     resendotpresponse.value=value;
  //
  //
  //     /// Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
  //
  //
  //     if(resendotpresponse!=null  ) {
  //
  //
  //
  //
  //       print( "myfinalResponsess:"+resendotpresponse.value.status.toString());
  //
  //
  //
  //
  //       if(resendotpresponse.value.status==200) {
  //         isLoading(false);
  //
  //         update();
  //
  //
  //
  //         Get.snackbar(
  //           "Please verify the OTP sent to your phone.",
  //           "",
  //
  //
  //           backgroundColor: AppColor.whitecolor,
  //           colorText: Colors.black,
  //
  //           forwardAnimationCurve: Curves.easeOutBack,
  //           snackPosition: SnackPosition.BOTTOM,
  //
  //
  //         );
  //
  //
  //
  //
  //
  //
  //         //    Get.to(()=>Otp(),arguments: [mobile]);
  //         //
  //         //
  //         // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
  //         //
  //         //
  //         // Get.to(() => MyHomeScreen());
  //         //
  //         //
  //
  //
  //
  //
  //
  //       }
  //
  //
  //       else
  //
  //
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
  //           otpVerificationResponse.value.message.toString(),
  //           "",
  //           backgroundColor: AppColor.whitecolor,
  //
  //           colorText: Colors.black,
  //
  //
  //           forwardAnimationCurve: Curves.easeOutBack,
  //
  //           snackPosition: SnackPosition.BOTTOM,
  //
  //
  //
  //
  //
  //         );
  //
  //
  //
  //       }
  //
  //
  //
  //     }
  //
  //
  //
  //
  //     else
  //     {
  //
  //
  //
  //       isLoading(false);
  //
  //       update();
  //
  //       Get.snackbar(
  //         "something went wrong",
  //         "",
  //         backgroundColor: AppColor.whitecolor,
  //         forwardAnimationCurve: Curves.easeOutBack,
  //         snackPosition: SnackPosition.BOTTOM,
  //
  //
  //
  //       );
  //
  //
  //
  //
  //     }
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
  //
  //
  //
  // }
  //
  //
  //
  // void startTimer() {
  //
  //   // print("dededee");
  //
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //         (Timer timer) {
  //       if (start == 0) {
  //
  //
  //         print("pradeep");
  //
  //
  //         // setState(() {
  //
  //         timer.cancel();
  //         isLoading2 = false;
  //
  //         update();
  //
  //
  //
  //         //   });
  //
  //
  //
  //       } else {
  //         //   setState(() {
  //
  //         print("dededee");
  //
  //
  //         start--;
  //         update();
  //
  //
  //         // });
  //       }
  //     },
  //   );
  // }
  //
  //

  bool isInputValid(String phone) {
    return phone.isNotEmpty && (phone.length >= 10);
  }

  void showInputError(String phone) {
    if (phone.isEmpty) {
      showToastBar("Please fill phone no.");
    } else if (phone.length < 10) {
      showToastBar("Please enter a 10-digit phone number.");
    }
  }

  void showToastBar(String message) {
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
}
