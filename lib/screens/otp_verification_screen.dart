

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/auth_controller.dart';
import 'package:pinput/pinput.dart';

import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import '../controller/otp_verification_controller.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';







class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OtpVerificationScreenState();
}


 class _OtpVerificationScreenState extends State<OTPVerificationScreen> {

//class _OtpVerificationScreenState extends StatelessWidget {


  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60

,


      textStyle: const TextStyle(
        fontSize: 18,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.grayColor
       ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures taps outside are registered

      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard

      child: Scaffold(
        backgroundColor:AppColor.whitecolor,

        resizeToAvoidBottomInset: true,

        body: SingleChildScrollView(
          child:


          GetBuilder<AuthController>(
          init: AuthController(),
          builder: (s) => Container(

           // height: MediaQuery.of(context).size.height, // Constrain height to screen

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

            //  crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                // Logo Section
                // Container(
                //
                //   child: CircleAvatar(
                //     radius:  height * 2.2,
                //     backgroundImage:
                //
                //
                //     AssetImage("assets/images/16.png"),
                //
                //
                //
                //   ),
                // ),








                Stack(
                  children: [
                    Container(
                      //  color:Colors.pink,

                      child: ClipPath(
                        clipper: MyCustomClipper(),
                        child:

                        Container(
                          height: height*6,
                          // Adjust the height to fit your design

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColor.appColor, Colors.purple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            // borderRadius: BorderRadius.vertical(
                            //   bottom: Radius.circular(30),
                            // ),
                          ),


                        ),
                      ),



                    ),

                    Positioned(child:


                    Container(

                      //margin: EdgeInsets.only(top: height*.4),

                        child: Image.asset('assets/images/app_icon.png',height: 100,)),

                      top: height*2.9,
                      left: height*3.4,

                    ),

                  ],
                ),







                SizedBox(height: height * 1),




                Container(
                  // width: double.infinity,
                  // decoration: BoxDecoration(
                  //   color:AppColor.appColor,
                  //
                  //   borderRadius: BorderRadius.only(     topLeft: Radius.circular(height * 1.2),  // Top-left corner radius
                  //     topRight: Radius.circular( height * 1.2),)
                  // ),

                  child: Column(


                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [



                    SizedBox(height: height * .9),

                    // Card Section for OTP
                    Container(

                      child: Column(

                        children: [
                          // Heading Text
                          // Text(
                          //   'मोबाइल OTP दर्ज करे',
                          //   style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.9),
                          //
                          // ),
                          // SizedBox(height: height * .3),
                          //
                          // // Subheading Text
                          //
                          //
                          //
                          // Text(
                          //
                          //   'आपके नंबर ${s.maskPhoneNumber(s.mobile_no)} चार अंकीय कोड भेजा गया',
                          //   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.35),
                          //
                          //   textAlign: TextAlign.center,
                          // ),
                          // SizedBox(height: height * .5),
                          //







                        const Text(
              'Verify your account!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'We have sent an OTP to +91 xxxxx xxxxx',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),

                          Form(


                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Directionality(
                                  // Specify direction if desired
                                  textDirection: TextDirection.ltr,
                                  child: Pinput(
                                    length: 6,
                                    controller: s. pinController,
                                    focusNode: focusNode,
                                    //androidSmsAutofillMethod:
                                  //  AndroidSmsAutofillMethod.smsUserConsentApi,
                                  //  listenForMultipleSmsOnAndroid: true,
                                    defaultPinTheme: defaultPinTheme,
                                    // separatorBuilder: (index) => const SizedBox(width: 10),
                                    validator: (value) {
                                      return value?.length !=6  ?  'Otp is incorrect' : null;
                                    },
                                    // onClipboardFound: (value) {
                                    //   debugPrint('onClipboardFound: $value');
                                    //   pinController.setText(value);
                                    // },
                                   hapticFeedbackType: HapticFeedbackType.lightImpact,
                                    onCompleted: (pin) {
                                      debugPrint('onCompleted: $pin');
                                    },
                                    onChanged: (value) {
                                      debugPrint('onChanged: $value');
                                    },
                                    cursor: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 9),
                                          width: 20,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    focusedPinTheme: defaultPinTheme.copyWith(
                                      decoration: defaultPinTheme.decoration!.copyWith(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.activebtncolor),
                                      ),
                                    ),
                                    submittedPinTheme: defaultPinTheme.copyWith(
                                      decoration: defaultPinTheme.decoration!.copyWith(
                                        color: AppColor.grayColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.whitecolor),
                                      ),
                                    ),
                                    errorPinTheme: defaultPinTheme.copyBorderWith(
                                      border: Border.all(color: Colors.redAccent),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),











                       true

                       //   s.isLoading2
                              ?
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10),

                              child: Text("Resend otp in 0:",
                                 // +s.start.toString(),,
                                  style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.3),
                              )   ):



                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {


                              //
                              // s.isLoading2=true;
                              // s.start=30;
                              // s.startTimer();
                              // s.ResendOtpfun();
                              //



                            },
                            child:

                             Text('आपका OTP समाप्त हो गया है 00:00 Resend Code',
                                style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.3),
                               ),
                          ),



                          SizedBox(height: height * .5),

                          // Resend OTP Timer
                          // Text('आपका OTP समाप्त हो गया है 00:00 Resend Code',
                          //   style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.3),
                          //
                          //   textAlign: TextAlign.center,
                          // ),
                          //
                          //
                          // SizedBox(height: height * .5),
                          //




                          s. isLoading.value ?

                          Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor)):

                          Container(



                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 1,top: 10,left: 20,right: 20),
                            child:  ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                    backgroundColor:  AppColor.appColor,
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),



                                onPressed: (){





                             ///     Get.to(OTPVerificationScreen());

                                  if(formKey.currentState!.validate()){








                                    Get.offAll(() => DashboardScreen());



                                    s.User_Verificy_Fun();



                                  }
                                },
                                child: Text("Otp Verification",

                                  style: Newtextstyle.normaNoSpacinglopenSans(Colors.white,height*.5),
                                )
                            ),

                          ),






                        //   ElevatedButton(
                        //     onPressed: () {
                        //
                        //
                        //
                        // //     Get.offAll(() => MembershipForm());
                        //
                        //       if(formKey.currentState!.validate()){
                        //
                        //
                        //         // Navigator.push(
                        //         //   context,
                        //         //   MaterialPageRoute(builder: (context) => MembershipForm()),);
                        //         //
                        //
                        //
                        //          s.User_Verificy_Fun();
                        //
                        //
                        //
                        //       }else{
                        //        print("cds,c,ld,lcd");
                        //
                        //        Get.snackbar(
                        //          "Invalid your otp",
                        //          "",
                        //          backgroundColor: AppColor.whitecolor,
                        //          forwardAnimationCurve: Curves.easeOutBack,
                        //          snackPosition: SnackPosition.BOTTOM,
                        //
                        //        );
                        //
                        //        s.update();
                        //
                        //
                        //
                        //         // CustomWidgets.showToast("Service is not available at this address!! Try another");
                        //
                        //
                        //
                        //         }
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
                        //
                        //
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.orange[300],
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(25),
                        //       ),
                        //       side: BorderSide(color: AppColor.whitecolor, width: 2.5),
                        //       padding: EdgeInsets.symmetric(
                        //         horizontal: height * .7,
                        //         vertical: height * .2,
                        //       ),
                        //     ),
                        //     child: Text(
                        //       "ओटीपी वेरीफाई करे",
                        //
                        //
                        //
                        //
                        //       style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.4),
                        //
                        //
                        //
                        //     ),
                        //   ),

                          // Verify Button



                        ],
                      ),
                    ),
                    SizedBox(height: height * .5),



                    // Footer Section
                    // Column(
                    //
                    //
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //
                    //   children: [
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
                    //
                    //     Container(
                    //       height: height*1.2,
                    //       alignment: Alignment.center,
                    //       child: Text(
                    //         textAlign: TextAlign.start,
                    //
                    //         "जन सहमति पार्टी",
                    //         style: Newtextstyle.normalopenSans(Colors.white,height*.9),),
                    //
                    //
                    //
                    //     ),
                    //     Container(
                    //       alignment: Alignment.center,
                    //       child: Text(
                    //         '"जनता की सहमति, लोकतंत्र की मजबूती"',
                    //
                    //         style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.4),
                    //         textAlign: TextAlign.start,
                    //       ),
                    //     ),
                    //
                    //
                    //
                    //     SizedBox(height: height * .3),
                    //
                    //   ],
                    // ),


                  ],
                ),),




             //   SizedBox(height: height * 3),


              ],
            ),
          ),


          )
        ),
      ),
    );
  }
}



























//
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class OTPVerificationScreen extends StatefulWidget {
//   const OTPVerificationScreen({super.key});
//
//   @override
//   State<OTPVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends State<OTPVerificationScreen> {
//   final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
//   final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
//   int _remainingSeconds = 59;
//   late Timer _timer;
//   bool _canResend = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingSeconds == 0) {
//         timer.cancel();
//         setState(() => _canResend = true);
//       } else {
//         setState(() => _remainingSeconds--);
//       }
//     });
//   }
//
//   void _resendOtp() {
//     if (!_canResend) return;
//     setState(() {
//       _remainingSeconds = 59;
//       _canResend = false;
//     });
//     _startTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 60),
//             const Text(
//               'Verify your account!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'We have sent an OTP to +91 xxxxx xxxxx',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 32),
//
//             // OTP Input Fields
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(6, (index) => _buildOtpField(index)),
//             ),
//
//             const SizedBox(height: 32),
//
//             // Timer & Resend
//             Center(
//               child: RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     color: _canResend ? Colors.blue : Colors.grey,
//                     fontSize: 16,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: '00:${_remainingSeconds.toString().padLeft(2, '0')} ',
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                     TextSpan(
//                       text: 'Resend OTP',
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         color: _canResend ? Colors.blue : Colors.grey,
//                       ),
//                       recognizer: TapGestureRecognizer()..onTap = _resendOtp,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             const Spacer(),
//
//             // Re-enter Number
//             Center(
//               child: TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   'Re-enter your mobile number',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ),
//
//             // Next Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   'NEXT',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOtpField(int index) {
//     return SizedBox(
//       width: 48,
//       child: TextField(
//         controller: _otpControllers[index],
//         focusNode: _focusNodes[index],
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         decoration: InputDecoration(
//           counterText: '',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: _focusNodes[index].hasFocus
//                   ? Colors.blue
//                   : Colors.grey,
//             ),
//           ),
//         ),
//         onChanged: (value) {
//           if (value.length == 1 && index < 5) {
//             _focusNodes[index + 1].requestFocus();
//           }
//           if (value.isEmpty && index > 0) {
//             _focusNodes[index - 1].requestFocus();
//           }
//         },
//       ),
//     );
//   }
// }