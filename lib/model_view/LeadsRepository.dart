
import 'package:jsp/models/CreateLeadsResponse.dart';
import 'package:jsp/models/GetAllNewLeadsResponse.dart';

import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../models/GetFollowUpsLeadsResponse.dart';
import '../models/GetSingleLeadsResponse.dart';
import '../models/LeadsUpdateReseponse.dart';
import '../models/NewLeadsResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ProfessionsResponse.dart';
import '../models/UserLoginResponse.dart';
import '../models/UserRegisterResponse.dart';

class LeadsRepository

{

  final  _apinetwork=NetworkApiServices();



//   Future<UserRegisterResponse>User_Resgister_Api(Map<String, dynamic> map) async
//   {
//
//     dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"register");
//     return UserRegisterResponse.fromJson(response);
//
//   }
//   Future<ProfessionsResponse>getProfessionFun(Map<String, dynamic> map) async
//   {
//
//
//     dynamic response =await  _apinetwork.getApi(Strings.baseUrl+"allprofession");
//     return ProfessionsResponse.fromJson(response);
//
//
//
//   }
//
//
//
//   Future<UserLoginResponse>loginAPI(Map<String, dynamic> map) async
//   {
//
//     dynamic response = await _apinetwork.postApi(
//         map, "/send-otp");
//
//     return UserLoginResponse.fromJson(response);
//   }
//
//
//
// //
//   Future<OtpVerificationResponse>OtpVerificationApi(Map<String, dynamic> map) async
//   {
//
//     dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"verify-otp");
//     return OtpVerificationResponse.fromJson(response);
//
//   }




  Future<CreateLeadsResponse>createLeadsApi(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "addlead");

    return CreateLeadsResponse.fromJson(response);
  }





  Future<GetAllNewLeadsResponse>getNewLeadsApi(Map<String, dynamic> map ,String page) async
  {

    dynamic response = await _apinetwork.getApi(
         "fetch-all-leads?page=${page}");

    return GetAllNewLeadsResponse.fromJson(response);
  }






  Future<GetFollowUpsLeadsResponse>getFollowUpsLeadsApi(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.getApi(queryParams:map,
        "fetch-all-leads");

    return GetFollowUpsLeadsResponse.fromJson(response);
  }






  Future<NewLeadsResponse>getNewLeadApi(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.getApi(queryParams:map,
        "fetch-all-leads");

    return NewLeadsResponse.fromJson(response);
  }









  Future<GetSingleLeadsResponse>getSingleLeadsApi(String leadId ) async
  {

    dynamic response = await _apinetwork.getApi(
        "singleleads/${leadId}");



    return GetSingleLeadsResponse.fromJson(response);
  }





  Future<LeadUpdateResponse>followUpsApi(Map<String, dynamic> map,String leadId ) async
  {

    dynamic response = await _apinetwork.putApi( map,
        "update-lead/${leadId}");

    return LeadUpdateResponse.fromJson(response);
  }





}


