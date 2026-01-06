
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
import '../model_view/LeadsRepository.dart';
import '../models/CreateLeadsResponse.dart';
import '../models/GetAllNewLeadsResponse.dart';
import '../models/GetFollowUpsLeadsResponse.dart';
import '../models/UserLoginResponse.dart';


import 'package:http/http.dart' as http;

class  FollowUpsController extends GetxController
{


  final formKey = GlobalKey<FormState>();




  int page = 1;
  bool hasMoreData = true;

  ScrollController scrollController = ScrollController();




  var isLoading1 = false.obs;


  var isRaisedLoading = false.obs;


  final SecureStorageService storageService = SecureStorageService();



  List<ProfessionsResponse> professionsList = [];
  var isLoading = false.obs;
  final api =LeadsRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;



  final getFollowUpsLeadsResponse=GetFollowUpsLeadsResponse().obs;



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





  @override
  void onInit() {
    super.onInit();




     getAllLeadsFun();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200 &&
          !isRaisedLoading.value &&
          hasMoreData) {
        getAllLeadsFun(  isPagination: true); // fetch next page
      }
    });





  }






  void getAllLeadsFun(  {bool isPagination = false} ) async {
    if (!isPagination) {
      isRaisedLoading(true);
      page = 1;
      hasMoreData = true;
      getFollowUpsLeadsResponse.value.data = []; // clear old data
    }




    update();
    //
    var map = {

      "page": page.toString(),
      "limit": "10",
      "status": "Follow Ups"

    //  "status": "Disbursed"


    };
    try {



      var value = await api.getFollowUpsLeadsApi( map);
      rxRequestStatus.value = Status.COMPLETED;

      print("vfvfvfv ${value}");

      if (value.data == null || value.data!.isEmpty) {
        hasMoreData = false;
      } else {
        if (isPagination) {
          getFollowUpsLeadsResponse.value.data?.addAll(value.data!);
        } else {
          getFollowUpsLeadsResponse.value = value;
        }
        page++;
      }

      isRaisedLoading(false);
      update();
    } catch (error) {
      isRaisedLoading(false);
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
      update();
    }
  }








  String formatNumber(num? number) {
    if (number == null) return "0"; // Handle null values

    if (number >= 1000000) {
      return "${(number / 1000000).toStringAsFixed(1)} M"; // Example: 1997795 → "1.9M"
    } else if (number >= 1000) {
      return "${(number / 1000).toStringAsFixed(1)} K"; // Example: 1999 → "2.0K"
    } else {
      return number.toString(); // For values less than 1000
    }
  }



  String formatIsoToDMMMYYYY(String isoString, {bool lowerMonth = false, String locale = 'en_US'}) {
    // Parse and convert to local time (important if the string ends with 'Z')
    final dt = DateTime.parse(isoString).toLocal();

    if (!lowerMonth) {
      // e.g., "20 Jul 2025"
      return DateFormat('d MMM yyyy', locale).format(dt);
    }

    // e.g., "20 jul 2025"
    final d = DateFormat('d', locale).format(dt);
    final m = DateFormat('MMM', locale).format(dt).toLowerCase();
    final y = DateFormat('yyyy', locale).format(dt);
    return '$d $m $y';
  }





// // Example usage:
//   void main() {
//     final iso = '2025-07-20T00:00:00.000Z';
//     print(formatIsoToDMMMYYYY(iso));                 // -> 20 Jul 2025
//     print(formatIsoToDMMMYYYY(iso, lowerMonth: true)); // -> 20 jul 2025
//   }






}
