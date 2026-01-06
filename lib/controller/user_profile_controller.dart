
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jsp/model_view/DashboardScreenRepository.dart';
import 'package:jsp/model_view/LoginRespository.dart';
import 'package:jsp/screens/dashboard_screen.dart';

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

class  UserProfileController extends GetxController
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








  @override
  Future<void> onInit() async {
    super.onInit();



    // selectedDate =DateFormat('dd-MM-yyyy').parse(dob);
    //
    // day = DateFormat('dd').format(selectedDate);
    // month   = DateFormat('MM').format(selectedDate);
    // year    = DateFormat('yyyy').format(selectedDate);
    //

    getProfiles();

    user_id =Preference.shared.getString(Preference.USER_ID);

    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);














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



