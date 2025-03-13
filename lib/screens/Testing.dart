// //
// // import 'package:flutter/material.dart';
// // import 'package:jsp/Utils/AppColors.dart';
// //
// // import '../Utils/NewTextstyle.dart';
// //
// // class Testing extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: BannerScreen(),
// //     );
// //   }
// // }
// //
// // class BannerScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //
// //
// //     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
// //     double height = width * 0.4; // Maintain aspect ratio
// //
// //
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //
// //       body: SingleChildScrollView(
// //
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             // Banner Section
// //             Stack(
// //               children: [
// //                 // Banner Image
// //                 Container(
// //                   width: double.infinity,
// //                   height: height * 10.4, // Adjust the height as needed
// //                   decoration: BoxDecoration(
// //                     image: DecorationImage(
// //                       image: AssetImage('assets/images/banner.png'), // Your uploaded banner
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //
// //                 // Overlay Text
// //                 Align(
// //
// //                   alignment: Alignment.center,
// //
// //                   //   top: screenWidth * 0.05,
// //                 // //  left: screenWidth * 0.05,
// //                 //   bottom: screenHeight * 0.02,
// //                   child: Container(
// //
// //                     padding: EdgeInsets.only(top: height*.5),
// //
// //                     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //
// //                         Container(
// //                           height: height*1.4,
// //                           alignment: Alignment.center,
// //                           child: Text(
// //                             textAlign: TextAlign.start,
// //
// //                             "जन सहमति पार्टी",
// //                             style: Newtextstyle.normalopenSans(Colors.white,height*1.2),),
// //
// //
// //
// //                   ),
// //                         Container(
// //                           alignment: Alignment.center,
// //                           child: Text(
// //                             '"जनता की सहमति, लोकतंत्र की मजबूती"',
// //
// //                             style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.5),
// //                           textAlign: TextAlign.start,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //
// //
// //                 Positioned(
// //
// //                   top: height*6,
// //                   right: height*.4,
// //
// //
// //                   //height: screenHeight/2,
// //                 //  top: 30,
// //                  // bottom: 0,
// //
// //                   child: Text(
// //                     '" बिहार के लिए,\n           हर कदम सही! "',
// //                     textAlign: TextAlign.center,
// //                     style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.7),
// //                   ),
// //                  ),
// //
// //
// //               ],
// //             ),
// //
// //             // Content Section
// //             Column(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   "आप का स्वागत है",
// //                   style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.7),
// //
// //                 ),
// //                 SizedBox(height: height * 0.4),
// //                 Text(
// //                   "मोबाइल नंबर दर्ज करे",
// //                   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.5),
// //
// //                 ),
// //
// //                 // Mobile Number Input
// //                 //SizedBox(height: height * 0.6),
// //                 Container(
// //
// //                   margin: EdgeInsets.all( height*.5),
// //
// //                   height: height * 1.2,
// //                   decoration: BoxDecoration(
// //                     color: AppColor.appColor,
// //
// //                     borderRadius: BorderRadius.circular(10),
// //                     border: Border.all(color: Colors.orange, width: 2),
// //                   ),
// //                   child: Row(
// //                     children: [
// //                       Padding(
// //
// //                         padding: EdgeInsets.symmetric(horizontal: height*.5),
// //                         child: Text(
// //                           "+91 |",
// //                           style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.5),
// //
// //
// //
// //
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: TextField(
// //
// //                           style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.4),
// //
// //                           keyboardType: TextInputType.phone,
// //                           decoration: InputDecoration(
// //                             hintText: "**********",
// //                             border: InputBorder.none,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //
// //                 // Proceed Button
// //                 SizedBox(height: height * 0.8),
// //                 ElevatedButton(
// //                   onPressed: () {},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.grey.shade200,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(25),
// //                     ),
// //                     side: BorderSide(color: AppColor.appColor, width: 2.5),
// //                     padding: EdgeInsets.symmetric(
// //                       horizontal: height * .7,
// //                       vertical: height * .2,
// //                     ),
// //                   ),
// //                   child: Text(
// //                     "आगे बढ़े",
// //
// //
// //
// //
// //                     style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.6),
// //
// //
// //
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
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
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// class UploadPhotoExample extends StatefulWidget {
//   @override
//   _UploadPhotoExampleState createState() => _UploadPhotoExampleState();
// }
//
// class _UploadPhotoExampleState extends State<UploadPhotoExample> {
//   File? _image; // To store the selected image
//   final ImagePicker _picker = ImagePicker();
//
//   // Function to pick image from gallery or camera
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   // Function to upload image to the server
//   Future<void> _uploadImage() async {
//     if (_image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please select an image first!")),
//       );
//       return;
//     }
//
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('https://example.com/upload'), // Replace with your server URL
//       );
//
//       request.files.add(await http.MultipartFile.fromPath(
//         'file', // Field name expected by the server
//         _image!.path,
//       ));
//
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Upload successful!")),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Upload failed!")),
//         );
//       }
//     } catch (e) {
//       print(e);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("An error occurred!")),
//       );
//     }
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Photo Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Show selected image preview
//             if (_image != null)
//               Image.file(
//                 _image!,
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             SizedBox(height: 20),
//             // Pick Image Button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _pickImage(ImageSource.camera),
//                   child: Text("Pick from Camera"),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _pickImage(ImageSource.gallery),
//                   child: Text("Pick from Gallery"),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Upload Button
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: Text("Upload Photo"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//























//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:jsp/controller/DashboardScreenController.dart';
// import 'package:video_player/video_player.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/Preference.dart';
// import '../Utils/custom_widgets.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   final Dashboardscreencontroller _controller = Dashboardscreencontroller();
//   late List<VideoPlayerController> _controllers;
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // // Initialize controllers for each video URL
//     // _controllers = videoUrls
//     //     .map((url) => VideoPlayerController.network(url)..initialize())
//     //     .toList();
//
//
//
//   }
//
//   @override
//   void dispose() {
//     // Dispose of all controllers
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         elevation: 0,
//         leading: Icon(Icons.menu, color: Colors.white),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'जन सहमति पार्टी',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               '"जनता की सहमति, लोकतंत्र की मजबूती"',
//               style: TextStyle(fontSize: 12),
//             ),
//           ],
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);
//               print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
//             },
//             child: Container(
//               margin: const EdgeInsets.only(right: 15),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.currency_rupee, color: Colors.orange, size: 18),
//                   Text(
//                     'दान',
//                     style: TextStyle(color: Colors.orange, fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: GetBuilder<Dashboardscreencontroller>(
//           init: _controller,
//           builder: (s) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Stories Section
//               Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Text(
//                   'Stories',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               s.isLoading.value
//                   ? CustomWidgets.showCircularIndicator1(
//                   context, height * .9, AppColor.appColor)
//                   : SizedBox(
//                 height: 70,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: s.storiesResponse.value?.data?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 5),
//                       width: 60,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.orange, width: 2),
//                       ),
//                       child: Image.network(
//                         s.storiesResponse.value.data![index].name ?? "",
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Banner Section
//               Container(
//                 height: height * 4,
//                 width: double.infinity,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   elevation: 10,
//                   color: Colors.white,
//                   child: Obx(() {
//                     if (s.bannerCarouseResponse.value.data == null ||
//                         s.bannerCarouseResponse.value.data!.isEmpty) {
//                       return Center(child: Text('No data'));
//                     }
//                     return CarouselSlider(
//                       options: CarouselOptions(
//                         autoPlay: true,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         viewportFraction: 1,
//                       ),
//                       items: s.bannerCarouseResponse.value.data!.map((item) {
//                         return s.isLoading2.value
//                             ? Container(
//                           margin: EdgeInsets.only(top: height * .01),
//                           child: const Center(
//                             child: SizedBox(
//                               child: CircularProgressIndicator(
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ),
//                         )
//                             : Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: height * .03,
//                               vertical: height * .02),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                   height: height * .25,
//                                   width: double.infinity,
//                                   child: Image.network(
//                                     (item.name ?? ''),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                     );
//                   }),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Reels Section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//
//
//
//                       'Reel',
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'view all',
//                       style: TextStyle(color: Colors.orange),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//
//
//
//               s.isLoading2.value?
//               CustomWidgets.showCircularIndicator1(
//                   context, height * .9, AppColor.appColor)
//                   : s.reelsResponse.value.data!.isEmpty
//                   ? Center(child: Text('No videos available'))
//                   : ListView.builder(
//                 itemCount: s.reelsResponse.value.data?.length??0,
//                 itemBuilder: (context, index) {
//                   final video = s.reelsResponse.value.data![index];
//
//                   return VideoPlayerCard(videoUrl: video.name??"");
//                 },
//               ),
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
//               // News and Media Section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Text(
//                   'News and Media',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.all(5),
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.orange[100],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               'assets/news_image.png',
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               'भारत का कोई भी नागरिक जो 18 साल की उम्र से...',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 12),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.all(5),
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.orange[100],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               'assets/news_image.png',
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               'भारत का कोई भी नागरिक जो 18 साल की उम्र से...',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 12),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.donut_large), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.video_library), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//         ],
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.black,
//       ),
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
// class VideoPlayerCard extends StatefulWidget {
//   final String videoUrl;
//
//   VideoPlayerCard({required this.videoUrl});
//
//   @override
//   _VideoPlayerCardState createState() => _VideoPlayerCardState();
// }
//
// class _VideoPlayerCardState extends State<VideoPlayerCard> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(widget.videoUrl),
//     )..initialize().then((_) {
//       setState(() {}); // Update the UI once the video is initialized
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(10),
//       elevation: 5,
//       child: Column(
//         children: [
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(
//             height: 200,
//             color: Colors.black,
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: Icon(
//                   _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.stop),
//                 onPressed: () {
//                   setState(() {
//                     _controller.seekTo(Duration.zero);
//                     _controller.pause();
//                   });
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//







//
//
// import 'package:flutter/material.dart';
//
// class CustomMenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Row(
//         children: [
//           // Sidebar
//           Container(
//             width: MediaQuery.of(context).size.width * 0.35,
//             color: Colors.orange[100],
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // User Info Section
//                 Container(
//                   color: Colors.orange,
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundColor: Colors.white,
//                         child: Icon(Icons.person, size: 40, color: Colors.orange),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         "Ashish",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "+91 870031****",
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Menu Items
//                 Expanded(
//                   child: ListView(
//                     children: [
//                       _buildMenuItem(Icons.camera_alt, "सेल्फी पॉइंट"),
//                       _buildMenuItem(Icons.picture_as_pdf, "फ़्रीड"),
//                       _buildDropdownMenuItem(Icons.person, "कार्यकारीणी सदस्य", [
//                         "राष्ट्रीय कार्यकारीणी",
//                         "राज्य कार्यकारीणी",
//                         "सामान्य बैठकला कार्यकारीणी",
//                       ]),
//                       _buildMenuItem(Icons.event, "आयोजन"),
//                       _buildMenuItem(Icons.group, "सामान्य बैठक"),
//                       _buildMenuItem(Icons.bookmark, "सरकारी योजनाएं"),
//                       _buildMenuItem(Icons.schedule, "कार्यसूची"),
//                       _buildMenuItem(Icons.phone, "संपर्क करें"),
//                       Divider(),
//                       _buildMenuItem(Icons.logout, "लॉग आउट", isLogout: true),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Menu Item
//   Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
//     return ListTile(
//       leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 16,
//           color: isLogout ? Colors.red : Colors.black,
//         ),
//       ),
//       onTap: () {
//         // Handle menu item tap
//       },
//     );
//   }
//
//   // Dropdown Menu Item
//   Widget _buildDropdownMenuItem(IconData icon, String title, List<String> options) {
//     return ExpansionTile(
//       leading: Icon(icon, color: Colors.black),
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 16, color: Colors.black),
//       ),
//       children: options
//           .map((option) => Padding(
//         padding: const EdgeInsets.only(left: 16.0),
//         child: ListTile(
//           title: Text(
//             option,
//             style: TextStyle(fontSize: 14, color: Colors.black87),
//           ),
//           onTap: () {
//             // Handle submenu tap
//           },
//         ),
//       ))
//           .toList(),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: CustomMenuScreen(),
//   ));
// }



//
//
// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   String? selectedState;
//   String? selectedDistrict;
//
//   List<String> states = []; // Populate this from the State API
//   List<String> districts = []; // Populate based on selectedState from District API
//
//   @override
//   void initState() {
//     super.initState();
//     loadProfileData();
//   }
//
//   Future<void> loadProfileData() async {
//     // Simulate profile API response
//     Map<String, dynamic> profileResponse = {
//       "data": {
//         "state": "JAMMU & KASHMIR",
//         "city": "Kargil",
//           "state_id":1
//
//       },
//     };
//
//     // Set the default state and district from the profile
//     setState(() {
//       selectedState = profileResponse["data"]["state"];
//       selectedDistrict = profileResponse["data"]["city"];
//     });
//
//
//
//     // Fetch the list of states and districts
//     await fetchStates();
//     if (selectedState != null) {
//       await fetchDistricts(selectedState!);
//     }
//   }
//
//   Future<void> fetchStates() async {
//     // Replace with API call to fetch states
//     setState(() {
//       states = ["JAMMU & KASHMIR", "UTTAR PRADESH", "BIHAR"]; // Example states
//     });
//   }
//
//   Future<void> fetchDistricts(String state) async {
//     // Replace with API call to fetch districts based on state
//     List<String> fetchedDistricts = [];
//     if (state == "JAMMU & KASHMIR") {
//       fetchedDistricts = ["Kargil", "Leh"];
//     } else if (state == "UTTAR PRADESH") {
//       fetchedDistricts = ["Lucknow", "Kanpur", "Varanasi"];
//     } else if (state == "BIHAR") {
//       fetchedDistricts = ["Patna", "Gaya", "Darbhanga"];
//     }
//
//     setState(() {
//       districts = fetchedDistricts;
//
//       // Ensure the district dropdown is set to the profile's city
//       if (!districts.contains(selectedDistrict)) {
//         selectedDistrict = null; // Reset if profile city is not in fetched districts
//       }
//     });
//   }
//
//   Future<void> updateProfile() async {
//     // Replace with API call to update the profile
//     print("Updated State: $selectedState");
//     print("Updated District: $selectedDistrict");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Update Profile")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("State"),
//             DropdownButton<String>(
//               isExpanded: true,
//               value: selectedState,
//               onChanged: (value) {
//                 setState(() {
//                   selectedState = value;
//                   selectedDistrict = null; // Reset district when state changes
//                 });
//                 fetchDistricts(value!);
//               },
//               items: states
//                   .map((state) =>
//                   DropdownMenuItem(value: state, child: Text(state)))
//                   .toList(),
//             ),
//             SizedBox(height: 16),
//             Text("District"),
//             DropdownButton<String>(
//               isExpanded: true,
//               value: selectedDistrict,
//               onChanged: (value) {
//                 setState(() {
//                   selectedDistrict = value;
//                 });
//               },
//               items: districts
//                   .map((district) =>
//                   DropdownMenuItem(value: district, child: Text(district)))
//                   .toList(),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: updateProfile,
//               child: Text("Update Profile"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../controller/UserProfileController.dart';
import '../models/DistrictResponse.dart';
import '../models/StateResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<ProfileScreen> {

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



                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Title (e.g., जन्म तिथि)
                              SizedBox(height: 10),
                              // Date Picker UI
                            ],
                          ),
                        ),

                        SizedBox(height: 20),

                        // Input Fields Section
                        _buildInputSection(height,s),

                        // Submit Button
                        SizedBox(height: 20),
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

        _buildDropdownFieldDist('राज्य', height,s ),
        _buildDropdownField('जिला', height, s,),


      ],
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


}



