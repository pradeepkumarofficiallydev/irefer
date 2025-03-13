// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/NewTextstyle.dart';
// import '../controller/TaskListScreenController.dart';
//
// class Agendasingledatascreen extends StatelessWidget {
//   // Sample API response data
//   final Map<String, dynamic> apiResponse = {
//     "data": [
//       {
//         "id": 2,
//         "title": "लघु ʁसɝचाई काय",
//         "description": "भारत का कोई भी नागɼरक जो 18 साल कɛ उ­ से Ł ादा है\nऔर ɾकसी अƯ राजनैɾतक दल का सदɐ",
//         "image": "https://jsp.socialpost.co.in/public/images/todolist/1734782271.jpg",
//         "status": 1,
//         "created_at": "2024-12-21 11:42:13",
//         "updated_at": "2024-12-21 11:57:51"
//       }
//     ],
//     "success": true,
//     "status": 200
//   };
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.orange,
//       //   elevation: 0,
//       //   leading: IconButton(
//       //     icon: Icon(Icons.arrow_back, color: Colors.black),
//       //     onPressed: () {
//       //       Navigator.pop(context);
//       //     },
//       //   ),
//       //   title: Text(
//       //     "सामान्य बैठक विवरण",
//       //     style: TextStyle(
//       //       fontSize: 20,
//       //       fontWeight: FontWeight.bold,
//       //       color: Colors.black,
//       //     ),
//       //   ),
//       //   centerTitle: true,
//       // ),
//       body: SingleChildScrollView(
//         child:
//
//
//
//         GetBuilder<AgendaScreenController>(
//         init: AgendaScreenController(),
//     builder: (s) =>
//
//
//     Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//
//
//             Container(
//               padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
//               decoration:  BoxDecoration(
//                 color: AppColor.appColor,
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(height*1.2),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //SizedBox(height: height * 1.2,width: height * .2 ,),
//
//
//
//
//
//                   Container(
//
//                     padding: EdgeInsets.symmetric(horizontal: height*.2),
//
//
//                     child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//
//                       children: [
//
//
//
//
//                         GestureDetector(onTap: (){
//
//                           Get.back();
//
//
//
//
//
//
//                         },
//
//
//                           child: Container(
//                               alignment: Alignment.center,
//                               child: Icon(Icons.arrow_back_ios_rounded)
//
//
//
//
//
//
//
//
//                           ),
//                         ),
//
//                         SizedBox(width: height * 1),
//
//
//
//                         Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             'संपर्क करें',
//
//                             style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//
//
//
//
//
//
//
//                         //
//                         //
//                         // GestureDetector(
//                         //   onTap: ()
//                         //   {
//                         //
//                         //
//                         //
//                         //
//                         //     Get.to(PosterCreationScreen());
//                         //
//                         //   },
//                         //   child: Container(
//                         //     height: height*1,
//                         //     alignment: Alignment.center,
//                         //     child: Image.asset(
//                         //
//                         //         "assets/images/addition.png"
//                         //
//                         //
//                         //     ),
//                         //   ),
//                         // )
//
//
//                       ],
//                     ),
//                   ),
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
//                   //    SizedBox(height: height * .4),
//                 ],
//               ),
//             ),
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
//             // Image Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.network(
//                       data['image'], // Dynamically load the image from API
//                       width: double.infinity,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: Colors.orange.withOpacity(0.4),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Title
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 data['title'], // Dynamically load the title from API
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//
//             // Description
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 data['description'], // Dynamically load the description from API
//                 style: TextStyle(fontSize: 16, height: 1.5),
//               ),
//             ),
//           ],
//         ),
//         )
//       ),
//     );
//   }
// }






















import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../models/GetTaskListRespnse.dart';

class Agendasingledatascreen extends StatefulWidget {

  final Data? data;
  const Agendasingledatascreen({required this.data});


  @override
  _MeetingDetailsScreenState createState() => _MeetingDetailsScreenState();
}

class _MeetingDetailsScreenState extends State<Agendasingledatascreen> {


  @override
  void initState() {
    super.initState();


  }




  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(

      backgroundColor: AppColor.whitecolor,

      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "सामान्य बैठक विवरण",
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
       body

       //isLoading
      //     ? Center(
      //   child: CircularProgressIndicator(
      //     color: Colors.orange,
      //   ),
      // )
      //
      //
           : SafeArea(
             child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
             
             
             
             
             
             
             
             
             
             
             
              Container(
                padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
                decoration:  BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(height*1.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: height * 1.2,width: height * .2 ,),
             
             
             
             
             
                    Container(
             
                      padding: EdgeInsets.symmetric(horizontal: height*.2),
             
             
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
             
                        children: [
             
             
             
             
                          GestureDetector(onTap: (){
             
                            Get.back();
             
             
             
             
             
             
                          },
             
             
                            child: Container(
                                alignment: Alignment.center,
                                child: Icon(Icons.arrow_back_ios_rounded)
             
             
             
             
             
             
             
             
                            ),
                          ),
             
                          SizedBox(width: height * 1),
             
             
             
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'सामान्य बैठक विवरण',
             
                              style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
                              textAlign: TextAlign.start,
                            ),
                          ),
             
             
             
             
             
             
             
                          //
                          //
                          // GestureDetector(
                          //   onTap: ()
                          //   {
                          //
                          //
                          //
                          //
                          //     Get.to(PosterCreationScreen());
                          //
                          //   },
                          //   child: Container(
                          //     height: height*1,
                          //     alignment: Alignment.center,
                          //     child: Image.asset(
                          //
                          //         "assets/images/addition.png"
                          //
                          //
                          //     ),
                          //   ),
                          // )
             
             
                        ],
                      ),
                    ),
             
             
             
             
             
             
             
             
             
             
             
                    //    SizedBox(height: height * .4),
                  ],
                ),
              ),
             
             
             
             
             
              // Image Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.data?.image??"", // Dynamically load the image from API
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orange.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
             
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.data?.title??"", // Dynamically load the title from API
                  style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.6),
             
             
                ),
              ),
             
              // Description
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.data?.description??"", // Dynamically load the description from API
                  style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.38),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,              ),
              ),
                       ],
                     ),
                   ),
           ),
    );
  }
}
