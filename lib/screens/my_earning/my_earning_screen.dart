// import 'package:flutter/material.dart';
//
// class MyEarningsScreen extends StatelessWidget {
//   const MyEarningsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//         title: const Text(
//           "My Earnings",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Tabs
//             Container(
//               height: 44,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF2ECFD),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF5E35B1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           "Projected",
//                           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         "Earned",
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         "Paid",
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w500,
//
//
//
//                          ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Earnings Info
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 6,
//                     offset: const Offset(0, 2),
//                   )
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: const [
//                   _EarningColumn(title: "No of Leads", value: "0"),
//                   _EarningColumn(title: "Projected*", value: "0"),
//                   _EarningColumn(title: "Confirmed Amt", value: "0"),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             // Info Note
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFF8E1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Icon(Icons.info_outline, color: Colors.black54, size: 18),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       "*Projected refers to unrealized payout and are subject to change "
//                           "based on final loan & payout slabs given by lender. "
//                           "The amt. exclusive of GST if applicable.",
//                       style: TextStyle(color: Colors.black87, fontSize: 13),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 40),
//
//             // Earnings Illustration
//             Column(
//               children: [
//                 Container(
//                   height: 140,
//                   width: 140,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFF2ECFD),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.show_chart, color: Color(0xFF5E35B1), size: 80),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Boost your Earnings",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 const Text(
//                   "Disburse your cases to get payouts on-time, every-time.",
//                   style: TextStyle(color: Colors.black54, fontSize: 14),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 30),
//
//             // Manage Leads Button
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF5E35B1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   "Manage Leads",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _EarningColumn extends StatelessWidget {
//   final String title;
//   final String value;
//
//   const _EarningColumn({required this.title, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(value,
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 6),
//         Text(title, style: const TextStyle(color: Colors.black54, fontSize: 13)),
//       ],
//     );
//   }
// }

//////  this is my new

//
// import 'package:flutter/material.dart';
// import 'package:jsp/Utils/AppColors.dart';
//
// class EarningsScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> leads = [
//     {
//       "first_name": "Deepak",
//       "last_name": "Singh",
//       "loan_type": "Home Loan",
//       "required_amount": 100000,
//       "status": "Follow Ups",
//       "commission_status": "approved",
//       "commission_amount": 1000
//     },
//     {
//       "first_name": "John",
//       "last_name": "Doe",
//       "loan_type": "Home Loan",
//       "required_amount": 500000,
//       "status": "New Leads",
//       "commission_status": "pending",
//       "commission_amount": 1000
//     }
//   ];
//
//   EarningsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     // double totalApproved = leads
//     //      .where((l) => l["commission_status"] == "approved")
//     //     .fold(0, (sum, l) => sum + (l["commission_amount"] as num))
//     //     .toDouble();
//     //
//     // double totalPending = leads
//     //     .where((l) => l["commission_status"] == "pending")
//     //     .fold(0, (sum, l) => sum + (l["commission_amount"] as num))
//     //     .toDouble();
//
//
//
//
//
//
//     double totalApproved = leads
//         .where((l) => l["commission_status"] == "approved")
//         .fold<double>(0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());
//
//     double totalPending = leads
//         .where((l) => l["commission_status"] == "pending")
//         .fold<double>(0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());
//
//
//
//
//
//     return Scaffold(
//
//       backgroundColor: AppColor.whitecolor,
//
//       appBar: AppBar(
//         title: const Text("My Earnings"),
//         centerTitle: true,
//         backgroundColor: Colors.indigo,
//       ),
//       body: Column(
//         children: [
//           // Summary Card
//           Card(
//             margin: const EdgeInsets.all(12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             elevation: 4,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _summaryBox("Approved", totalApproved, Colors.green),
//                   _summaryBox("Pending", totalPending, Colors.orange),
//                 ],
//               ),
//             ),
//           ),
//
//           // Lead List
//           Expanded(
//             child: ListView.builder(
//               itemCount: leads.length,
//               itemBuilder: (context, index) {
//                 final lead = leads[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   elevation: 2,
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.indigo.shade100,
//                       child: Text(lead["first_name"][0]),
//                     ),
//                     title: Text("${lead["first_name"]} ${lead["last_name"]}"),
//                     subtitle: Text(
//                       "${lead["loan_type"]} • ₹${lead["required_amount"]}",
//                     ),
//                     trailing: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "₹${lead["commission_amount"]}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: lead["commission_status"] == "approved"
//                                 ? Colors.green
//                                 : Colors.orange,
//                           ),
//                         ),
//                         Text(
//                           lead["commission_status"].toString().toUpperCase(),
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: lead["commission_status"] == "approved"
//                                 ? Colors.green
//                                 : Colors.orange,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _summaryBox(String title, double amount, Color color) {
//     return Column(
//       children: [
//         Text(
//           "₹${amount.toStringAsFixed(0)}",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
//         ),
//         Text(title, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }
//

 ///// This is my last code  ///////////////
//
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:jsp/controller/my_earning_controller.dart';
//
// import '../../Utils/AppColors.dart';
// import '../../Utils/NewTextstyle.dart';
//
// class EarningsScreen extends StatefulWidget {
//   const EarningsScreen({super.key});
//
//   @override
//   State<EarningsScreen> createState() => _EarningsScreenState();
// }
//
// class _EarningsScreenState extends State<EarningsScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   final List<Map<String, dynamic>> leads = [
//     {
//       "first_name": "Deepak",
//       "last_name": "Singh",
//       "loan_type": "Home Loan",
//       "required_amount": 100000,
//       "status": "Follow Ups",
//       "commission_status": "approved",
//       "commission_amount": 1000
//     },
//     {
//       "first_name": "John",
//       "last_name": "Doe",
//       "loan_type": "Home Loan",
//       "required_amount": 500000,
//       "status": "New Leads",
//       "commission_status": "pending",
//       "commission_amount": 1000
//     }
//   ];
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24;
//     double height = width * 0.4;
//
//     double totalApproved = leads
//         .where((l) => l["commission_status"] == "approved")
//         .fold<double>(
//             0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());
//
//     double totalPending = leads
//         .where((l) => l["commission_status"] == "pending")
//         .fold<double>(
//             0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());
//
//     return Scaffold(
//         backgroundColor: const Color(0xFFF5F6FA),
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(height * 4),
//           child: Stack(
//             children: [
//               Container(
//                 height: height * 2,
//                 width: double.infinity,
//                 color: AppColor.appColor,
//                 padding: EdgeInsets.symmetric(
//                     horizontal: height * .6, vertical: height * .6),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () => Navigator.pop(context),
//                       child: Icon(Icons.arrow_back_ios,
//                           color: Colors.black, size: height * .7),
//                     ),
//                     Spacer(),
//
//                     Text('My Earnings',
//                         style: Newtextstyle.normaNoSpacingboldlopenSans(
//                             AppColor.blackcolor, height * .5)),
//                     SizedBox(width: height * .5),
//                     Spacer(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: GetBuilder<MyEarningController>(
//             init: MyEarningController(),
//             builder: (controller) {
//               return Column(
//                 children: [
//                   // Summary Cards
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: _summaryCard(
//                             "Approved",
//                             totalApproved,
//                             Icons.check_circle,
//                             Colors.green,
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: _summaryCard(
//                             "Pending",
//                             totalPending,
//                             Icons.hourglass_bottom,
//                             Colors.orange,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // Tab Views
//                   Expanded(
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         _leadList(leads),
//
//
//
//
//
//                         _leadList(leads.where((l) => l["commission_status"] == "approved").toList()), // Approved
//                        _leadList(leads.where((l) => l["commission_status"] == "pending").toList()), // Pending
//
//
//
//
//                        ],
//                     ),
//                   ),
//
//
//
//
//
//
//                 ],
//               );
//             }));
//   }
//
//   Widget _summaryCard(String title, double amount, IconData icon, Color color) {
//     return Container(
//       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       // elevation: 4,
//
//
//
//       width: double.infinity,
//       padding: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             spreadRadius: 1,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Icon(icon, color: color, size: 30),
//             const SizedBox(height: 8),
//             Text(
//               "₹${amount.toStringAsFixed(0)}",
//               style: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: color),
//             ),
//             Text(title, style: const TextStyle(fontSize: 14)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _leadList(List<Map<String, dynamic>> leads) {
//     if (leads.isEmpty) {
//
//       return const Center(child: Text("No data found"));
//
//
//
//     }
//
//
//     return ListView.builder(
//       itemCount: leads.length,
//       itemBuilder: (context, index) {
//         final lead = leads[index];
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           // elevation: 2,
//
//
//           width: double.infinity,
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 spreadRadius: 1,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//
//
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.indigo.shade100,
//               child: Text(lead["first_name"][0]),
//             ),
//             title: Text(
//               "${lead["first_name"]} ${lead["last_name"]}",
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               "${lead["loan_type"]} • ₹${lead["required_amount"]}",
//             ),
//             trailing: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//               decoration: BoxDecoration(
//                 color: lead["commission_status"] == "approved"
//                     ? Colors.green.shade100
//                     : Colors.orange.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text(
//                 "₹${lead["commission_amount"]}\n${lead["commission_status"].toString().toUpperCase()}",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12,
//                   color: lead["commission_status"] == "approved"
//                       ? Colors.green
//                       : Colors.orange,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

/////////








import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/controller/my_earning_controller.dart';

import '../../Utils/AppColors.dart';
import '../../Utils/NewTextstyle.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {

  var myEarningController=Get.put(MyEarningController());




  // final List<Map<String, dynamic>> leads = [
  //   {
  //     "first_name": "Deepak",
  //     "last_name": "Singh",
  //     "loan_type": "Home Loan",
  //     "required_amount": 100000,
  //     "status": "Follow Ups",
  //     "commission_status": "approved",
  //     "commission_amount": 1000
  //   },
  //   {
  //     "first_name": "John",
  //     "last_name": "Doe",
  //     "loan_type": "Home Loan",
  //     "required_amount": 500000,
  //     "status": "New Leads",
  //     "commission_status": "pending",
  //     "commission_amount": 1000
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    // double totalApproved = leads
    //     .where((l) => l["commission_status"] == "approved")
    //     .fold<double>(0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());
    //
    // double totalPending = leads
    //     .where((l) => l["commission_status"] == "pending")
    //     .fold<double>(0.0, (sum, l) => sum + (l["commission_amount"] as num).toDouble());
    //








    double totalApproved =  myEarningController.newLeadsResponse.value.data!
        .where((l) => l.commissionStatus == "approved")
        .fold<double>(0.0, (sum, l) => sum + (l.commissionAmount ?? 0).toDouble());

    double totalPending = myEarningController.newLeadsResponse.value.data!
        .where((l) => l.commissionStatus == "pending")
        .fold<double>(0.0, (sum, l) => sum + (l.commissionAmount ?? 0).toDouble());



    setState(() {

    });



    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 4),
        child: SafeArea(

          child: Container(
            height: height * 2,
            width: double.infinity,
            color: AppColor.appColor,
            padding: EdgeInsets.symmetric(horizontal: height * .6, vertical: height * .6),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios, color: Colors.black, size: height * .7),
                ),
                const Spacer(),
                Text(
                  'My Earnings',
                  style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor, height * .5),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<MyEarningController>(
        init: myEarningController,
        builder: (controller) {
          return Column(
            children: [
              // ✅ Summary Cards




              Obx(() {
                final data = myEarningController.newLeadsResponse.value.data ?? [];

                final totalApproved = data
                    .where((l) => l.commissionStatus == "approved")
                    .fold<double>(0.0, (sum, l) => sum + (l.commissionAmount ?? 0).toDouble());

                final totalPending = data
                    .where((l) => l.commissionStatus == "pending")
                    .fold<double>(0.0, (sum, l) => sum + (l.commissionAmount ?? 0).toDouble());

                return
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: _summaryCard("Approved", totalApproved, Icons.check_circle, Colors.green),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _summaryCard("Pending", totalPending, Icons.hourglass_bottom, Colors.orange),
                        ),
                      ],
                    ),
                  );


              }),








              // ✅ Full Lead List (No TabBar)
              Expanded(child: _leadList()),




            ],
          );
        },
      ),
    );
  }

  Widget _summaryCard(String title, double amount, IconData icon, Color color) {
    return


      Container(
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



  Widget _leadList() {
    if (myEarningController.newLeadsResponse.value.data!.isEmpty) {


      return const Center(child: Text("No data found"));



    }

    return ListView.builder(
      itemCount: myEarningController.newLeadsResponse.value.data?.length??0,

      //leads.length,
      itemBuilder: (context, index) {


        final lead = myEarningController.newLeadsResponse.value.data![index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [

              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1, offset: const Offset(0, 5)),

            ],
          ),


          child:

          ListTile(
            leading: CircleAvatar(



              backgroundColor: Colors.indigo.shade100,
              child: Text("${lead.firstName??" "}"[0]),
            ),
            title: Text("${lead.firstName??""} ${lead.lastName??""}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${lead.loanType} • ₹${lead.requiredAmount}"),

            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: lead.commissionStatus == "approved"
                    ? Colors.green.shade100
                    : Colors.orange.shade100,


                borderRadius: BorderRadius.circular(12),

              ),
              child:

              Text(
                "₹${lead.commissionAmount}\n${lead.commissionStatus.toString().toUpperCase()}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,

                  color: lead.commissionStatus == "approved" ? Colors.green : Colors.orange,

                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


