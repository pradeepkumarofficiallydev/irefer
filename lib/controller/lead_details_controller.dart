import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/model_view/DashboardScreenRepository.dart';
import 'package:jsp/model_view/LeadsRepository.dart';
import 'package:jsp/models/CarouselResponse.dart';
import 'package:jsp/models/GetSingleLeadsResponse.dart';
import 'package:jsp/models/NewsAndMediaResponse.dart';

import '../Utils/Preference.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../models/GetAllLeadsCountResponse.dart';
import '../models/GetEarningResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/LeadsUpdateReseponse.dart';
import '../models/NewLeadsResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/StoriesResponse.dart';
import 'package:http/http.dart' as http;

import 'leads_status_controller.dart';

class  LeadDetailsController extends GetxController
{




  var bankNameController ;



  var isLoading = false.obs;



  final api =LeadsRepository();

  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final RxList<String> imageUrls = <String>[].obs;

  var mobile_no;

  final newLeadsResponse=NewLeadsResponse().obs;

  final getSingleLeadsResponse=GetSingleLeadsResponse().obs;

  final leadUpdateResponse=LeadUpdateResponse().obs;












  var selectedOption = 0.obs; // 0 = Call, 1 = Doc Pickup
  var selectedDate = Rxn<DateTime>();
  var selectedTime = Rxn<TimeOfDay>();
  var commentController = TextEditingController();

  void pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) selectedDate.value = picked;
  }

  void pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) selectedTime.value = picked;
  }

  /// Combine date & time into a single DateTime
  DateTime? get scheduledDateTime {
    if (selectedDate.value == null || selectedTime.value == null) return null;
    return DateTime(
      selectedDate.value!.year,
      selectedDate.value!.month,
      selectedDate.value!.day,
      selectedTime.value!.hour,
      selectedTime.value!.minute,
    );
  }







  @override
  void onInit() {
    super.onInit();

    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);


  //  getLeadsDetails();







  }


















  String maskPhoneNumber(String phone) {
    // Take the first 4 digits and add '******' for the rest
    if (phone.length == 10) {
      return phone.substring(0, 4) + "******";
    }
    return phone; // Return as is if the phone number is not valid (not 10 digits)
  }






  void followUp(String leadId) async{
    isLoading(true);
    update();


  //
  //   {
  //     "status": "Follow Ups",
  //   "follow_up_date": "2025-07-20",
  //   "comments": "Customer asked to call next week"
  // }






    var map = new Map<String, dynamic>();


    map['status'] = "Follow Ups";
    map['follow_up_date'] = scheduledDateTime.toString();
    map['comments'] =commentController.text;
    map['follow_type'] = selectedOption.value == 0
        ? "Call" : "Doc Pickup";




    api.followUpsApi(map ,leadId ).then((value)
    async {


      rxRequestStatus.value=Status.COMPLETED;
      leadUpdateResponse.value=value;
      isLoading(false);
      update();


 if(leadUpdateResponse.value.success==true)
   {

     if (Get.isRegistered<LeadsStatusController>()) {
       final controller = Get.find<LeadsStatusController>();

       controller.getLeadsCountFun();

     } else {
       print("Controller not found!");
       var controller = Get.put(LeadsStatusController());
       controller.getLeadsCountFun();
     }


   }






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



  void getLeadsDetails(String leadsId) async {
    isLoading(true);
    update();

    api.getSingleLeadsApi(leadsId).then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      getSingleLeadsResponse.value = value;




      print("bank name${getSingleLeadsResponse.value.data?.login?.bankName??""}");


      bankNameController=TextEditingController(text: getSingleLeadsResponse.value.data?.login?.bankName??"");




      isLoading(false);
      update();
    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();

      isLoading(false);
      update();
    });
  }










}