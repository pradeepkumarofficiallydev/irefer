import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/screens/IDCardScreen.dart';

import '../Utils/NewTextstyle.dart';
import '../Utils/Preference.dart';
import '../Utils/custom_widgets.dart';
import '../controller/MembershipSelectionController.dart';
import 'DashboardScreen.dart';


class MembershipSelectionScreen extends StatefulWidget {
  @override
  _MembershipSelectionScreenState createState() =>
      _MembershipSelectionScreenState();
}

class _MembershipSelectionScreenState extends State<MembershipSelectionScreen> {
  String? selectedOption; // Track the selected radio option


  final List<String> options = [
    "किसान सभा",
    "शिक्षक सेल",
    "डॉक्टर सेल",
    "युवा विंग",
    "छात्र विंग",
    "महिला मोर्चा",
  ];




  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(

       backgroundColor: AppColor.whitecolor,

      body:




        GetBuilder<Membershipselectioncontroller>(
        init: Membershipselectioncontroller(),
         builder: (s) =>



        Stack(
        children: [
          // Background
          Container(


            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/background.jpg'), // Replace with your background image
            //     fit: BoxFit.cover,
            //   ),
            // ),

       //     color: Colors.orange,
          ),
          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                // Padding(
                //   padding: const EdgeInsets.only(top: 16.0),
                //   child: Center(
                //     child: Column(
                //       children: [
                //         Container(
                //           height: 60,
                //           alignment: Alignment.center,
                //           child: Text(
                //             "जन सहमति पार्टी",
                //             style: TextStyle(
                //               fontSize: 50,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white,
                //             ),
                //             textAlign: TextAlign.center,
                //           ),
                //         ),
                //         Container(
                //           alignment: Alignment.center,
                //           child: Text(
                //             '"जनता की सहमति, लोकतंत्र की मजबूती"',
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontStyle: FontStyle.italic,
                //               color: Colors.white,
                //             ),
                //             textAlign: TextAlign.center,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                //
                //
                //




                Container(

                  padding: EdgeInsets.only(top: height*.5),

                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        height: height*1.4,
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.start,

                          "जन सहमति पार्टी",
                          style: Newtextstyle.normalopenSans(Colors.black,height*1.2),),



                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '"जनता की सहमति, लोकतंत्र की मजबूती"',

                          style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.5),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),




                SizedBox(height: height * .9),

                Container(

                  //   height:  height * .7,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {




                      Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
                      print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
                      //


                      s. send_user_data_fun("home");





                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      side: BorderSide(color: AppColor.appColor, width: 2.5),
                      padding: EdgeInsets.symmetric(
                        horizontal: height * .7,
                        vertical: height * .2,
                      ),
                    ),
                    child: Text(
                      " Skip ",




                      style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.6),



                    ),
                  ),
                ),

                // Radio Button List
                Expanded(
                  child: Container(

                    margin:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),

                    padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
                    decoration:  BoxDecoration(
                      color: AppColor.appColor,
                      borderRadius:BorderRadius.circular(40)
                        
                    ),


                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: RadioListTile<String>(
                              value: options[index],
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;

                                  s.data=    options[index];
                                });
                              },
                              title: Text(
                                options[index],
                                style: Newtextstyle.normalopenSans(Colors.black54,height*.6),
                              ),
                              activeColor: Colors.orange,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Bottom Button
                Container(

                    height:  height * 1.3,
                  alignment: Alignment.center,
                  child:





                  s. isLoading.value ?

                  CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor):


                  ElevatedButton(
                    onPressed: () {


                      if(s.data.isNotEmpty)
                        {
                          s. send_user_data_fun("idCardScreen");


                        }
else
  {






    Get.snackbar(
      "Please select one constituency",
      "",
      backgroundColor: AppColor.appColor,
      forwardAnimationCurve: Curves.easeOutBack,
      snackPosition: SnackPosition.BOTTOM,




    );



    s.update();

  }










                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      side: BorderSide(color: AppColor.appColor, width: 2.5),
                      padding: EdgeInsets.symmetric(
                        horizontal: height * .7,
                        vertical: height * .2,
                      ),
                    ),
                    child: Text(
                      "  आगे बढ़े  ",




                      style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor,height*.6),



                    ),
                  ),
                ),


                SizedBox(height: height * .9),

              ],
            ),
          ),
        ],
      ),

        )
    );
  }
}
