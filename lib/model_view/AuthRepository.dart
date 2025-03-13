
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../models/ProfessionsResponse.dart';
import '../models/UserLoginResponse.dart';
import '../models/UserRegisterResponse.dart';

class AuthRepository

{

  final  _apinetwork=NetworkApiServices();



  Future<UserRegisterResponse>User_Resgister_Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"register");
    return UserRegisterResponse.fromJson(response);

  }



  Future<ProfessionsResponse>getProfessionFun(Map<String, dynamic> map) async
  {


    dynamic response =await  _apinetwork.getApi(Strings.baseUrl+"allprofession");
    return ProfessionsResponse.fromJson(response);



  }





  Future<UserLoginResponse>loginAPI(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "/send-otp");

    return UserLoginResponse.fromJson(response);
  }







//
  // Future<OtpVerificationResponse>OtpVerificationApi(Map<String, dynamic> map) async
  // {
  //
  //   dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"verify-otp");
  //   return OtpVerificationResponse.fromJson(response);
  //
  // }
  //
  //
  //
  //
  //
  //
  // Future<GetProfilesResponse>ShowUserProfiles(Map<String, dynamic> map) async
  // {
  //
  //   dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"profile-detail");
  //   return GetProfilesResponse.fromJson(response);
  //
  // }
  //





  // Future<Resendotpresponse>Resend_Otp(Map<String, dynamic> map) async
  // {
  //
  //   dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"register");
  //   return Resendotpresponse.fromJson(response);
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // }
  //
  //





}


