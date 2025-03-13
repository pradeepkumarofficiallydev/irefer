
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jsp/model_view/DashboardScreenRepository.dart';
import 'package:jsp/model_view/LoginRespository.dart';
import 'package:jsp/screens/DashboardScreen.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../models/DistrictResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/StateResponse.dart';
import '../models/StoriesResponse.dart';
import '../models/UpdateProfilesResponse.dart';
import '../screens/MembershipForm.dart';

class  Userprofilecontroller extends GetxController
{
  DateTime? selectedDate ;

  int selectedGender = 1; // 0 for no selection, 1 for "पुरुष", 2 for "महिला", 3 for "अन्य"

  var user_id;



  // DateTime selectedDate = DateTime.now();

  String selectedDate1 = "जन्म तिथि"; // Default text

  var selectedState=Dataaa().obs;
  Rx<Dataa?> selectedDistrict = Rx<Dataa?>(null); // District is reactive and nullable

  //Dataaa

  var isLoading = true.obs;
  var isLoading2 = false.obs;
  var isLoading3 = false.obs;

  final stateResponse=StateResponse().obs;

  final districtResponse= DistrictResponse().obs;

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
  final getProfilesResponse=GetProfilesResponse().obs;



  TextEditingController name_controller = TextEditingController();



  TextEditingController mobileno_controller = TextEditingController();
  TextEditingController nirvachan_controller = TextEditingController();
  TextEditingController panchayt_controller = TextEditingController();
  TextEditingController village_controller = TextEditingController();
  TextEditingController pincode_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();


  final updateProfilesResponse= UpdateProfilesResponse().obs;

  void getProfiles() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no.toString();
    api.ShowUserProfiles(map).then((value)
    async {


      rxRequestStatus.value=Status.COMPLETED;
      getProfilesResponse.value=value;
       isLoading(false);
       update();


      print( "myfinalResponse:"+getProfilesResponse.value.message.toString());


      name_controller = TextEditingController(text: getProfilesResponse.value.data?.name.toString()??"");
      mobileno_controller = TextEditingController(text: getProfilesResponse.value.data?.phone.toString()??"");

      nirvachan_controller    = TextEditingController(text: getProfilesResponse.value.data?.constituency.toString()??"");


      panchayt_controller = TextEditingController(text: getProfilesResponse.value.data?.panchayat.toString()??"");

      name_controller = TextEditingController(text: getProfilesResponse.value.data?.name.toString()??"");

      village_controller = TextEditingController(text: getProfilesResponse.value.data?.graam.toString()??"");
      pincode_controller = TextEditingController(text: getProfilesResponse.value.data?.pincode.toString()??"");


      address_controller = TextEditingController(text: getProfilesResponse.value.data?.address.toString()??"");







      selectedDate =DateFormat('dd-MM-yyyy').parse(getProfilesResponse.value.data?.dob.toString()??"");


      day = DateFormat('dd').format(selectedDate!);
      month   = DateFormat('MM').format(selectedDate!);
      year    = DateFormat('yyyy').format(selectedDate!);





      // selectedState = getProfilesResponse.value.data?.address.toString()??""; // Set selected state


print("ldll d ld dd ");

     // await state_fun();

        selectedState .value= stateResponse.value.data!.firstWhere(
              (state) => state.name == getProfilesResponse.value.data?.state,
          orElse: () => Dataaa(id: null, name: "Select State",countryId: null)); // Provide a default Dataaa object





      if (getProfilesResponse.value.data?.gender == "पुरुष") {

        selectedGender=1;

      } else if (getProfilesResponse.value.data?.gender == "महिला") {
        selectedGender=2;

      } else if (getProfilesResponse.value.data?.gender == "अन्य") {
        selectedGender=3;



      }


//      print("okkkkkkkkkkkkkkkk ");


    ////  print("dsdsds${ stateResponse.value.data?.contains(selectedState.value) == true}");



      update();

     await district_fun(getProfilesResponse.value.data?.state_id??1);





      Preference.shared.setString(Preference.USER_ID,getProfilesResponse.value.data?.id.toString()??"");

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




  String day="";
  String month="";
  String year="";






  @override
  Future<void> onInit() async {
    super.onInit();



    // selectedDate =DateFormat('dd-MM-yyyy').parse(dob);
    //
    // day = DateFormat('dd').format(selectedDate);
    // month   = DateFormat('MM').format(selectedDate);
    // year    = DateFormat('yyyy').format(selectedDate);
    //
    user_id =Preference.shared.getString(Preference.USER_ID);

    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);

    await  state_fun();
    getStories();













  }








  void send_user_data_fun() async{
    isLoading3(true);
    update();



    //
    // if(panchayt==""||panchayt==null||village==""||village==null)
    // {
    //
    //   panchayt="null";
    //
    //   village="null";
    //
    // }
    //
    //
    //
    //
    //
    //
    // if(data==""||data==null)
    // {
    //   data="null";
    //
    // }
    //
    //

    var genderName="";


    if (selectedGender == 1) {
      genderName="पुरुष";





    } else if (selectedGender == 2) {
      genderName="महिला";


    } else if (selectedGender == 3) {
      genderName="अन्य";

    }




//
//
// print("${selectedState.value.id}");
//     print("${selectedDistrict.value?.id}");





    var map = new Map<String, dynamic>();
    map['name'] =name_controller.text;

    map['phone'] =mobile_no;

     map['state_id'] =selectedState.value.id.toString();
     map['city_id'] = selectedDistrict.value?.id.toString();

    map['constituency'] =nirvachan_controller.text;
     map['panchayat'] = "null";



    map['graam'] = village_controller.text;
    map['pincode'] = pincode_controller.text;
    map['gender'] = genderName;



    map['address'] = address_controller.text;
    map['address_type'] = "1";
    map['dob'] = '${day}-${month}-${year}';


    print("${selectedDistrict.value?.id}");


    api.send_profiles_data_Api(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      updateProfilesResponse.value=value;


      update();


      if(updateProfilesResponse.value.status==200) {




        isLoading3(false);

        update();

        Get.off(DashboardScreen());


        //
        // if(argument=="home")
        // {
        //   Get.offAll( DashboardScreen());
        //
        //
        // }else
        // {
        //
        //   Get.to(IDCardScreen());
        //
        //
        //
        // }
        //



      }

      else
      {



        isLoading3(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.activebtncolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,




        );




      }











    }


    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();



      isLoading3(false);

      update();


    });


  }





  Future state_fun() async{
   // isLoading(true);
    update();

      print('  states');


    var map = new Map<String, dynamic>();
    map['phone'] = mobileno_controller.text.toString();
    api.StateApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      stateResponse.value=value;


      update();


      if(stateResponse.value.status==200) {

        print('  cdcdcdcdcdd');


        print(stateResponse.value.message);
        getProfiles();






      }

      else
      {



        isLoading(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.appColor,
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







  Future district_fun (int? id) async{
  ///  isLoading(true);
    update();

  //  print('Failed to load states');



    var map = new Map<String, dynamic>();
    map['state_id'] = id.toString();
    api.district_Api(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      districtResponse.value=value;


      update();


      if(districtResponse.value.status==200) {




                selectedDistrict.value = districtResponse.value.data!.firstWhere(
                (state) => state.city == getProfilesResponse.value.data?.city,
            orElse: () => Dataa(id: null, city: "Select city",stateId: null)); // Provide a default Dataaa object

        update();


      }

      else
      {



        isLoading(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.appColor,
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
    map['user_id'] = user_id;



    api.StoriesApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      storiesResponse.value=value;


      print( "myfinalResponse:"+storiesResponse.value.message.toString());


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


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      //  locale: const Locale('hi', 'IN'), // Set to Hindi locale if needed
    );
    if (picked != null) {
      selectedDate1 = "${picked.day}-${picked.month}-${picked.year}"; // Format date
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