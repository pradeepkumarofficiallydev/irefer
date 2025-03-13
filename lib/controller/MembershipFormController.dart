
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsp/model_view/MemberShipRespositry.dart';
import 'package:jsp/screens/OTPVerificationScree.dart';

import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';
import '../models/UserLoginResponse.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class  Membershipformcontroller extends GetxController
{

  int selectedGender = 1; // 0 for no selection, 1 for "पुरुष", 2 for "महिला", 3 for "अन्य"

  String selectedDate = "जन्म तिथि"; // Default text

  var isLoading = false.obs;
  final api =Membershiprespositry();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final stateResponse=StateResponse().obs;

  final districtResponse= DistrictResponse().obs;

  TextEditingController name_controller = TextEditingController();



  TextEditingController mobileno_controller = TextEditingController();
  TextEditingController nirvachan_controller = TextEditingController();
  TextEditingController panchayt_controller = TextEditingController();
  TextEditingController village_controller = TextEditingController();
  TextEditingController pincode_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();




  var mobile_no;
  File? imageFile;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);

    state_fun();
    

  }

  void showImagePicker(BuildContext context, double height) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Container(

              color: Colors.white,


              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.2,



              margin:  EdgeInsets.only(top: height*1,bottom:  height*1),
              padding:  EdgeInsets.all(height*.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                        child: Column(
                          children:  [
                            Icon(
                              Icons.image,
                              size: 60.0,
                            ),
                            SizedBox(height:  height*.1),
                            Text(
                              "Gallery",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: height*.4, color: Colors.black),
                            )
                            ,
                            //    SizedBox(height:  height*.4),



                          ],
                        ),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.pop(context);
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: SizedBox(
                          child: Column(
                            children:  [
                              Icon(
                                Icons.camera_alt,
                                size: 60.0,
                              ),
                              SizedBox(height: height*.1),


                              Text(
                                "Camera",
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(fontSize: height*.4, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          _imgFromCamera();
                          Navigator.pop(context);
                        },
                      ))
                ],
              ));
        });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));
          imageFile = File(value.path);

          update();



      }
    });
  }


  void showToastBar(String message){


    //
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.black,
    //   textColor: Colors.white,
    //   fontSize: 13.0,
    // );
    //









    Get.snackbar(
      // user_login_response.value.message.toString(),
      message,

      "",
      backgroundColor: AppColor.appColor,


      forwardAnimationCurve: Curves.easeOutBack,
      snackPosition: SnackPosition.BOTTOM,



    );



  }


  bool isInputValid( String name,String phone,  String selectedDate, Dataaa? selectedState, Dataa? selectedDistrict, String nirvachan_controller, String panchayt_controller, String village_controller, String pincode_controller, String address_controller, bool isVillage, File? imageFile) {


    print("ddcdcdcdc       {$isVillage}");



    return  name.isNotEmpty && (phone.length>=10) && (selectedDate!="जन्म तिथि")&& (selectedState?.name?.isNotEmpty??false) && (selectedDistrict?.city?.isNotEmpty??false) &&nirvachan_controller.isNotEmpty  && ( isVillage ? (panchayt_controller.isNotEmpty): true)  && ( isVillage ? (village_controller.isNotEmpty) :true)  &&pincode_controller.isNotEmpty&& address_controller.isNotEmpty && imageFile!=null;
  }


  void showInputError( String name,String phone,  String selectedDate, Dataaa? selectedState, Dataa? selectedDistrict, String nirvachan_controller, String panchayt_controller, String village_controller, String pincode_controller, String address_controller,bool isVillage, File? imageFile) {



    if (name.isEmpty) {
      showToastBar("Please fill Name");
    }

    else   if (phone.length<10) {
      showToastBar("Please enter a 10-digit phone number.");
    }




    else   if (selectedDate=="जन्म तिथि") {
      showToastBar("Please select जन्म तिथि ");
    }


    else   if (selectedState?.name?.isEmpty??true) {
      showToastBar("Please select State");
    }



    else   if (selectedDistrict?.city?.isEmpty??true) {
      showToastBar("Please select District");
    }


    else  if ( isVillage? panchayt_controller.isEmpty:false) {
      showToastBar("Please fill पंचायत Name");
    }

    else  if (nirvachan_controller.isEmpty) {
      showToastBar("Please fill िर्वाचन क्षेत्र Name");
    }





    else if (isVillage?  village_controller.isEmpty: false) {
      showToastBar("Please fill ग्राम Name");
    }



    else  if (pincode_controller.isEmpty) {
      showToastBar("Please fill िन कोड number");
    }





    else if (address_controller.isEmpty) {
      showToastBar("Please fill पता");
    }


    else if (imageFile==null) {
      showToastBar("Please select an image first!");
    }




  }




  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));

          imageFile = File(value.path);
        update();

      }
    });
  }







  Future<void> uploadImage() async {
    // if (imageFile == null) {
    //   ScaffoldMessenger.of(Get.context!!).showSnackBar(
    //     SnackBar(content: Text("Please select an image first!")),
    //   );
    //   return;
    // }




    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Strings.baseUrl}profile-picture-update'),

        // Replace with your server URL
      );




      request.fields['phone'] =  mobile_no;; // Add 'name' field




      request.files.add(await http.MultipartFile.fromPath(
        'profile_picture', // Field name expected by the server
        imageFile!.path,
      ));



      var response = await request.send();




    //   if (response.statusCode == 200) {
    //     ScaffoldMessenger.of(Get.context!!).showSnackBar(
    //       SnackBar(content: Text("Upload successful!")),
    //     );
    //   } else {
    //     ScaffoldMessenger.of(Get.context!!).showSnackBar(
    //       SnackBar(content: Text("Upload failed!")),
    //     );
    //   }




    } catch (e) {
      print(e);
      ScaffoldMessenger.of(Get.context!!).showSnackBar(
        SnackBar(content: Text("An error occurred!")),
      );
    }
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
          backgroundColor: AppColor.appColor,
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
          backgroundColor: AppColor.appColor,
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








  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    //  locale: const Locale('hi', 'IN'), // Set to Hindi locale if needed
    );
    if (picked != null) {
        selectedDate = "${picked.day}-${picked.month}-${picked.year}"; // Format date
update();
    }
  }




}
class StateData {
  final int id;
  final String name;

  StateData({required this.id, required this.name});

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      id: json['id'],
      name: json['name'],
    );
  }
}