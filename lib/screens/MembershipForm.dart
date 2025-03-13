//
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/controller/MembershipFormController.dart';
// import 'package:jsp/screens/MembershipSelectionScreen.dart';
// import '../Utils/NewTextstyle.dart';
// import '../models/DistrictResponse.dart';
// import '../models/StateResponse.dart';
// import 'OTPVerificationScree.dart';
// import 'package:http/http.dart' as http;
//
// class MembershipForm extends StatefulWidget {
//   @override
//   _MembershipFormState createState() => _MembershipFormState();
// }
//
// class _MembershipFormState extends State<MembershipForm> {
//   bool isVillage = true;
//   List<StateData> states = [];
//  // StateData? selectedState;
//
//   // Data? selectedState;
//   // Dataa? selectedDistrict;
//   //
//
//
//   Data? selectedState = null;
//   Dataa? selectedDistrict = null;
//
//
//   @override
//   void initState() {
//     super.initState();
//     //_fetchStates();
//   }
//
//   // Fetch states from the API
//   Future<void> _fetchStates() async {
//     final response = await http.post(Uri.parse('https://jsp.socialpost.co.in/api/states'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body)['data'];
//       setState(() {
//         states = (data as List).map((state) => StateData.fromJson(state)).toList();
//       });
//     } else {
//       // Handle error
//       print('Failed to load states');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//       backgroundColor: AppColor.whitecolor,
//       body:
//
//       GetBuilder<Membershipformcontroller>(
//         init: Membershipformcontroller(),
//     builder: (s) =>
//
//     Column(
//         children: [
//           // Header Section
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: height * .2, vertical: height * .7),
//             decoration: BoxDecoration(
//               color: AppColor.appColor,
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(height * 1.2),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: height * 1.2, width: height * .2),
//                 Center(
//                   child: Text(
//                     'सदस्य बनें..',
//                     style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black, height * 1),
//                   ),
//                 ),
//                 SizedBox(height: height * .4),
//                 // Toggle Section
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.symmetric(horizontal: height * .3),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Text(
//                           'गांव',
//                           style: Newtextstyle.nanoText18Bold(Colors.black, height * .4),
//                         ),
//                       ),
//                       SizedBox(height: height * .9, width: height * .2),
//                       Switch(
//                         value: !isVillage,
//                         onChanged: (value) {
//                           setState(() {
//                             isVillage = !value;
//                           });
//                         },
//                         activeColor: Colors.white,
//                         inactiveThumbColor: Colors.orange,
//                         inactiveTrackColor: Colors.indigoAccent,
//                       ),
//                       SizedBox(height: height * .9, width: height * .2),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: height * .3),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Text(
//                           'शहर',
//                           style: Newtextstyle.nanoText18Bold(Colors.black, height * .4),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: height * .4),
//           // Form Section
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: height * .3),
//               child: Column(
//                 children: [
//                   _buildTextField('नाम', null, height),
//                   _buildTextField('+91 मोबाइल नंबर दर्ज करें', Icons.phone, height),
//                   _buildTextField('जन्म तिथि', Icons.calendar_today_outlined, height),
//                   _buildDropdownFieldDist('राज्य', height,s),
//
//
//                   _buildDropdownField('जिला', height,s),
//
//
//                   _buildTextField('निर्वाचन क्षेत्र', null, height),
//                   _buildTextField('पंचायत', null, height),
//                   _buildTextField('ग्राम', null, height),
//                   _buildTextField('पिन कोड', null, height),
//                   _buildTextField('पता', null, height),
//                   SizedBox(height: height * .4),
//                   // Upload Photo Button
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColor.appColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         side: BorderSide(color: AppColor.grayColor, width: 2.5),
//                         padding: EdgeInsets.symmetric(horizontal: height * .7, vertical: height * .2),
//                       ),
//                       child: Text(
//                         "फोटो अपलोड करें",
//                         style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor, height * .6),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * .4),
//                   // Next Button
//                   Container(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => MembershipSelectionScreen()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.grey.shade200,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         side: BorderSide(color: AppColor.appColor, width: 2.5),
//                         padding: EdgeInsets.symmetric(horizontal: height * .7, vertical: height * .2),
//                       ),
//                       child: Text(
//                         "  आगे बढ़े  ",
//                         style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor, height * .6),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * .4),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
//
//   Widget _buildDropdownField(String hintText, double height, Membershipformcontroller s) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: height * .3),
//       padding: EdgeInsets.symmetric(horizontal: height * .3),
//       decoration: BoxDecoration(
//         color: AppColor.grayColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: DropdownButton<Dataa>(
//               hint: Text(
//                 hintText,
//                 style: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .6),
//               ),
//               value: selectedDistrict,
//               onChanged: (Dataa? newState) {
//                 setState(() {
//                   selectedDistrict = newState;
//                 });
//               },
//               items: s.districtResponse.value.data?.map((state) {
//                 return DropdownMenuItem<Dataa>(
//                   value: state,
//                   child: Text(state?.city??"",                style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
//                   ),
//                 );
//               }).toList(),
//               isExpanded: true,
//               underline: SizedBox(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//
//   Widget _buildDropdownFieldDist(String hintText, double height, Membershipformcontroller s) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: height * .3),
//       padding: EdgeInsets.symmetric(horizontal: height * .3),
//       decoration: BoxDecoration(
//         color: AppColor.grayColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: DropdownButton<Data>(
//               hint: Text(
//                 hintText,
//                 style: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .6),
//               ),
//               value: selectedState,
//               onChanged: (Data? newState) {
//                 setState(() {
//                   selectedState = newState;
//
//                   if (selectedState != null) {
//                     // Fetch districts based on selected state if necessary
//                     s.district_fun(selectedState?.id);
//                   }
//
//                   print("sjcjcjdjcdc");
//
//                 });
//               },
//               items: s.stateResponse.value.data?.map((state) {
//                 return DropdownMenuItem<Data>(
//                   value: state,
//                   child: Text(state?.name??"",                style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
//                   ),
//                 );
//               }).toList(),
//               isExpanded: true,
//               underline: SizedBox(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//
//
//
//
//
//   // Helper Widget for Text Fields
//   Widget _buildTextField(String hintText, IconData? icon, double height) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: height * .3),
//       padding: EdgeInsets.symmetric(horizontal: height * .3),
//       decoration: BoxDecoration(
//         color: AppColor.grayColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: hintText,
//                 hintStyle: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .6),
//               ),
//             ),
//           ),
//           if (icon != null)
//             Icon(
//               icon,
//               color: Colors.grey,
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// // State data model
// class StateData {
//   final int id;
//   final String name;
//
//   StateData({required this.id, required this.name});
//
//   factory StateData.fromJson(Map<String, dynamic> json) {
//     return StateData(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }














import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/MembershipFormController.dart';
import 'package:jsp/screens/MembershipSelectionScreen.dart';
import '../Utils/NewTextstyle.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';
import 'OTPVerificationScree.dart';
import 'package:http/http.dart' as http;

import 'Testing.dart';

import 'package:permission_handler/permission_handler.dart';

class MembershipForm extends StatefulWidget {
  @override
  _MembershipFormState createState() => _MembershipFormState();
}

class _MembershipFormState extends State<MembershipForm> {
  bool isVillage = true;
  List<StateData> states = [];
  Dataaa? selectedState;
  Dataa? selectedDistrict;

  @override
  void initState() {
    super.initState();
    _fetchStates();
  }









  // Fetch states from the API
  Future<void> _fetchStates() async {
    final response = await http.post(Uri.parse('https://jsp.socialpost.co.in/api/states'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      setState(() {
        states = (data as List).map((state) => StateData.fromJson(state)).toList();
      });
    } else {
      // Handle error
      print('Failed to load states');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: GetBuilder<Membershipformcontroller>(
        init: Membershipformcontroller(),
        builder: (s) => Column(


          children: [
            // Header Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: height * .2, vertical: height * .7),
              decoration: BoxDecoration(
                color: AppColor.appColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(height * 1.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 1.2, width: height * .2),
                  Center(
                    child: Text(
                      'सदस्य बनें..',
                      style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black, height * 1),
                    ),
                  ),
                  SizedBox(height: height * .4),
                  // Toggle Section
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: height * .3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'गांव',
                            style: Newtextstyle.nanoText18Bold(Colors.black, height * .4),
                          ),
                        ),
                        SizedBox(height: height * .9, width: height * .2),
                        Switch(
                          value: !isVillage,
                          onChanged: (value) {
                            setState(() {
                              isVillage = !value;


                               print("xdldkcd $isVillage");

                            });
                          },
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.orange,
                          inactiveTrackColor: Colors.indigoAccent,
                        ),
                        SizedBox(height: height * .9, width: height * .2),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: height * .3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'शहर',
                            style: Newtextstyle.nanoText18Bold(Colors.black, height * .4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .4),
            // Form Section
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: height * .3),
                child: Column(

                  children: [


                    _buildTextField('नाम', null, height,null,TextInputType.text,s.name_controller),
                    _buildTextField('+91 मोबाइल नंबर दर्ज करें',null, height,null,TextInputType.number,s.mobileno_controller),
                     _buildTextDateTime('जन्म तिथि', Icons.calendar_today_outlined, height,s),


                    SizedBox(height: height*.1),



                    // Gender Selection
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              groupValue: s.selectedGender,
                              onChanged: (int? value) {
                                setState(() {
                                  s.selectedGender = value!;
                                });
                              },
                            ),
                            Text("पुरुष"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 2,


                              groupValue: s.selectedGender,
                              onChanged: (int? value) {
                                setState(() {
                                  s.selectedGender = value!;
                                });
                              },
                            ),
                            Text("महिला"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 3,
                              groupValue: s.selectedGender,
                              onChanged: (int? value) {
                                setState(() {
                                  s.selectedGender = value!;
                                });
                              },
                            ),
                            Text("अन्य"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                  SizedBox(height: height*.3),



                    _buildDropdownFieldDist('राज्य', height,s ),
                    _buildDropdownField('जिला', height, s,),
                    _buildTextField('निर्वाचन क्षेत्र', null, height,null,TextInputType.text,s.nirvachan_controller),


                    isVillage?

                    _buildTextField('पंचायत', null, height,null,TextInputType.text,s.panchayt_controller):SizedBox(),


                    isVillage?

                    _buildTextField('ग्राम', null, height,null,TextInputType.text,s.village_controller):SizedBox(),




                    _buildTextField('पिन कोड', null, height,6,TextInputType.number, s.pincode_controller),
                    _buildTextField('पता', null, height,null,TextInputType.text,s.address_controller),



                    SizedBox(height: height * .4),

                  s.  imageFile == null ?

                    // Upload Photo Button
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () async {



                          Map<Permission, PermissionStatus> statuses =
                          await [Permission.camera, Permission.photos]
                              .request();
                          if (statuses[Permission.photos]!.isGranted &&
                          statuses[Permission.camera]!.isGranted) {
                         s. showImagePicker(context,height);
                          } else {
                          print('no permission provided');
                          }
                          s.showImagePicker(context,height);





                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          side: BorderSide(color: AppColor.grayColor, width: 2.5),
                          padding: EdgeInsets.symmetric(horizontal: height * .7, vertical: height * .2),
                        ),
                        child: Text(
                          "फोटो अपलोड करें",
                          style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor, height * .6),
                        ),
                      ),
                    ):






                    Container(

                      //  width: 120,
                      height: 100,

                      //   color: Colors.red,

                      alignment: Alignment.center,

                      child: Stack(

                        alignment: Alignment.topRight

                        ,

                        children: [




                          Container(
                            alignment: Alignment.center,


                            width: 100,
                            height: 100,

                            child:


                            Image.file(
                              s.imageFile!,
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,

                            ),
                          ),





                          InkWell(

                              onTap: ()

                              {



                                setState(() {
                                 s. imageFile=null;
                                });


                              },


                              child: Icon(Icons.close,color: Colors.black,)),


                        ],
                      ),
                    ),









                    SizedBox(height: height * .4),
                    // Next Button
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {




                          //





                          print("ddcdcdcdc ${s.panchayt_controller.text}  {$isVillage}");







                          if(s.isInputValid(s.name_controller.text,s.mobileno_controller.text,s.selectedDate ,selectedState,selectedDistrict,s.nirvachan_controller.text,s.panchayt_controller.text,s.village_controller.text,s.pincode_controller.text,s.address_controller.text,isVillage,s.imageFile)){

                             s.uploadImage();



                            Navigator.push(

                              context,
                              MaterialPageRoute(builder: (context) => MembershipSelectionScreen( ),

                                 settings: RouteSettings(arguments: {"name": s.name_controller.text, "mobile": s.mobileno_controller.text,"date":s.selectedDate,"state":selectedState?.id,"District":selectedDistrict?.id,"nirvachan":s.nirvachan_controller.text,"panchayt":s.panchayt_controller.text,"village":s.village_controller.text,"pincode":s.pincode_controller.text,"address":s.address_controller.text,"selectedGender":s.selectedGender}),


                              ),
                            );







                          }





                          else{


                            s. showInputError( s.name_controller.text,s.mobileno_controller.text,s.selectedDate ,selectedState,selectedDistrict,s.nirvachan_controller.text,s.panchayt_controller.text,s.village_controller.text,s.pincode_controller.text,s.address_controller.text,isVillage,s.imageFile );




                          }



























                        },

                       // MembershipSelectionScreen



                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          side: BorderSide(color: AppColor.appColor, width: 2.5),
                          padding: EdgeInsets.symmetric(horizontal: height * .7, vertical: height * .2),
                        ),
                        child: Text(
                          "  आगे बढ़े  ",
                          style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor, height * .6),
                        ),
                      ),
                    ),
                    SizedBox(height: height * .4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hintText, double height, Membershipformcontroller s,) {
    return Container(






      height: height* 1.3,

      margin: EdgeInsets.symmetric(vertical: height * .2),
      padding: EdgeInsets.symmetric(horizontal: height * .3),
      decoration: BoxDecoration(
        color: AppColor.grayColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<Dataa>(
              hint: Text(
                hintText,
                style: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .5),
              ),
              value: selectedDistrict,
              onChanged: (Dataa? newState) {
                setState(() {
                  selectedDistrict = newState;
                });
              },
              items: s.districtResponse.value.data?.map((state) {
                return DropdownMenuItem<Dataa>(
                  key: Key(state.id.toString()), // Ensure unique key
                  value: state,
                  child: Text(
                    state?.city ?? "",
                    style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
                  ),
                );
              }).toList(),
              isExpanded: true,
              underline: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownFieldDist(String hintText, double height, Membershipformcontroller s) {
    return Container(


      height: height* 1.3,

      margin: EdgeInsets.symmetric(vertical: height * .1),
      padding: EdgeInsets.symmetric(horizontal: height * .3),
      decoration: BoxDecoration(
        color: AppColor.grayColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<Dataaa>(

              hint: Text(
                hintText,
                style: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .5),
              ),
              value: selectedState,
              onChanged: (Dataaa? newState) {
                setState(() {
                  selectedState = newState;

                  selectedDistrict=null;

                  if (selectedState != null) {
                    // Fetch districts based on selected state if necessary


                    s.district_fun(selectedState?.id);
                  }

                  print("sjcjcjdjcdc");
                });
              },
              items: s.stateResponse.value.data?.map((state) {
                return DropdownMenuItem<Dataaa>(
                  key: Key(state.id.toString()), // Ensure unique key
                  value: state,
                  child: Container(


                    child: Text(
                      state?.name ?? "",
                      style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
                    ),
                  ),
                );
              }).toList(),
              isExpanded: true,
              underline: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Text Fields
  Widget _buildTextField(String hintText, IconData? icon, double height, int? textLength, TextInputType number, TextEditingController controller) {
    return Container(


      height: height* 1.9,




      padding: EdgeInsets.symmetric(vertical: height * .1),
      child: TextField(

            controller: controller,
        textAlign: TextAlign.left, // Horizontal alignment
        textAlignVertical: TextAlignVertical.center,
        maxLength:  textLength != null ? textLength: null,
        cursorColor: Colors.black,
        keyboardType: number,
        style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
        decoration: InputDecoration(

          hintText: hintText,
          hintStyle: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .5),
          prefixIcon: icon != null ? Icon(icon) : null,
          filled: true,
          fillColor: AppColor.grayColor,



          border: OutlineInputBorder(


            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }


  Widget _buildTextDateTime(String hintText, IconData? icon, double height, Membershipformcontroller s, ) {
    return


      Container(

        height: height* 1.9,

        padding: EdgeInsets.symmetric(vertical: height * .3),
      child: GestureDetector(

        onTap: () => s.selectDate(context), // Show DatePicker on tap

        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: height * 0.3),
          decoration: BoxDecoration(
            color: Colors.grey.shade300, // Background color
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(


                style: Newtextstyle.normaNoSpacinglopenSans(s.selectedDate=="जन्म तिथि"?   Colors.black54:Colors.black, height * .5),

                s.selectedDate, // Hindi text

              ),
              Icon(
                Icons.calendar_today, // Calendar icon
                color: Colors.red, // Icon color
                size: height * 0.6, // Adjust icon size
              ),
            ],
          ),
        ),
      ),
      );







  }














}
