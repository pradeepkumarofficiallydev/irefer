import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/models/NewLeadsResponse.dart';
import '../Utils/SecureStorageService.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LeadsRepository.dart';



class  MyEarningController extends GetxController
{


  final formKey = GlobalKey<FormState>();


  // RxDouble totalApproved=0.0.obs;
  // RxDouble totalApproved=0.0.obs;



  int page = 1;
  bool hasMoreData = true;

  ScrollController scrollController = ScrollController();




  var isLoading1 = false.obs;


  var isRaisedLoading = false.obs;


  final SecureStorageService storageService = SecureStorageService();



  var isLoading = false.obs;
  final api =LeadsRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;



  final newLeadsResponse=NewLeadsResponse().obs;

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
      newLeadsResponse.value.data = []; // clear old data
    }





    update();
    //
    var map = {

      "page": page.toString(),
      "limit": "10",
     // "status": "New Leads"

    };
    try {



      var value = await api.getNewLeadApi( map);
      rxRequestStatus.value = Status.COMPLETED;

      print("vfvfvfv ${value}");

      if (value.data == null || value.data!.isEmpty) {
        hasMoreData = false;
      } else {

       // print("commissionStatus ${newLeadsResponse.value.data!.first.commissionStatus}");







        if (isPagination) {
          newLeadsResponse.value.data?.addAll(value.data!);
        } else {
          newLeadsResponse.value = value;
        }
        page++;
      }






      isRaisedLoading(false);
      update();
    } catch (error) {
      isRaisedLoading(false);
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
      print("error ${Error.value}");

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







}
