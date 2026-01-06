import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/dashboard_controller.dart';
import 'package:jsp/screens/profile_screen.dart';

import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import 'emi_calculator_screen.dart';
import 'leads/lead_status_screen.dart';
import 'leads/create_leads_screen.dart';
class MenuItem {
  final String title;
  final IconData icon;
  final bool isNew;
  MenuItem(this.title, this.icon, {this.isNew = false});
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {



  final List<Map<String, dynamic>> leads = [
    {
      "first_name": "Deepak",
      "last_name": "Singh",
      "loan_type": "Home Loan",
      "required_amount": 100000,
      "status": "Follow Ups",
      "commission_status": "approved",
      "commission_amount": 1000
    },
    {
      "first_name": "John",
      "last_name": "Doe",
      "loan_type": "Home Loan",
      "required_amount": 500000,
      "status": "New Leads",
      "commission_status": "pending",
      "commission_amount": 1000
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    double fontSize = height * 0.5; // Responsive font size
    double iconSize = height * 0.6; // Responsive icon size
    double paddingSize = height * 0.4; // Responsive padding




    final List<MenuItem> menuItems = [
      MenuItem("EMI Calculator", Icons.calculate),
      MenuItem("Offer Calculator", Icons.home, isNew: true),
      MenuItem("Payout Calculator", Icons.currency_rupee),





      // MenuItem("Support", Icons.headset_mic_outlined),
      // MenuItem("Tools", Icons.build_outlined),
      // MenuItem("Academy", Icons.school_outlined),
      // MenuItem("My Offers", Icons.card_giftcard_outlined),
      // MenuItem("Leaderboard", Icons.emoji_events_outlined),
    ];









    double totalApproved = leads
        .where((l) => l["commission_status"] == "approved")
        .fold<double>(0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());

    double totalPending = leads
        .where((l) => l["commission_status"] == "pending")
        .fold<double>(0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());





    return Scaffold(
      //  backgroundColor: Colors.white,

        backgroundColor: const Color(0xFFF5F6FA),


        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.appColor, // Replace with AppColor.appColor
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Primelending",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [


                    Icon(Icons.notifications, color: Colors.white, size: iconSize),
                    SizedBox(width: paddingSize),
                    InkWell(
                      onTap: (){


                        Get.to(ProfileScreen());
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: iconSize / 2,
                        child: Text("P", style: TextStyle(fontSize: fontSize * 0.7)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body:
        GetBuilder<Dashboardscreencontroller>(
          init: Dashboardscreencontroller(),
          builder: (s) =>
              Padding(
                padding: EdgeInsets.all(paddingSize),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      // TextField(
                      //   decoration: InputDecoration(
                      //     hintText: "Search by keyword",
                      //
                      //
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'Maine',
                      //     ),
                      //
                      //
                      //
                      //
                      //     prefixIcon: Icon(Icons.search, color: Colors.blue, size: iconSize),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(paddingSize * 2),
                      //       borderSide: BorderSide(color: Colors.grey.shade300),
                      //     ),
                      //     filled: true,
                      //     fillColor: Colors.grey.shade200,
                      //     contentPadding: EdgeInsets.symmetric(vertical: paddingSize),
                      //   ),
                      //   style: TextStyle(fontSize: fontSize * 0.7),
                      // ),
                      SizedBox(height: height * 0.6),

                      // Banner Placeholder
                      s.isLoading2.value ?

                      Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor)):




                       CarouselSlider(
                        items: s.imageUrls.map((url) {
                          return Image.network(

                            url,  // Now it contains the complete URL
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100),
                          );
                        }).toList(),
                         options: CarouselOptions(
                          height: height*4,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          viewportFraction: 1.0,

                           onPageChanged: (index, reason) {




                             // productDetailController.changeImage(index);
                          },
                        ),
                                             ),





                      SizedBox(height: height * 0.6),


                      Text("My Earning", style: TextStyle(
                          fontFamily: 'Maine',
                          fontSize: fontSize*.8, fontWeight: FontWeight.bold)),


                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(



                              child: _summaryCard("Approved", double.parse(s.getEarningResponse.value.data?.totalApprovedAmount.toString()??'0'), Icons.check_circle, Colors.green),
                            ),

                            const SizedBox(width: 12),
                            Expanded(
                              child: _summaryCard("Pending", double.parse (s.getEarningResponse.value.data?.totalPendingAmount.toString()?? '0'), Icons.hourglass_bottom, Colors.orange),
                            ),
                          ],
                        ),
                      ),









                      // // KYC Rejection Box
                      // Container(
                      //   padding: EdgeInsets.all(paddingSize),
                      //   decoration: BoxDecoration(
                      //     color: Colors.orange.shade100,
                      //     borderRadius: BorderRadius.circular(paddingSize),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       CircleAvatar(
                      //         backgroundColor: Colors.white,
                      //         radius: iconSize / 2,
                      //         child: Icon(Icons.person, color: Colors.orange, size: iconSize * 0.7),
                      //       ),
                      //       SizedBox(width: paddingSize),
                      //       Expanded(
                      //         child: Text(
                      //           "KYC Rejected",
                      //           style: TextStyle(
                      //             fontFamily: 'Maine',
                      //             color: Colors.orange,
                      //             fontSize: fontSize*.6,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //       ElevatedButton(
                      //         onPressed: () {
                      //
                      //
                      //
                      //         },
                      //         style: ElevatedButton.styleFrom(
                      //           backgroundColor: Colors.orange,
                      //           padding: EdgeInsets.symmetric(horizontal: paddingSize * 2, vertical: paddingSize/2),
                      //         ),
                      //         child: Text("View Reason", style: TextStyle(
                      //             fontFamily: 'Maine',
                      //             fontSize: fontSize*.6)),
                      //       ),
                      //       SizedBox(width: paddingSize),
                      //       Icon(Icons.close, color: Colors.orange, size: iconSize ),
                      //     ],
                      //   ),
                      // ),


                      //Add code here
                      /// 🛠 My Tools Section
                      SizedBox(height: height * 0.3),
                      Text("My Tools", style: TextStyle(
                          fontFamily: 'Maine',
                          fontSize: fontSize*.8, fontWeight: FontWeight.bold)),
                      SizedBox(height: height * 0.3),

                      //  Container(
                      //   margin: EdgeInsets.symmetric(horizontal: paddingSize),
                      //   padding: EdgeInsets.symmetric(horizontal: paddingSize*.2,vertical: paddingSize),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(25),
                      //     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       _toolItem("EMI Calculator", Icons.calculate, iconSize, height ,
                      //             () {
                      //
                      //           Get.to(EmiCalculatorScreen());
                      //
                      //
                      //       print("Home tapped!");
                      //       // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                      //       },
                      //
                      //       ),
                      //         _toolItem("Offer Calculator", Icons.home, iconSize, height,
                      //
                      //             () {
                      //           print("Home tapped!");
                      //           // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                      //         },),
                      //       _toolItem("Payout Calculator", Icons.currency_rupee, iconSize, height,
                      //             () {
                      //           print("Home tapped!");
                      //           // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                      //         },),
                      //     ],
                      //   ),
                      // ),
                      //
                      //




                       Container(
                         height: 80,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [


                             _toolItem("EMI Calculator", Icons.calculate, iconSize, height ,
                                       () {

                                     Get.to(EmiCalculatorScreen());


                                 print("Home tapped!");
                                 // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                                 },

                                 ),




                                 _toolItem("Offer Calculator", Icons.home, iconSize, height,

                                     () {
                                   print("Home tapped!");
                                   // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                                 },),
                               _toolItem("Payout Calculator", Icons.currency_rupee, iconSize, height,
                                     () {
                                   print("Home tapped!");
                                   // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                                 },),







                           ],

                         ),
                       )






,





                  //
                  //
                  // Align(
                  //
                  //
                  //
                  //
                  //   alignment: Alignment.center,
                  //
                  //
                  //
                  //   child: SizedBox(
                  //
                  //     width: 300,
                  //     child: GridView.builder(
                  //       shrinkWrap: true,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemCount: menuItems.length,
                  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 4,
                  //         mainAxisSpacing: 12,
                  //         crossAxisSpacing: 12,
                  //       ),
                  //       itemBuilder: (context, index) {
                  //         final item = menuItems[index];
                  //         return _buildMenuCard(item, height);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  //




                  SizedBox(height: height * 0.6),

                      /// 📊 My Leads Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                           Text("My Leads", style: TextStyle(
                              fontFamily: 'Maine',
                              fontSize: fontSize*.8, fontWeight: FontWeight.bold)),
                          Text("Last 3 Months", style: TextStyle(
                              fontFamily: 'Maine',
                              fontSize: fontSize * 0.7, color: Colors.grey)),


                         ],
                      ),
                      SizedBox(height: height * 0.3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [



                          _leadItem("New", "${s.getAllLeadsCountResponse.value.data?.newLeads??""}", iconSize, fontSize),
                          _leadItem("Logged In", "${s.getAllLeadsCountResponse.value.data?.loggedIn??""}", iconSize, fontSize),
                          _leadItem("Sanction", "${s.getAllLeadsCountResponse.value.data?.sanctioned??""}", iconSize, fontSize),
                          _leadItem("Disbursed", "${s.getAllLeadsCountResponse.value.data?.disbursed??""}", iconSize, fontSize),




                        ],
                      ),
                      SizedBox(height: height * 0.6),

                      /// 📌 Pending Tasks Section
                      Text("Pending Task", style: TextStyle(
                          fontFamily: 'Maine',
                          fontSize: fontSize*.8, fontWeight: FontWeight.bold)),
                      SizedBox(height: height * 0.3),
                      Container(
                        padding: EdgeInsets.all(paddingSize),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(paddingSize),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                        ),
                        child: Column(


                           children: [



                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _taskItem("Follow Ups", "${s.getAllLeadsCountResponse.value.data?.followUps??""}", fontSize),
                                _taskItem("Disbursal Pending", "${s.getAllLeadsCountResponse.value.data?.confirmationPending??""}", fontSize),
                              ],
                            ),
                            Divider(color: Colors.grey.shade300),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_today, color: Colors.red, size: iconSize * 0.6),
                                SizedBox(width: paddingSize),
                                Text(
                                  "1 task overdue",
                                  style: TextStyle(
                                      fontFamily: 'Maine',
                                      fontSize: fontSize * 0.7, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 6),

                    ],
                  ),
                ),
              ),
        ),


        bottomNavigationBar: CustomBottomNavigationBar()
    );
  }






  // Widget _toolItem(String title, IconData icon, double iconSize, double fontSize) {
  //   return Column(
  //     children: [
  //       Icon(icon, color: Colors.black, size: iconSize),
  //       SizedBox(height: 5),
  //       Text(title, style: TextStyle(
  //           fontFamily: 'Maine',
  //           fontSize: fontSize * 0.7)),
  //     ],
  //   );
  // }




  Widget _summaryCard(String title, double amount, IconData icon, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1, offset: const Offset(0, 5)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 8),
            Text(
              "₹${amount.toStringAsFixed(0)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }



  Widget _toolItem(String title, IconData icon, double iconSize, double height, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child:


      // Card(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Icon(icon, color: Colors.black, size: iconSize),
      //       const SizedBox(height: 5),
      //       Text(
      //         title,
      //
      //
      //
      //         style: Newtextstyle.normalopenSans(AppColor.blackcolor,height*.2),
      //
      //
      //
      //
      //       ),
      //     ],
      //   ),
      // ),

        AspectRatio(
          aspectRatio: 1, // 🔥 force square
          child: Stack(
            children: [
              Container(

                height: height*2,
                width: height*2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: height*.75, color: Colors.blue),
                    SizedBox(height:  height*.3),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2, // prevent text overflow
                      overflow: TextOverflow.ellipsis,

                      style: Newtextstyle.normalopenSans1(AppColor.blackcolor,height*.2),
                      // style: const TextStyle(
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w500,
                      // ),

                    ),
                  ],
                ),
              ),


              // if (item.isNew)
              //   Positioned(
              //     right: 0,
              //     top: 0,
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              //       decoration: BoxDecoration(
              //         color: Colors.orange,
              //         borderRadius: const BorderRadius.only(
              //           bottomLeft: Radius.circular(8),
              //           topRight: Radius.circular(14),
              //         ),
              //       ),
              //       child: const Text(
              //         "NEW",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 10,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   )
              //


            ],
          ),
        )








    );
  }


  // Widget _buildMenuCard(MenuItem item) {
  //   return Stack(
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(14),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black12,
  //               blurRadius: 4,
  //               offset: Offset(0, 2),
  //             )
  //           ],
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Icon(item.icon, size: 40, color: Colors.blue),
  //             const SizedBox(height: 8),
  //             Text(
  //               item.title,
  //               style: const TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       if (item.isNew)
  //         Positioned(
  //           right: 0,
  //           top: 0,
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  //             decoration: BoxDecoration(
  //               color: Colors.orange,
  //               borderRadius: const BorderRadius.only(
  //                 bottomLeft: Radius.circular(8),
  //                 topRight: Radius.circular(14),
  //               ),
  //             ),
  //             child: const Text(
  //               "NEW",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         )
  //     ],
  //   );
  // }




  Widget _buildMenuCard(MenuItem item ,double height) {
    return

      AspectRatio(
      aspectRatio: 1, // 🔥 force square
      child: Stack(
        children: [
          Container(

            height: height*2,
            width: height*2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: height*.75, color: Colors.blue),
                 SizedBox(height:  height*.3),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  maxLines: 2, // prevent text overflow
                  overflow: TextOverflow.ellipsis,

                  style: Newtextstyle.normalopenSans(AppColor.blackcolor,height*.2),
                  // style: const TextStyle(
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w500,
                  // ),

                ),
              ],
            ),
          ),


          // if (item.isNew)
          //   Positioned(
          //     right: 0,
          //     top: 0,
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          //       decoration: BoxDecoration(
          //         color: Colors.orange,
          //         borderRadius: const BorderRadius.only(
          //           bottomLeft: Radius.circular(8),
          //           topRight: Radius.circular(14),
          //         ),
          //       ),
          //       child: const Text(
          //         "NEW",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 10,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   )
          //


        ],
      ),
    );
  }





}


  Widget _leadItem(String title, String count, double iconSize, double fontSize) {
    return Container(
      padding: EdgeInsets.all(iconSize * 0.2),
      width: iconSize * 3.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(iconSize * 0.3),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text(count,



              // style: TextStyle(fontFamily: 'Maine',
              // fontSize: fontSize, fontWeight: FontWeight.bold)


                    style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize),



          ),
          Text(title,

              style: Newtextstyle.normalopenSans(AppColor.blackcolor,  fontSize * 0.6),

              // style: TextStyle(
              // fontFamily: 'Maine',
              // fontSize: fontSize * 0.6, color: Colors.grey)


          ),
        ],
      ),
    );
  }

  Widget _taskItem(String title, String count, double fontSize) {
    return Expanded(
      child: Column(
        children: [
          Text(count,


              style: Newtextstyle.normalopenSans(AppColor.blackcolor,fontSize),

              // style: TextStyle(
              // fontFamily: 'Maine',
              // fontSize: fontSize, fontWeight: FontWeight.bold)

          ),
          Text(title, style: Newtextstyle.normalopenSans(AppColor.blackcolor,  fontSize * 0.6),


              // style: TextStyle(
              // fontFamily: 'Maine',
              // fontSize: fontSize * 0.7, color: Colors.grey)



          ),
        ],
      ),
    );
  }






class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}


class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0; // To track the selected item index



  // Add your screens here
  final List<Widget> _screens = [
     DashboardScreen(),
     CreateLeadView(),
     LeadStatusScreen()



  ];

  void _onNavItemTapped(int index) {
    setState(() {
      //_selectedIndex = index; // Update selected index
    });
    // Navigate to the corresponding screen

    if (index != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _screens[index]),

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Container(
      margin: const EdgeInsets.all(20),
      height: 70,
      decoration: BoxDecoration(
       // color: Colors.black,

        color:  AppColor.appColor, //
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [




          // 1st home
          // 2nd Admins
          // 3rd + wala jo icon hai ticket raise
          // 4th Seat booking
          // 5th Community
          //
          //













          // _buildNavItem(
          //     index: 0,
          //     icon: Icons.home,
          //     label: 'Home',
          //     size: height * 0.6,
          //     height: height),
          _buildNavItem(
              index: 0,
              icon: Icons.people_rounded,
              label: 'My Customers',
              size: height * 0.6,
              height: height),
          _buildNavItem(
              index: 1,
              icon: Icons.add_circle_rounded,

              label: '',
              size: height * 1.4,
              height: height),
          _buildNavItem(
              index: 2,


              icon: Icons.event_note_outlined,
              label: 'My Leads',
              size: height * 0.6,
              height: height),


        //   _buildNavItem(
        //       index: 4,
        //       icon: Icons.people,
        //       label: 'Community',
        //       size: height * 0.6,
        //       height: height),
        //

      ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required double size,
    required double height,
  }) {
    // Change color based on the selected index
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onNavItemTapped(index), // Handle navigation and selection
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // label==''   ?
          //
          // CircleAvatar(
          //   radius: size / 2,
          //   backgroundColor: Colors.white,
          //   child: Icon(
          //
          //     icon,
          //     color: isSelected ? Colors.orange : Colors.white,
          //     // Change color on selection
          //     size: size,
          //   ),
          // ):





          //
          //
          // //
          // label=='Seat booking' ?
          //
          // CircleAvatar(
          //   backgroundColor: AppColor.whitecolor,
          //   radius: (size / 2) - 4,
          //   backgroundImage: AssetImage(
          //
          //
          //       'assets/images/seat_booking_icon.png'),
          // ):


          // Image.asset(
          //   fit: BoxFit.cover,
          //   color:  Colors.white
          //   ,
          //
          //   'assets/images/seat_booking_icon.png'
          //   ,width: height*.6,height:  height*.6,):



          Icon(
            icon,
            color: isSelected ? Colors.orange : Colors.white,
            // Change color on selection
            size: size,
          ),
          label.isEmpty
              ? const SizedBox(height: 0)
              : Column(
            children: [
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.orange : Colors.white,
                  fontSize: height * 0.25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}







