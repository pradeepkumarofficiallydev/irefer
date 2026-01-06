
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../models/GetProfilesResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ResendOtpResponse.dart';
import '../models/UserLoginResponse.dart';

class AuthRepository

{

  final  _apinetwork=NetworkApiServices();



  Future<UserLoginResponse>User_Login_Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"register");
    return UserLoginResponse.fromJson(response);

  }


  Future<OtpVerificationResponse>OtpVerificationApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"verify-otp");
    return OtpVerificationResponse.fromJson(response);

  }






  Future<GetProfilesResponse>ShowUserProfiles(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"profile-detail");
    return GetProfilesResponse.fromJson(response);

  }






  Future<Resendotpresponse>Resend_Otp(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"register");
    return Resendotpresponse.fromJson(response);









  }







}


