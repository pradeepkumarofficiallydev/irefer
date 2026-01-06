
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import '../models/UserLoginResponse.dart';


import 'package:http/http.dart' as http;

import 'leads_status_controller.dart';

class  LeadsController extends GetxController
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

  final createLeadsResponse=CreateLeadsResponse().obs;


  final getAllNewLeadsResponse=GetAllNewLeadsResponse().obs;



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




  @override
  void onInit() {
    super.onInit();




   // getAllLeadsFun();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200 &&
          !isRaisedLoading.value &&
          hasMoreData) {
        getAllLeadsFun(  isPagination: true); // fetch next page
      }
    });





  }







  void createLeadFun(Map<String, dynamic> map)  async{

    isLoading(true);
    update();
    api.createLeadsApi(map) .then((value)
    async {

      rxRequestStatus.value=Status.COMPLETED;
      createLeadsResponse.value=value;

      isLoading(false);
      update();



      if(createLeadsResponse.value.success==true)
        {




          if (Get.isRegistered<LeadsStatusController>()) {
            final controller = Get.find<LeadsStatusController>();

            controller.getLeadsCountFun();

          } else {
            print("Controller not found!");
            var controller = Get.put(LeadsStatusController());
            controller.getLeadsCountFun();
          }




          showModalBottomSheet(
            context:Get. context!,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) {
              return Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Gradient Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.verified, size: 50, color: Colors.white),
                          const SizedBox(height: 8),
                          const Text(
                            "Lead Created Successfully!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Reference Number
                    Text(

                      "Reference No: ${createLeadsResponse.value.data?.lead?.sId??""}}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Thank You Message
                    const Text(
                      "Thank you for creating a lead with Refer!\n"
                          "Our team will start processing this ASAP.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),

                    const SizedBox(height: 24),

                    // Floating Exit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          elevation: 4,
                        ),
                        icon: const Icon(Icons.close),
                        label: const Text(
                          "Exit",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => Navigator.pop(Get.context!),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          );


        }










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






  void getAllLeadsFun(  {bool isPagination = false} ) async {
    if (!isPagination) {
      isRaisedLoading(true);
      page = 1;
      hasMoreData = true;
      getAllNewLeadsResponse.value.data = []; // clear old data
    }

    update();
    //
    var map = {


      "page": page.toString(),
      "limit": "10",
      "status":""


    };

    try {
      var value = await api.getNewLeadsApi( map, page.toString());
      rxRequestStatus.value = Status.COMPLETED;

      print("vfvfvfv ${value}");

      if (value.data == null || value.data!.isEmpty) {
        hasMoreData = false;
      } else {
        if (isPagination) {
          getAllNewLeadsResponse.value.data?.addAll(value.data!);
        } else {
          getAllNewLeadsResponse.value = value;
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











}
