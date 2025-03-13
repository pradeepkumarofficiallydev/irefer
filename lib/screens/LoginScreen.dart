//
//
//
//
//
//
//
// import 'package:form_field_validator/form_field_validator.dart';
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:jsp/Utils/AppColors.dart';
//
// import '../Utils/NewTextstyle.dart';
// import '../Utils/custom_widgets.dart';
// import '../controller/LoginController.dart';
// import 'OTPVerificationScree.dart';
//
// class Loginscreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BannerScreen(),
//     );
//   }
// }
//
// class BannerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       body: SingleChildScrollView(
//
//         child:
//
//
//
//
//
//         GetBuilder<LoginController>(
//           init: LoginController(),
//           builder: (s) =>
//
//
//
//
//
//
//               Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Banner Section
//             // Stack(
//             //   children: [
//             //     // Banner Image
//             //     Container(
//             //       width: double.infinity,
//             //       height: height * 10.4, // Adjust the height as needed
//             //       decoration: BoxDecoration(
//             //         image: DecorationImage(
//             //           image: AssetImage('assets/images/banner.png'), // Your uploaded banner
//             //           fit: BoxFit.cover,
//             //         ),
//             //       ),
//             //     ),
//             //
//             //     // Overlay Text
//             //     Align(
//             //
//             //       alignment: Alignment.center,
//             //
//             //       //   top: screenWidth * 0.05,
//             //       // //  left: screenWidth * 0.05,
//             //       //   bottom: screenHeight * 0.02,
//             //       child:
//             //
//             //
//             //
//             //       Container(
//             //
//             //         padding: EdgeInsets.only(top: height*.8),
//             //
//             //         child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//             //           mainAxisAlignment: MainAxisAlignment.center,
//             //           children: [
//             //
//             //
//             //             Container(
//             //               height: height*1.4,
//             //               alignment: Alignment.center,
//             //               child: Text(
//             //                 textAlign: TextAlign.start,
//             //
//             //                 "जन सहमति पार्टी",
//             //                 style: Newtextstyle.normalopenSans(Colors.white,height*1.1),),
//             //
//             //
//             //
//             //             ),
//             //             Container(
//             //               alignment: Alignment.center,
//             //               child: Text(
//             //                 '"जनता की सहमति, लोकतंत्र की मजबूती"',
//             //
//             //                 style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.45),
//             //                 textAlign: TextAlign.start,
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //     ),
//             //
//             //
//             //     Positioned(
//             //
//             //       top: height*6,
//             //       right: height*.4,
//             //
//             //
//             //       //height: screenHeight/2,
//             //       //  top: 30,
//             //       // bottom: 0,
//             //
//             //       child: Text(
//             //         '" बिहार के लिए,\n             हर कदम सही! "',
//             //         textAlign: TextAlign.center,
//             //         style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.7),
//             //       ),
//             //     ),
//             //
//             //
//             //   ],
//             // ),
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
//              Container(
//
//                height: 300,
//
//
//
//
//
//
//                width: double.infinity,
//                decoration: BoxDecoration(
//                    color:AppColor.appColor,
//
//                    borderRadius: BorderRadius.only(     bottomLeft: Radius.circular(height * 1.2),  // Top-left corner radius
//                      bottomRight: Radius.circular( height * 1.2),)
//                ),
//
//              )
//
//
//
//
//
//             ,
//
//             // Content Section
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: height * 0.4),
//
//                 Text(
//                   "आप का स्वागत है",
//                   style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.7),
//
//                 ),
//                 SizedBox(height: height * 0.3),
//                 Text(
//                   "मोबाइल नंबर दर्ज करे",
//                   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.5),
//
//                 ),
//
//                 // Mobile Number Input
//                 //SizedBox(height: height * 0.6),
//                 Container(
//
//                   margin: EdgeInsets.all( height*.8),
//
//                   height: height * 1.2,
//                   decoration: BoxDecoration(
//                     color: AppColor.appColor,
//
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.orange, width: 2),
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//
//                         padding: EdgeInsets.symmetric(horizontal: height*.5),
//                         child: Text(
//                           "+91 |",
//                           style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.5),
//
//
//
//
//                         ),
//                       ),
//                       Expanded(
//                         child: TextFormField(
//
//
//                           validator: MultiValidator([
//                             MinLengthValidator(10,
//                                 errorText:
//                                 'Enter 10 digit Mobile Number'),
//                             RequiredValidator(
//                                 errorText: 'Enter mobile number'),
//                             /*    PatternValidator(r'(^[0,9]{10}$)',
//                                   errorText: 'enter vaid mobile number'),*/
//                           ]),
//                           maxLength: 10,
//                           cursorColor: Colors.black,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             counterText: '',
//                           ///  filled: true,
//                             hintText: "**********",
//
//                          //   fillColor: Colors.white,
//                             contentPadding:
//                             const EdgeInsets.only(
//                                 left: 14.0,
//                                 bottom: 6.0,
//                                 top: 8.0),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius:
//                               BorderRadius.circular(10.0),
//                             ),
//
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius:
//                               BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           controller:s. mobileno_controller,
//
//                           style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.4),
//                           //
//                           // keyboardType: TextInputType.number,
//                           // decoration: InputDecoration(
//                           //   hintText: "**********",
//                           //   border: InputBorder.none,
//                           // ),
//
//
//
//
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Proceed Button
//                 SizedBox(height: height * 0.8),
//
//
//                s. isLoading.value ?
//
//                 CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor):
//
//
//
//
//                       ElevatedButton(
//                   onPressed: () {
//
//
//
//
//                     // s.User_Login_fun();
//                     //
//
//                   //
//                   //
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => OTPVerificationScreen()),);
//                   //
//
//
//                     if(s.isInputValid(s.mobileno_controller.text)){
//
//
//
//
//
//                       s.  User_Login_fun();
//
//
//
//
//
//                     }
//
//
//
//
//
//                     else{
//
//
//                      s. showInputError( s.mobileno_controller.text );
//
//
//
//
//                     }
//
//
//
//
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey.shade200,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     side: BorderSide(color: AppColor.appColor, width: 2.5),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: height * .7,
//                       vertical: height * .2,
//                     ),
//                   ),
//                   child: Text(
//                     "Get OTP",
//
//
//
//
//                     style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.6),
//
//
//
//                   ),
//                 ),
//
//
//               ],
//             ),
//           ],
//         ),
//       ),
//       )
//     );
//   }
// }
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
//
//
//
//
//
//
//
//
















///////////////////////////////////////////////////




// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'dart:convert';
// import 'package:get/get.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Utils/AppColors.dart';
// import '../controller/LoginController.dart';
//
// class Loginscreen extends StatefulWidget {
//   const Loginscreen({Key? key}) : super(key: key);
//
//   @override
//   State<Loginscreen> createState() => _LogInScreenState();
// }
//
//
// class _LogInScreenState extends State<Loginscreen> {
//   /// var _phone = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColor.appColor,
//
//
//         resizeToAvoidBottomInset: false,
//         body: GetBuilder<LoginController>(
//             init: LoginController(),
//             builder: (s) =>
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
//                 SingleChildScrollView(
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 50,
//                         ),
//                         Center(
//                           child: SizedBox(
//                             height: 85,
//                             child: Image.asset("assets/images/mobec.png"),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 60,
//                         ),
//                         Container(
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: AppColor.whitecolor,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children:<Widget> [
//                               Container(
//
//                                 alignment: Alignment.center,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 60.0),
//                                       child: Center(
//                                         child: const Text('Welcome back!',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontFamily: 'Montserrat',
//                                               fontWeight: FontWeight.w800,
//                                               fontSize: 20,
//                                             )),
//                                       ),
//                                     ),
//                                     Center(
//                                       child: AutoSizeText(
//                                         'login to Continue',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontFamily: 'Montserrat',
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 28.0, left: 15, bottom: 10),
//                                       child: Text("Enter Your Number",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 12,
//                                               fontFamily: 'Montserrat')),
//                                     ),
//                                     Padding(
//                                         padding: EdgeInsets.only(
//                                           left: 15,
//                                           right: 20,
//                                         ),
//                                         child:
//
//
//                                         TextFormField(
//                                           controller: s.mobileno_controller,
//                                           maxLength: 10,
//                                           cursorColor: Colors.black,
//                                           keyboardType: TextInputType.number,
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,
//                                             counterText: '',
//                                             filled: true,
//                                             fillColor: Colors.white,
//                                             contentPadding:
//                                             const EdgeInsets.only(
//                                                 left: 14.0,
//                                                 bottom: 6.0,
//                                                 top: 8.0),
//                                             focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide.none,
//                                               borderRadius:
//                                               BorderRadius.circular(10.0),
//                                             ),
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide.none,
//                                               borderRadius:
//                                               BorderRadius.circular(10.0),
//                                             ),
//                                           ),
//                                         )),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     s.isLoading.value
//                                         ? Container(
//
//                                       margin: EdgeInsets.only(top: 20,bottom: 110),
//
//
//                                       //  margin: EdgeInsets.only(top: 10),
//                                       child: const Center(
//                                           child: SizedBox(
//                                             child: CircularProgressIndicator(
//                                               color: Colors.green,
//                                             ),
//                                           )),
//                                     )
//                                         :
//
//
//                                     InkWell(
//                                       onTap: ()
//                                       {
//                                         s.  User_Login_fun();
//
//
//
//                                       },
//                                       child: Center(
//                                         child: Container(
//                                           margin: EdgeInsets.only(top: 20,bottom: 100),
//                                           alignment: Alignment.center,
//                                           height: 50,
//                                           width: MediaQuery.of(context)
//                                               .size
//                                               .width /
//                                               2,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(22),
//                                               color: AppColor.blackcolor),
//                                           child: Text("Login",
//                                               style: TextStyle(
//                                                   color:
//                                                   AppColor.whitecolor,
//                                                   fontSize: 12,
//                                                   fontFamily:
//                                                   'Montserrat')),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 alignment: Alignment.center,
//
//                                 margin: EdgeInsets.only(bottom: 50, top: 20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: <Widget>[
//                                     Container(
//
//                                       child: const AutoSizeText(
//                                         textAlign: TextAlign.center,
//
//
//
//                                         "Don't you have account?",
//                                         style: TextStyle(
//                                           fontFamily: 'Montserrat',
//                                           color: Colors.grey,
//                                           fontSize: 15,
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         // Navigator.push(
//                                         //   context,
//                                         //   MaterialPageRoute(
//                                         //       builder: (context) =>
//                                         //           Registration_Screen()),
//                                         // );
//                                       },
//
//                                       child: Container(
//                                           child: const AutoSizeText(
//
//
//
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             minFontSize: 2.0,
//                                             "Register",
//
//
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Montserrat',
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w600),
//                                           )),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )));
//   }
//
//   void setAddphone(String phone) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('profilephone', phone);
//     print('checking the value of phone :${prefs.getString('profilephone')}');
//   }
//
//   bool isInputValid(String phone) {
//     return phone.isNotEmpty;
//   }
//
//   void showInputError(String phone) {
//     if (phone.isEmpty) {
//       showToastBar("Please fill Phone Number");
//     }
//   }
//
//   void showToastBar(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.black,
//       textColor: Colors.white,
//       fontSize: 13.0,
//     );
//   }
//
// // void request(String phone) async {
// //
// //
// //   final dio = Dio();
// //   var response = await dio.get(
// //     'https://mobec.io/api/user/put/login/',
// //     queryParameters: {'phone': phone},
// //   );
// //   // print(response.statusCode);
// //   // print(response.data.toString());
// //   if(phone.isEmpty){
// //
// //   }else try{
// //     if(response.statusCode == 200){
// //       var body = jsonDecode(response.data.toString());
// //       print(body['message']);
// //       if(body['message'] == 'User does not exits'){
// //         return showToastBar('User does not exits');
// //       }
// //
// //
// //       Get.to(() => const Verification());
// //
// //
// //
// //     }
// //   }catch(e){
// //     print(e.toString());
// //   }
// //
// //
// // }
//
// // void clearText() {
// //   s.clear();
// // }
// }




import 'dart:convert';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/AuthController.dart';
import 'package:jsp/controller/LoginController.dart';

import 'package:http/http.dart' as http;
import 'package:jsp/screens/OTPVerificationScree.dart';
import 'package:jsp/screens/RegistrationForm.dart';

import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import 'MembershipForm.dart';





class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);


  @override
  State<Loginscreen> createState() => _HomePageState();




}

class _HomePageState extends State<Loginscreen> {
  // show the password or not



 // final userdata = GetStorage();






  bool rememberMe = false;

  // this bool will check rememberMe is checked
  bool showErrorMessage = false;



  final formKey = GlobalKey<FormState>(); //key for form

  bool? check1 = false;

  bool valuefirst = false;
  bool valuesecond = false;

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Ultraclap') ,backgroundColor: AppColor.appColor,
        // ),




        body:


        GetBuilder<Authcontroller>(
          init: Authcontroller(),
          builder: (s) =>


              Container(


                color: Colors.white,


                child: Center(




                  child: Form(



                    key: formKey,
                    child:
                    Column(




                     crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,


                      children: [



                       //
                       //  Container(
                       //
                       //    height: 200,
                       //    alignment: Alignment.center,
                       //  decoration: BoxDecoration(
                       //  color: AppColor.appColor,
                       //  borderRadius: BorderRadius.only(     bottomLeft: Radius.circular(height * 4),  // Top-left corner radius
                       // //  bottomRight: Radius.circular( height * 1.2),
                       //
                       //  )
                       //
                       //
                       //  )
                       //  )




                    Stack(
                    children: [
                    Container(
                    //  color:Colors.pink,

                    child: ClipPath(
                        clipper: MyCustomClipper(),
                    child:

                    Container(
                      height: height*6.7,
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

                  top: height*4,
                  left: height*3.4,

                ),

                ],
              ),













                        SizedBox(

                          height: 40,

                        ),



                        //
                        // Container(
                        //
                        //   //  height: 50,width: 250,
                        //
                        //     margin: EdgeInsets.only( bottom: 20),
                        //
                        //     child: Image.asset("assets/images/app_icon.png",height: 100,)
                        //
                        //
                        // ),





                    Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: Center(
                                        child: const Text('Welcome back!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20,
                                            )),
                                      ),
                                    ),
                                    Center(
                                      child: AutoSizeText(
                                        'login to Continue',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),





                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),


                           child: Column(
                            children: [


                              // Container(
                              //   ///   color: Color(0XFFe8f0fe),
                              //
                              //
                              //   margin: EdgeInsetsDirectional.only(bottom: 30,top: 10),
                              //   child: Center(
                              //
                              //     child: TextFormField(
                              //
                              //       //  isDense:true ,
                              //
                              //       validator: (value){
                              //         if(value!.isEmpty){
                              //           return "Please fill the field";
                              //         }else{
                              //
                              //
                              //           return null;
                              //
                              //         }
                              //       },
                              //
                              //
                              //       controller: s.mobileno_controller,
                              //       cursorColor:  Colors.black,
                              //
                              //
                              //       style: TextStyle(color: Colors.black  ),
                              //
                              //
                              //
                              //       inputFormatters: [
                              //
                              //         LengthLimitingTextInputFormatter(10)
                              //
                              //       ],
                              //
                              //
                              //       keyboardType: TextInputType.number,
                              //
                              //
                              //       decoration: InputDecoration(
                              //
                              //
                              //         fillColor: Color(0XFFe8f0fe),
                              //         filled: true,
                              //         contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                              //
                              //         // contentPadding:  EdgeInsets.all(),
                              //
                              //         labelText: 'Mobile Number',
                              //         hintText: 'Mobile Number' ,
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //         prefixIcon:
                              //         Padding(
                              //
                              //           padding: const EdgeInsets.only( right:10),
                              //
                              //
                              //
                              //           child: Material(
                              //             elevation: 0,
                              //             color: AppColor.appColor,
                              //             shadowColor: AppColor.appColor,
                              //
                              //
                              //
                              //             borderRadius: BorderRadius.only(
                              //
                              //               //   topRight: Radius.circular(8.0),
                              //
                              //               //    bottomRight: Radius.circular(8.0),
                              //                 bottomLeft: Radius.circular(8.0),
                              //
                              //                 topLeft: Radius.circular(8.0)
                              //
                              //
                              //
                              //
                              //
                              //
                              //             ),
                              //
                              //
                              //
                              //
                              //
                              //             child: Icon(Icons.call, color: Colors.white),
                              //
                              //           ),
                              //         ),
                              //
                              //
                              //         prefixIconConstraints: BoxConstraints(
                              //           minWidth: 60,
                              //
                              //
                              //           minHeight: 50,
                              //         ),
                              //
                              //
                              //
                              //         // prefixIconConstraints: BoxConstraints(
                              //         //     minWidth: 100,
                              //         //   ),
                              //
                              //         //
                              //         // //label style
                              //         // prefixIcon:  Icon(Icons.phone_android_outlined,),
                              //
                              //
                              //         border: OutlineInputBorder(
                              //
                              //
                              //           borderRadius: BorderRadius.circular(6.0),
                              //         )
                              //         ,
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
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              //
                              //











                              Container(

                                   margin: EdgeInsetsDirectional.only(bottom: 30,top: 10),

                              child: _buildTextField(
                                  controller: s.mobileController,
                                  label: 'Enter Mobile no.',
                                  icon: Icons.credit_card,
                                  validator: (value) => value!.isEmpty ? 'Please enter the mobile number ' : null,
                                ),
                              ),





                              // Center(
                              //   child: TextFormField(
                              //
                              //
                              //     validator: (value){
                              //       if(value!.isEmpty){
                              //         //allow upper and lower case alphabets and space
                              //         return "Please fill the field";
                              //       }else{
                              //         return null;
                              //       }
                              //     },
                              //
                              //
                              //
                              //   //  controller: s.,
                              //     cursorColor:  Colors.black,
                              //
                              //
                              //     style: TextStyle(color: Colors.black  ),
                              //
                              //
                              //
                              //
                              //     obscureText: _isObscure,
                              //     decoration: InputDecoration(
                              //
                              //
                              //
                              //         contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //         prefixIconConstraints: BoxConstraints(
                              //           minWidth: 60,
                              //
                              //
                              //           minHeight: 50,
                              //         ),
                              //
                              //
                              //
                              //
                              //         //   controller: passwordController,
                              //
                              //         fillColor: Color(0XFFe8f0fe),
                              //         filled: true,
                              //
                              //
                              //
                              //         labelStyle: TextStyle(fontSize: 17 ,fontWeight: FontWeight.w400),
                              //
                              //
                              //         hintText: 'Password',
                              //
                              //
                              //
                              //         labelText: 'Password',
                              //
                              //
                              //
                              //
                              //         //
                              //         // prefixIcon: Icon(Icons.lock),
                              //
                              //
                              //         prefixIcon:    Padding(
                              //
                              //           padding: const EdgeInsets.only( right:10),
                              //
                              //
                              //
                              //           child: Material(
                              //             elevation: 0,
                              //             color: Color(0XFF24a9e2),
                              //             shadowColor: Color(0XFF24a9e2),
                              //
                              //
                              //
                              //             // borderRadius: OutlineInputBorder(
                              //             //
                              //             //
                              //             //   borderRadius: BorderRadius.circular(8.0),
                              //             // )
                              //             // ,
                              //
                              //             // borderRadius: OutlineInputBorder(
                              //             //
                              //             //   borderRadius: BorderRadius.circular(8),
                              //             // ),
                              //             //
                              //
                              //             borderRadius: BorderRadius.only(
                              //
                              //               //   topRight: Radius.circular(8.0),
                              //
                              //               //    bottomRight: Radius.circular(8.0),
                              //                 bottomLeft: Radius.circular(8.0),
                              //
                              //                 topLeft: Radius.circular(8.0)
                              //
                              //
                              //
                              //
                              //
                              //
                              //             ),
                              //
                              //
                              //
                              //
                              //
                              //             child: Icon(Icons.lock, color: Colors.white),
                              //           ),
                              //         ),
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
                              //
                              //         border: OutlineInputBorder(
                              //
                              //
                              //
                              //
                              //
                              //           borderRadius: BorderRadius.circular(8.0),
                              //
                              //         ),
                              //
                              //         // this button is used to toggle the password visibility
                              //         suffixIcon: IconButton(
                              //             icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                              //             onPressed: () {
                              //               setState(() {
                              //                 _isObscure = !_isObscure;
                              //               });
                              //             })),
                              //   ),
                              //
                              // ),








                              // Row(
                              //
                              //   //   crossAxisAlignment: CrossAxisAlignment.start,
                              //
                              //
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //
                              //
                              //   children: [
                              //
                              //
                              //
                              //     Container
                              //
                              //       (
                              //
                              //       alignment:   Alignment.centerLeft,
                              //
                              //       child: Checkbox( //only chec
                              //
                              //
                              //
                              //           focusColor: Colors.lightBlue,
                              //           activeColor: Color(0XFF24a9e2),
                              //           value: rememberMe,
                              //           onChanged: (newValue) {
                              //             setState(() => rememberMe = newValue!);
                              //           }
                              //
                              //
                              //
                              //
                              //         // k box
                              //         //   checkColor: Colors.cyan,
                              //         //
                              //         //   value: check1, //unchecked
                              //         //   onChanged: (bool? value){
                              //         //     //value returned when checkbox is clicked
                              //         //     setState(() {
                              //         //       check1 = value;
                              //         //     });
                              //         //  }
                              //       ),
                              //     )
                              //
                              //
                              //     ,
                              //
                              //
                              //
                              //
                              //     Container
                              //       (
                              //       alignment: Alignment.centerLeft,
                              //       child: Text("Save credentials",style:  TextStyle(
                              //           fontWeight: FontWeight.bold,color:  Colors.black ,
                              //
                              //           fontSize: 14
                              //       ),),
                              //     )
                              //
                              //     ,
                              //
                              //     // Expanded(
                              //     //
                              //     //   flex: 4,
                              //     //   child: Container(
                              //     //
                              //     //     margin: EdgeInsetsDirectional.only(start: 10),
                              //     //     child:
                              //     //     Text
                              //     //
                              //     //       ("terms and condition",style:  TextStyle(
                              //     //         fontWeight: FontWeight.bold,color:  Colors.red ,
                              //     //
                              //     //         fontSize: 13
                              //     //
                              //     //     ),),
                              //     //   ),
                              //     // )
                              //     //
                              //
                              //   ],
                              //
                              // )

                                                   //   ,
                              // showErrorMessage ?
                              //
                              // Container(
                              //     margin: EdgeInsetsDirectional.only(bottom: 20),
                              //     decoration: BoxDecoration(
                              //         color: Colors.red,
                              //         borderRadius: BorderRadius.circular(80.0)
                              //     ),
                              //     child: Padding(
                              //         padding: EdgeInsets.all(10.0),
                              //         child: Text('Please accept the terms and conditions...')
                              //     )
                              // ):

                                            /////// new lin
                              Container(


                                child: SizedBox(

                                  height: 10,

                                ),


                              ),





                              s. isLoading.value ?

                              Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor)):

                              Container(

                                width: double.infinity,
                                margin: EdgeInsetsDirectional.only(bottom: 1,top: 10),
                                child:  ElevatedButton(

                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:  AppColor.appColor,
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),



                                    onPressed: (){





                                     // Get.to(OTPVerificationScreen());

                                      if(formKey.currentState!.validate()){


                                         s. login_fun();




                                      }
                                    },
                                    child: Text("Login",

                                      style: Newtextstyle.normaNoSpacinglopenSans(Colors.white,height*.5),
                                    )
                                ),

                              ),
                            ],
                          ),
                        ),









                        InkWell(

                          onTap: ()

                          {
                                         //        Navigator.push(context, MaterialPageRoute(builder: (context)=>Register_view()));


                            // Get.to(()=>Otp());



                          },
                          child: Container(

                            margin: EdgeInsets.only(top: 15),
                            child: Row(

                              // crossAxisAlignment: CrossAxisAlignment.start,



                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              //mainAxisAlignment: MainAxisAlignment.spaceAround,


                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container
                                    (
                                    alignment: Alignment.centerRight,

                                    child: Text("Don't have an account? ",style:  TextStyle(
                                        fontWeight: FontWeight.bold,color:  Colors.black ,

                                        fontSize: 14
                                    ),),
                                  ),
                                )

                                ,

                                Expanded(


                                  flex: 3,
                                  child: Container(

                                    alignment: Alignment.centerLeft,

                                    // margin: EdgeInsetsDirectional.only(start: 10),
                                    child:
                                    GestureDetector(
                                      onTap: (){


                                        Get.to(RegistrationForm());


                                      //  Get.offAll(() => MembershipForm());

                                      },
                                      child: Text

                                        ("Register",style:  TextStyle(
                                          fontWeight: FontWeight.bold,color:  Color(0XFF24a9e2) ,

                                          fontSize: 13

                                      ),),
                                    ),
                                  ),
                                )


                              ],

                            ),
                          ),
                        )















                      ],
                    ),
                  ),
                ),
              ),

        )

    );
  }









  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        // labelText: label,
        hintText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0,),
        fillColor: Color(0XFFe8f0fe),
        filled: true,
        prefixIcon:
        maxLines==1?

        //Icon(icon),

        Padding(
          padding: const EdgeInsets.only( right:10,left: 1),
          child: Material(
            elevation: 0,
            color: AppColor.appColor,
            shadowColor: AppColor.appColor,
            borderRadius: BorderRadius.only(

              //   topRight: Radius.circular(8.0),
              //    bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(5.0),
                topLeft: Radius.circular(5.0)
            ),
            child: Icon(icon, color: Colors.white),

          ),
        ):SizedBox(),


        prefixIconConstraints: BoxConstraints(
          minWidth: 60,
          minHeight: 50,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        )
        ,
        //border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,



    );
  }





}





class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double offset = 90.0;

    Path path = Path();
    path.lineTo(0, height - offset);




//     path.quadraticBezierTo(
//       width / 4, height, // Control point
//       width / 2, height - offset, // End point
//     );
    path.quadraticBezierTo(
      1 * width / 4, height - ( 2  *offset), // Control point
      width, height - offset, // End point
    );
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
