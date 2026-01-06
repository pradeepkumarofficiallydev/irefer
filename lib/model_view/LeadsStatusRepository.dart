
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../models/GetAllLeadsCountResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ProfessionsResponse.dart';
import '../models/UserLoginResponse.dart';
import '../models/UserRegisterResponse.dart';

class LeadsStatusRepository

{

  final  _apinetwork=NetworkApiServices();




  Future<ProfessionsResponse>getProfessionFun(Map<String, dynamic> map) async
  {


    dynamic response =await  _apinetwork.getApi(Strings.baseUrl+"allprofession");
    return ProfessionsResponse.fromJson(response);



  }



  Future<GetAllLeadsCountResponse>getAllLeadsCount(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "lead-summary");

    return GetAllLeadsCountResponse.fromJson(response);
  }







}


