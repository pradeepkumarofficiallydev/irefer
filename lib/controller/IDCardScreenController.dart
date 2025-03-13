




import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsp/screens/OTPVerificationScree.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/GetProfilesResponse.dart';
import '../models/UserLoginResponse.dart';

class  IDCardScreenController extends GetxController
{


  var isLoading = false.obs;
  final api =AuthRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final getProfilesResponse=GetProfilesResponse().obs;

  TextEditingController mobileno_controller = TextEditingController();

  var mobile_no;


  @override
  void onInit() {
    super.onInit();


    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);


    User_Login_fun();


  }




  void User_Login_fun() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no.toString();
    api.ShowUserProfiles(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      getProfilesResponse.value=value;
      isLoading(false);
      update();


      print( "myfinalResponse:"+getProfilesResponse.value.message.toString());


      //
      // if(getProfilesResponse!=null  ) {
      //
      //
      //   // Get.to(() => OTPVerificationScreen());
      //
      //
      //   if(user_login_response.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //
      //     print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //
      //
      //     Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
      //
      //
      //     //
      //     //
      //     // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
      //     //
      //     //
      //     // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
      //     //
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
      //       "Send otp your registered mobile number",
      //
      //       "",
      //       backgroundColor: AppColor.whitecolor,
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
      //     Get.to(() => OTPVerificationScreen());
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
      //   else
      //   if(user_login_response.value.status==false) {
      //
      //     isLoading(false);
      //     update();
      //     Get.snackbar(
      //       user_login_response.value.message.toString(),
      //       "",
      //       backgroundColor: AppColor.activebtncolor,
      //
      //
      //       forwardAnimationCurve: Curves.easeOutBack,
      //
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //     );
      //
      //
      //   }
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
      //     backgroundColor: AppColor.activebtncolor,
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











    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading(false);
      update();

    });


  }











  bool isInputValid( String phone ) {
    return  phone.isNotEmpty && (phone.length>=10) ;
  }

  void showInputError( String phone  ) {
    if (phone.isEmpty) {
      showToastBar("Please fill phone no.");
    }

    else   if (phone.length<10) {
      showToastBar("Please enter a 10-digit phone number.");
    }


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




}
