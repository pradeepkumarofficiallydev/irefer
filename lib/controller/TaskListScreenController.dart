
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
import '../models/StateResponse.dart';
import '../models/StoriesResponse.dart';
import '../models/UpdateProfilesResponse.dart';
import '../screens/MembershipForm.dart';

class  AgendaScreenController extends GetxController
{



  var isLoading = true.obs;

  final stateResponse=StateResponse().obs;

  final districtResponse= DistrictResponse().obs;

  final api =AgendaRepository();

  final  networkApiServices=  NetworkApiServices();

  // final  _registerResponse =
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;

  var mobile_no;


  final getTaskListRespnse= GetTaskListRespnse().obs;

  void getAgendaList() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no.toString();
    api.getTaskListApi(map).then((value)
    async {


      rxRequestStatus.value=Status.COMPLETED;
      getTaskListRespnse.value=value;
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


  @override
  Future<void> onInit() async {
    super.onInit();

    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);


   getAgendaList();







  }

}

