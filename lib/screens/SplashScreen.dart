//
// import 'package:flutter/material.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/screens/DashboardScreen.dart';
// import 'dart:async';
//
// import 'package:jsp/screens/LoginScreen.dart';
//
// import '../Utils/Preference.dart';
//
// class PartySplashScreen extends StatefulWidget {
//   @override
//   _PartySplashScreenState createState() => _PartySplashScreenState();
// }
//
// class _PartySplashScreenState extends State<PartySplashScreen> {
//   double progressValue = 0.0; // Start with 0 progress
//   bool isFirstTimeUser = true;
//
//   @override
//   void initState() {
//     super.initState();
//     isFirstTime();
//     startProgressAnimation();
//   }
//
//   Future<void> isFirstTime() async {
//     isFirstTimeUser = Preference.shared?.getBool(Preference.IS_USER_FIRSTTIME) ?? true;
//     print("isFirstTime: $isFirstTimeUser");
//   }
//
//   void startProgressAnimation() {
//     Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {
//         if (progressValue < 1.0) {
//           progressValue += 0.04; // Increment progress (4% each step)
//         } else {
//           timer.cancel(); // Stop the timer once progress completes
//           navigateToNextScreen();
//         }
//       });
//     });
//   }
//
//   void navigateToNextScreen() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//         isFirstTimeUser ? Loginscreen() : DashboardScreen(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//       backgroundColor: AppColor.appColor, // Orange background color
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: height * 2),
//               Container(
//                 width: double.infinity,
//                 child: Container(
//                   padding: EdgeInsets.all(height * .6),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: RadialGradient(
//                       colors: [
//                         Color(0xFFFFA726),
//                         Color(0xFFFFB74D),
//                         Color(0xFFFFCC80),
//                         Color(0xFFFFCC80),
//                       ],
//                       stops: [0.3, 0.6, 0.8, 1.0],
//                     ),
//                   ),
//                   child: Container(
//                     padding: EdgeInsets.all(height * .6),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: RadialGradient(
//                         colors: [
//                           Color(0xFFFFA726),
//                           Color(0xFFFFB74D),
//                           Color(0xFFFFCC80),
//                           Colors.white,
//                         ],
//                         stops: [0.3, 0.6, 0.8, 1.0],
//                       ),
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.all(height * .6),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: RadialGradient(
//                           colors: [
//                             Color(0xFFFFA726),
//                             Color(0xFFFFB74D),
//                             Color(0xFFFFCC80),
//                             Color(0xFFD5C1A4),
//                           ],
//                           stops: [0.3, 0.6, 0.8, 1.0],
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(height * .2),
//                         child: CircleAvatar(
//                           radius: height * 3.3,
//                           backgroundImage: AssetImage('assets/images/app_icon.png'), // Your logo image
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: height * 2.5),
//               // Linear progress bar
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.8, // Responsive width
//                 child: LinearProgressIndicator(
//                   value: progressValue, // Progress value (0.0 to 1.0)
//                   backgroundColor: Colors.black,
//                   color: Colors.white,
//                   minHeight: 5, // Progress bar height
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
/////////////////////




import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/screens/DashboardScreen.dart';
import 'dart:async';

import 'package:jsp/screens/LoginScreen.dart';

import '../Utils/Preference.dart';
import '../Utils/custom_widgets.dart';
import '../controller/LoginController.dart';

class PartySplashScreen extends StatefulWidget {
  @override
  _PartySplashScreenState createState() => _PartySplashScreenState();
}

class _PartySplashScreenState extends State<PartySplashScreen> {
  double progressValue = 0.0; // Start with 0 progress
  bool isFirstTimeUser = true;

  @override
  void initState() {
    super.initState();
    isFirstTime();
    startProgressAnimation();
  }

  Future<void> isFirstTime() async {
    isFirstTimeUser = Preference.shared?.getBool(Preference.IS_USER_FIRSTTIME) ?? true;
    print("isFirstTime: $isFirstTimeUser");
  }

  void startProgressAnimation() {
    Timer.periodic(Duration(microseconds: 100), (timer) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.04; // Increment progress (4% each step)
        } else {
          timer.cancel(); // Stop the timer once progress completes
          navigateToNextScreen();
        }
      });
    });
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>

        isFirstTimeUser ? Loginscreen() : DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
        backgroundColor: AppColor.whitecolor,
        // Orange background color
        body: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: height*4),


            alignment: Alignment.center,

             height: height*11,//


         //   MediaQuery.of(context).size.height,

            child:





            Image.asset(
              "assets/images/app_icon.png",

            //  width: double.infinity,
                 height: height*13,
              fit: BoxFit.contain,


            ),




            //  Image.network(
            //
            //
            //    'https://pixelwise.one/rems/${s.sliderResponse.value.data?.splashScreen?.first.imgPath}/${s.sliderResponse.value.data?.splashScreen?.first.sliderImg}',
            //
            //    width: double.infinity,
            // //   height: height*13,
            //    fit: BoxFit.cover,
            //
            //
            //  ),


          ),
        )
    );
  }
}

