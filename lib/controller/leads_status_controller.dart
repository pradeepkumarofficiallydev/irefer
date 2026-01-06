
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/models/GetAllLeadsCountResponse.dart';
import 'package:jsp/models/OtpVerificationResponse.dart';
import 'package:jsp/models/ProfessionsResponse.dart';
import 'package:jsp/models/UserRegisterResponse.dart';
import 'package:jsp/screens/dashboard_screen.dart';
import 'package:jsp/screens/otp_verification_screen.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/SecureStorageService.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/AuthRepository.dart';
import '../model_view/LeadsStatusRepository.dart';
import '../models/UserLoginResponse.dart';


import 'package:http/http.dart' as http;

class  LeadsStatusController extends GetxController
{


  final formKey = GlobalKey<FormState>();






  final SecureStorageService storageService = SecureStorageService();



  List<ProfessionsResponse> professionsList = [];
  var isLoading = false.obs;
  final api =LeadsStatusRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final getAllLeadsCountResponse=GetAllLeadsCountResponse().obs;


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final RxString selectedLoanType = 'Home Loan'.obs;
  final RxBool referToAmbak = false.obs;
  final RxList<String> selectedOptions = <String>[].obs;
  final RxString selectedState = ''.obs;


  final List<String> loanOptions = ['Balance Transfer', 'Top-Up', 'OD'];

  final List<String> indianStates = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka',
    'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya',
    'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim',
    'Tamil Nadu', 'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand',
    'West Bengal', 'Andaman and Nicobar Islands', 'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu', 'Delhi', 'Jammu and Kashmir',
    'Ladakh', 'Lakshadweep', 'Puducherry',
  ];




  var leads = <String, int>{}.obs;

  final RxString error = ''.obs;



  @override
  void onInit() {
    super.onInit();

    getLeadsCountFun();

  }






  //
  // List<Map<String, dynamic>> get leadStatuses {
  //   final data = getAllLeadsCountResponse.value.data;
  //
  //   return [
  //     {
  //       "title": "Follow Ups",
  //       "icon": Icons.refresh,
  //       "count": data?.followUps ?? 0,
  //       "color": Colors.orange,
  //     },
  //     {
  //       "title": "Confirmation Pending",
  //       "icon": Icons.pending,
  //       "count": data?.confirmationPending ?? 0,
  //       "color": Colors.blue,
  //     },



  //     {
  //       "title": "New Leads",
  //       "icon": Icons.new_releases,
  //       "count": data?.newLeads ?? 0,
  //       "color": Colors.green,
  //     },
  //     {
  //       "title": "Logged In",
  //       "icon": Icons.login,
  //       "count": data?.loggedIn ?? 0,
  //       "color": Colors.purple,
  //     },
  //     {
  //       "title": "Sanctioned",
  //       "icon": Icons.verified,
  //       "count": data?.sanctioned ?? 0,
  //       "color": Colors.teal,
  //     },
  //     {
  //       "title": "Disbursed",
  //       "icon": Icons.payments,
  //       "count": data?.disbursed ?? 0,
  //       "color": Colors.brown,
  //     },
  //     {
  //       "title": "Lost",
  //       "icon": Icons.close,
  //       "count": data?.lost ?? 0,
  //       "color": Colors.red,
  //     },
  //   ];
  // }
  //







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


        if (getAllLeadsCountResponse.value.data != null) {
          leads.value = {
            "Follow Ups": getAllLeadsCountResponse.value.data?.followUps ?? 0,
            "Confirmation Pending":
            getAllLeadsCountResponse.value.data?.confirmationPending ?? 0,
            "New Leads": getAllLeadsCountResponse.value.data?.newLeads ?? 0,
            "Logged In": getAllLeadsCountResponse.value.data?.loggedIn ?? 0,
            "Sanctioned": getAllLeadsCountResponse.value.data?.sanctioned ?? 0,
            "Disbursed": getAllLeadsCountResponse.value.data?.disbursed ?? 0,
            "Lost": getAllLeadsCountResponse.value.data?.lost ?? 0,
          };
        }











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















}
