
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/screens/MembershipSelectionScreen.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import '../controller/UserProfileController.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';
import 'package:http/http.dart' as http;



import 'package:flutter/cupertino.dart';

import '../models/DistrictResponse.dart';
import 'ShowStoriesScreen.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  bool isVillage = true;
  List<StateData> states = [];
  // Dataaa? selectedState;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(

      backgroundColor: AppColor.whitecolor,

      body: SafeArea(
        child: SingleChildScrollView(
          child:


        GetBuilder<Userprofilecontroller>(
        init: Userprofilecontroller(),
        builder: (s) =>



        s.isLoading.value?
        Center(
          child: CustomWidgets.showCircularIndicator1(
              context, height * .9, AppColor.appColor),
        )
            :





          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Section
                Container(

                  padding: const EdgeInsets.all(5.0),




                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color(0xFFFFA726),
                        Color(0xFFFFA726),
                        Color(0xFFFFA726),
                        Color(0xFFFFA726),
                      ],
                      stops: [0.3, 0.6, 0.8, 1.0],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 90, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${s.getProfilesResponse.value.data?.name??""}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),



                Container(

                  padding:  EdgeInsets.symmetric(vertical: height*.2),

                  alignment: Alignment.centerLeft,

                  child: Text(
                    'Stories',
                    style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.5),
                  ),
                ),
                s.isLoading.value
                    ? Center(
                  child: CustomWidgets.showCircularIndicator1(
                      context, height * .9, AppColor.appColor),
                )
                    : SizedBox(



                  height: height*1.6,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: s.storiesResponse.value?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(

                        onTap: ()
                        {



                          print("ccrrcrc");


                          // MaterialPageRoute(
                          //     builder: (context) => FullScreenStoryView(
                          //       stories: s.storiesResponse.value,
                          //       initialIndex: 1,
                          //     )
                          //
                          // );

                          Get.to( FullScreenStoryView(
                            stories: s.storiesResponse.value,
                            initialIndex: index,
                          ));






                        },

                        child: Container(
                          padding: EdgeInsets.all(1),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: height*1.7,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange, width: 3),
                          ),
                          child:

                          CircleAvatar(



                            backgroundImage:
                            CachedNetworkImageProvider(
                              s.storiesResponse.value.data![index].name ?? "",),
                            radius: 40,
                            backgroundColor: Colors.white,
                          ),





                        ),
                      );
                    },
                  ),
                ),



                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title (e.g., जन्म तिथि)
                      Container(

                        alignment: Alignment.centerLeft,
                        child: Text(
                          'जन्म तिथि', // Change this text as needed
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Date Picker UI
                      Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColor.appColor,

                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Day box
                            // _buildDateBox(s?.day?[0]??""),
                            // _buildDateBox(s?.day?[1]??""),

                            _buildDateBox(s?.day?.isNotEmpty == true ? s.day![0] : ""),


                            _buildDateBox(s?.day?.length ==2  ? s.day![1] : ""),
// ,
                             SizedBox(width: 15),


                            _buildDateBox(s?.month?.isNotEmpty == true ? s.month![0] : ""),
                            _buildDateBox(s?.month?.length == 2  ? s.month![1] : ""),
                            SizedBox(width: 15),


                            // Year box
                            Expanded(child: _buildDateBox(s.year)),

                            GestureDetector(
                              onTap: () async {



                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: s.selectedDate,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                );
                                if (pickedDate != null && pickedDate !=  s.selectedDate) {
                                  // setState(() {
                                    s.selectedDate = pickedDate;




                                     s.day     = DateFormat('dd').format(s.selectedDate!);
                                     s.month   = DateFormat('MM').format(s.selectedDate!);
                                     s.year    = DateFormat('yyyy').format(s.selectedDate!);





                                     s.update();

                               //   });
                                }
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),




                SizedBox(height: 20),

                // Input Fields Section
                _buildInputSection(height,s),

                // Submit Button
                SizedBox(height: 20),

                s.isLoading3.value?
                Center(
                  child: CustomWidgets.showCircularIndicator1(
                      context, height * .9, AppColor.appColor),
                )

                :
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {


                     s. send_user_data_fun();
                      // Submit Action
                    },
                    child: Text(
                      "सबमिट करें",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),

        )
        ),
      ),
    );
  }

  Widget _buildInputSection(double height,Userprofilecontroller s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date of Birth
     //   Text("जन्म तिथि", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
     //    TextField(
     //      decoration: InputDecoration(
     //        hintText: "DD/MM/YYYY",
     //        suffixIcon: Icon(Icons.calendar_today, color: Colors.orange),
     //      ),
     //      onTap: () async {
     //        // Open Date Picker
     //      },
     //    ),



     //   SizedBox(height: 20),



        Container(

          alignment: Alignment.centerLeft,
          child: Text(
            'लिंग', // Change this text as needed
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

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





        SizedBox(height: 20),










        // Text Fields
        // TextField(
        //   decoration: InputDecoration(hintText: "+91 87003149***"),
        // ),
        // SizedBox(height: 10),
        // TextField(
        //   decoration: InputDecoration(hintText: "बिहार"),
        // ),
        // SizedBox(height: 10),
        // TextField(
        //   decoration: InputDecoration(hintText: "जिला"),
        // ),
        // SizedBox(height: 10),
        // TextField(
        //   decoration: InputDecoration(hintText: "निर्वाचन क्षेत्र"),
        // ),
        // SizedBox(height: 10),
        // TextField(
        //   decoration: InputDecoration(hintText: "पंचायत"),
        // ),
        // SizedBox(height: 10),
        // TextField(
        //   decoration: InputDecoration(hintText: "ग्राम"),
        // ),
        // SizedBox(height: 10),
        // TextField(
        //   decoration: InputDecoration(hintText: "पिन कोड"),
        // ),
        // SizedBox(height: 10),
        // TextField(
        //   decoration: InputDecoration(hintText: "पता"),
        // ),
        //
        //
        //






        _buildTextField('नाम', null, height,null,TextInputType.text,s.name_controller),
        _buildTextField('+91 मोबाइल नंबर दर्ज करें',null, height,null,TextInputType.number,s.mobileno_controller),
        _buildTextDateTime('जन्म तिथि', Icons.calendar_today_outlined, height,s),


        _buildDropdownFieldDist('राज्य', height,s ),
        _buildDropdownField('जिला', height, s,),




        _buildTextField('निर्वाचन क्षेत्र', null, height,null,TextInputType.text,s.nirvachan_controller),


        isVillage?

        _buildTextField('पंचायत', null, height,null,TextInputType.text,s.panchayt_controller):SizedBox(),


        isVillage?

        _buildTextField('ग्राम', null, height,null,TextInputType.text,s.village_controller):SizedBox(),




        _buildTextField('पिन कोड', null, height,6,TextInputType.number, s.pincode_controller),
        _buildTextField('पता', null, height,null,TextInputType.text,s.address_controller),







      ],
    );
  }







  Widget _buildDateBox(String value) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }












  Widget _buildDropdownField(String hintText, double height, Userprofilecontroller s,) {
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
              //      value: s.selectedDistrict.value,

              value:    s. districtResponse.value.data?.contains(s.selectedDistrict.value) == true
                  ? s.selectedDistrict.value
                  : null,

              onChanged: (Dataa? newState) {
                setState(() {
                  s.selectedDistrict.value = newState!;
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

  Widget _buildDropdownFieldDist(String hintText, double height, Userprofilecontroller s) {
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



              value:s. stateResponse.value.data?.contains(s.selectedState.value) == true
                  ? s.selectedState.value
                  : null,
              //  value: s.selectedState.value,
              onChanged: (Dataaa? newState) {
                setState(() {

                  print("ddod d d");


                  s. selectedState.value = newState!;

                  s.selectedDistrict.value=null;

                  if (s.selectedState != null) {
                    // Fetch districts based on selected state if necessary


                    s.district_fun(s.selectedState?.value.id);
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


  Widget _buildTextDateTime(String hintText, IconData? icon, double height, Userprofilecontroller s, ) {
    return


      Container(

        height: height* 1.9,

        padding: EdgeInsets.symmetric(vertical: height * .3),
        child: GestureDetector(

          onTap: () => s.selectDate(Get.context!!), // Show DatePicker on tap

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

                  s.selectedDate1, // Hindi text

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



