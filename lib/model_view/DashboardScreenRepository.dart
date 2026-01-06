
import 'package:jsp/models/StoriesResponse.dart';

import '../Utils/Strings.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../models/CarouselResponse.dart';
import '../models/DistrictResponse.dart';
import '../models/GetAllLeadsCountResponse.dart';
import '../models/GetEarningResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/NewsAndMediaResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/StateResponse.dart';
import '../models/UpdateProfilesResponse.dart';
import '../models/UserLoginResponse.dart';

class Dashboardscreenrepository

{

  final  _apinetwork=NetworkApiServices();













  Future<GetProfilesResponse>ShowUserProfiles(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi(   "userdetails");
    return GetProfilesResponse.fromJson(response);

  }








  Future<StateResponse>ContactusApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"contactus/store");
    return StateResponse.fromJson(response);

  }










  Future<CarouselResponse>getCarouselApi() async
  {


    dynamic response =await  _apinetwork.getApi(Strings.baseUrl+"getCarousels");
    return CarouselResponse.fromJson(response);

  }



  Future<GetEarningResponse>getEarningApi() async
  {


    dynamic response =await  _apinetwork.getApi(Strings.baseUrl+"commissionSummary");
    return GetEarningResponse.fromJson(response);

  }








  Future<GetAllLeadsCountResponse>getAllLeadsCount(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "lead-summary");

    return GetAllLeadsCountResponse.fromJson(response);
  }










}


