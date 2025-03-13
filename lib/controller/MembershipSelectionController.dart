
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/model_view/MemberShipRespositry.dart';
import 'package:jsp/screens/OTPVerificationScree.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';
import '../models/UpdateProfilesResponse.dart';
import '../models/UserLoginResponse.dart';
import '../screens/DashboardScreen.dart';
import '../screens/IDCardScreen.dart';

class  Membershipselectioncontroller extends GetxController
{
  String data="";


  var isLoading = false.obs;
  final api =Membershiprespositry();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final stateResponse=StateResponse().obs;

  final districtResponse= DistrictResponse().obs;

  final updateProfilesResponse= UpdateProfilesResponse().obs;




  TextEditingController mobileno_controller = TextEditingController();


  var name ="";
  var mobile ="";


  var date = "";
  var state = "";

  var nirvachan = "";

  String? panchayt;

  var village = "";
  var pincode = "";
  var address = "";

  var District = "";

  var mobile_no;

  var selectedGender = "";





  @override
  void onInit() {
    super.onInit();

  //  settings: RouteSettings(arguments: {"name": s.name_controller.text, "mobile": s.mobileno_controller.text,"date":s.selectedDate,"state":selectedState,"District":selectedDistrict,"nirvachan":s.nirvachan_controller.text,"panchayt":s.panchayt_controller.text,"village":s.village_controller.text,"pincode":s.pincode_controller.text,"address":s.address_controller.text}),

    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);


    if(Get.arguments?["name"]!=null) {
      name = Get.arguments["name"].toString();
      print("dewdewded"+name);

    }


    if(Get.arguments?["mobile"]!=null) {
      mobile = Get.arguments["mobile"].toString();
      print("dewdewded"+mobile);

    }

    if(Get.arguments?["date"]!=null) {
      date = Get.arguments["date"].toString();
      print("dewdewded"+date);

    }

    if(Get.arguments?["state"]!=null) {
      state = Get.arguments["state"].toString();
      print("dewdewded"+state);

    }




    if(Get.arguments?["nirvachan"]!=null) {
      nirvachan = Get.arguments["nirvachan"].toString();
      print("dewdewded"+nirvachan);

    }

    if(Get.arguments?["panchayt"]!=null) {



      panchayt = Get.arguments["panchayt"].toString();

      print("panchyt"+panchayt!);

      print("dewdewded"+panchayt!);

    }








    if(Get.arguments?["village"]!=null) {
      village = Get.arguments["village"].toString();
      print("dewdewded"+village);

    }

    if(Get.arguments?["pincode"]!=null) {
      pincode = Get.arguments["pincode"].toString();
      print("dewdewded"+pincode);

    }




    if(Get.arguments?["address"]!=null) {
      address = Get.arguments["address"].toString();
      print("dewdewded"+address);

    }





    if(Get.arguments?["District"]!=null) {
      District = Get.arguments["District"].toString();
      print("dewdewded"+District);

    }




    if(Get.arguments?["selectedGender"]!=null) {
    var  selectedGender = Get.arguments["selectedGender"].toString();

      if (int.tryParse(selectedGender) == 1) {
        this.selectedGender="पुरुष";





      } else if (int.tryParse(selectedGender) == 2) {
        this.selectedGender="महिला";


      } else if (int.tryParse(selectedGender) == 3) {
        this.selectedGender="अन्य";

      }




    }






    // if(Get.arguments?["id"]!=null) {
    //   id = Get.arguments["id"].toString();
    //   print("dewdewded"+id);
    //
    // }
    //
    // final arguments = ModalRoute.of(Get.context!)!.settings.arguments as Map;
    //  name = arguments["name"];
    //  mobile = arguments["mobile"];
    //
    //
    //  date = arguments["date"];
    //  state = arguments["state"];

    // nirvachan = arguments["nirvachan"];

     //panchayt = arguments["panchayt"];

    // village = arguments["village"];
    // pincode = arguments["pincode"];
     //address = arguments["address"];

 //   District = arguments["District"];







  }



  void send_user_data_fun(String argument) async{
    isLoading(true);
    update();




    if(panchayt==""||panchayt==null||village==""||village==null)
      {

        panchayt="null";

        village="null";

      }






    if(data==""||data==null)
    {
      data="null";

    }



    print("gender ${selectedGender}");











    var map = new Map<String, dynamic>();
    map['name'] =name;

    map['phone'] =mobile_no;

    map['state_id'] =state;

    map['city_id'] = District;




    map['constituency'] =data;
    map['panchayat'] =panchayt;

    map['graam'] = village;
    map['pincode'] = pincode;


    map['address'] = address;
    map['address_type'] = "1";
    map['dob'] = date;
    map['gender'] = selectedGender;








    api.send_profiles_data_Api(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      updateProfilesResponse.value=value;


      update();


      if(updateProfilesResponse.value.status==200) {



        isLoading(false);

        update();

        print(updateProfilesResponse.value.message);


        if(argument=="home")
          {
            Get.offAll( DashboardScreen());


          }else
            {

              Get.to(IDCardScreen());



            }




      }

      else
      {



        isLoading(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.activebtncolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,




        );




      }











    }


    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }







  void state_fun() async{
    isLoading(true);
    update();



    var map = new Map<String, dynamic>();
    map['phone'] = mobileno_controller.text.toString();
    api.StateApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      stateResponse.value=value;


      update();


      if(stateResponse.value.status==200) {







      }

      else
      {



        isLoading(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.activebtncolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,




        );




      }











    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }







  void district_fun (int? id) async{
    isLoading(true);
    update();

    print('Failed to load states');



    var map = new Map<String, dynamic>();
    map['state_id'] = id.toString();
    api.district_Api(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      districtResponse.value=value;


      update();


      if(districtResponse.value.status==200) {







      }

      else
      {



        isLoading(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.activebtncolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,




        );




      }











    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }





}
