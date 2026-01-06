import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsp/model_view/DashboardScreenRepository.dart';
import 'package:jsp/models/CarouselResponse.dart';
import 'package:jsp/models/NewsAndMediaResponse.dart';

import '../Utils/Preference.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../models/GetAllLeadsCountResponse.dart';
import '../models/GetEarningResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/StoriesResponse.dart';
import 'package:http/http.dart' as http;

class  Dashboardscreencontroller extends GetxController
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
  final RxList<String> imageUrls = <String>[].obs;


  var mobile_no;





  final carouselResponse=CarouselResponse().obs;


  final getEarningResponse=GetEarningResponse().obs;



  final getAllLeadsCountResponse=GetAllLeadsCountResponse().obs;



  final reelsResponse=ReelsResponse().obs;
  final getProfilesResponse=GetProfilesResponse().obs;


  final newsAndMediaResponse=NewsAndMediaResponse().obs;

  List<dynamic> decodedResponse=[].obs;


  void getProfiles() async{
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
  void onInit() {
    super.onInit();

    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);

    getCarouselData();
    getEarningData();

    getLeadsCountFun();





  }













  void getLeadsCountFun()  async{

    isLoading(true);
    update();



    var map={

      "no":""

    };


    api.getAllLeadsCount(map) .then((value)
    async {

      rxRequestStatus.value=Status.COMPLETED;
      getAllLeadsCountResponse.value=value;


      isLoading(false);
      update();



      print( 'my data ${getAllLeadsCountResponse.value.data}');




      if(getAllLeadsCountResponse.value.data!=null)
      {


        // if (getAllLeadsCountResponse.value.data != null) {
        //   leads.value = {
        //     "Follow Ups": getAllLeadsCountResponse.value.data?.followUps ?? 0,
        //     "Confirmation Pending":
        //     getAllLeadsCountResponse.value.data?.confirmationPending ?? 0,
        //     "New Leads": getAllLeadsCountResponse.value.data?.newLeads ?? 0,
        //     "Logged In": getAllLeadsCountResponse.value.data?.loggedIn ?? 0,
        //     "Sanctioned": getAllLeadsCountResponse.value.data?.sanctioned ?? 0,
        //     "Disbursed": getAllLeadsCountResponse.value.data?.disbursed ?? 0,
        //     "Lost": getAllLeadsCountResponse.value.data?.lost ?? 0,
        //   };
        // }











      }


      //  print("my final response ${user_login_response.value.data?.data.firstName }");


    }


    ).onError((error, stackTrace)
    {

      print(error);


      isLoading(false);
      update();



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

  void getCarouselData() async {
    isLoading2(true);
    update();

    api.getCarouselApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      carouselResponse.value = value;

      // Extracting only the imageUrl field and adding base URL
      imageUrls.value = carouselResponse.value.data
      !.map<String>((item) => "http://api.primelendinghub.in${item.imageUrl}")
          .toList();

      isLoading2(false);
      update();
    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();

      isLoading2(false);
      update();
    });
  }




  void getEarningData() async {
    isLoading2(true);
    update();

    api.getEarningApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      getEarningResponse.value = value;



      isLoading2(false);
      update();
    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();

      debugPrint('Error ${Error.value}');




      isLoading2(false);
      update();
    });
  }



}