import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/leads_controller.dart';

import '../../Utils/custom_widgets.dart';
import '../../controller/new_leads_controller.dart';
import 'follow_ups_screen.dart';
import 'follows_up_leads/lead_details_screen.dart';

class NewLeadsScreen extends StatefulWidget {
  @override
  _LeadsScreenState createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<NewLeadsScreen> {
  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: AppBar(

          title: Text('New Leads'),
          backgroundColor: Colors.blue[800],
        ),
        body: GetBuilder<NewLeadsController>(
            init: NewLeadsController(),
            builder: (controller) {
              return


                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                  child: controller.isRaisedLoading.value
                      ? Center(
                          child: CustomWidgets.showCircularIndicator1(
                              context, height * .9, AppColor.blackcolor))
                      : Column(
                          children: [
                            Expanded(
                              child:

                              ListView.builder(
                                shrinkWrap: true,
                                controller: controller.scrollController,
                                itemCount: controller.newLeadsResponse
                                        .value.data?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  var items = controller.newLeadsResponse
                                      .value.data![index];
                                  return InkWell(
                                      onTap: () {


                                        Get.to(LeadDetailsScreen( leadsId :items.sId));

                                      //  Get.to(LeadDetailsScreen( ));


                                      },
                                      child:




                                      //
                                      // Card(
                                      //   margin: EdgeInsets.all(8),
                                      //   elevation: 2,
                                      //   child: Padding(
                                      //     padding: EdgeInsets.all(16),
                                      //     child: Column(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         // Header row with name and date
                                      //         Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment
                                      //                   .spaceBetween,
                                      //           children: [
                                      //             Text(
                                      //               '${items.firstName} ${items.lastName}',
                                      //               style: TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 fontSize: 16,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               _formatDate(
                                      //                   items.createdAt!),
                                      //               style: TextStyle(
                                      //                 color: Colors.grey[600],
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         SizedBox(height: 8),
                                      //
                                      //         // Mobile number
                                      //         Text(
                                      //           items.mobileNo ?? "",
                                      //           style: TextStyle(
                                      //             fontSize: 14,
                                      //           ),
                                      //         ),
                                      //         SizedBox(height: 12),
                                      //
                                      //         // Status tags
                                      //         Wrap(
                                      //           spacing: 8,
                                      //           children: [
                                      //             _buildStatusChip(
                                      //                 'PSV', Colors.orange),
                                      //             _buildStatusChip(
                                      //                 'PendingOSV', Colors.red),
                                      //           ],
                                      //         ),
                                      //         SizedBox(height: 12),
                                      //
                                      //         // Loan details
                                      //         Text(
                                      //           '${items.loanType} | ₹${_formatAmount(items.requiredAmount!)}',
                                      //           style: TextStyle(
                                      //             fontWeight: FontWeight.bold,
                                      //             color: Colors.blue[800],
                                      //           ),
                                      //         ),
                                      //         SizedBox(height: 8),
                                      //
                                      //         // Additional info
                                      //         Text(
                                      //           'Source:  ${items.source}',
                                      //           style: TextStyle(
                                      //             color: Colors.grey[600],
                                      //             fontSize: 12,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // )









                                      Card(
                                        color:  AppColor.whitecolor,
                                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                        elevation: 4,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [



                                                  SizedBox(height: 10,),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          "${items.firstName} (ID - ${items.sId})",
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                      // Call Button
                                                      InkWell(
                                                        onTap: () {



                                                          /// Get.to(FollowUpsScreen());



                                                          // call function
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 20,
                                                          backgroundColor: Colors.green.shade100,
                                                          child: const Icon(Icons.phone, color: Colors.green),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),

                                                  // Loan info
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.account_balance, size: 18),
                                                      const SizedBox(width: 4),
                                                      Text("${items.loanType}  •  ${items.requiredAmount}",
                                                          style: const TextStyle(fontWeight: FontWeight.w500)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 6),

                                                  // Source
                                                  Text("Source: ${items.source}",
                                                      style: const TextStyle(color: Colors.black87)),
                                                  const SizedBox(height: 6),

                                                  // Follow-up
                                                  Row(
                                                    children: const [
                                                      Icon(Icons.calendar_today, size: 16),
                                                      SizedBox(width: 6),
                                                      Text("No Follow-up",
                                                          style: TextStyle(color: Colors.black87)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 6),

                                                  // // KYC
                                                  // Row(
                                                  //   children: [
                                                  //     const Icon(Icons.assignment, size: 16),
                                                  //     const SizedBox(width: 6),
                                                  //     Text("KYC: ${items.loanType}",
                                                  //         style: const TextStyle(color: Colors.red)),
                                                  //   ],
                                                  // ),


                                                ],
                                              ),
                                            ),

                                            // Top-left Tag (Qualified)
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFE9FBE7),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(16),
                                                    bottomRight: Radius.circular(8),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                child: Text(
                                                  "New Lead",
                                                  style: const TextStyle(color: Colors.green, fontSize: 12),
                                                ),
                                              ),
                                            ),


                                            // Top-right Tag (Self-Fulfillment)
                                            // Positioned(
                                            //   top: 0,
                                            //   right: 0,
                                            //   child: Container(
                                            //     decoration: const BoxDecoration(
                                            //       color: Color(0xFF673AB7),
                                            //       borderRadius: BorderRadius.only(
                                            //         topRight: Radius.circular(16),
                                            //         bottomLeft: Radius.circular(8),
                                            //       ),
                                            //     ),
                                            //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                            //     child: Text(
                                            //       statusTag,
                                            //       style: const TextStyle(color: Colors.white, fontSize: 12),
                                            //     ),
                                            //   ),
                                            // ),


                                          ],
                                        ),
                                      )






                                  );
                                },
                              ),
                            ),


                            if (controller.isRaisedLoading.value)
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        ));
            }));
  }
}









//
//
// import 'package:flutter/material.dart';
//
// class LeadCard extends StatelessWidget {
//   final String name;
//   final String leadId;
//   final String loanType;
//   final String amount;
//   final String source;
//   final String followUp;
//   final String kycStatus;
//   final String statusTag;
//   final String topLeftTag;
//
//   const LeadCard({
//     super.key,
//     required this.name,
//     required this.leadId,
//     required this.loanType,
//     required this.amount,
//     required this.source,
//     required this.followUp,
//     required this.kycStatus,
//     required this.statusTag,
//     required this.topLeftTag,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//
//       Card(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 4,
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Name + ID
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       child: Text(
//                         "$name (ID - $leadId)",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     // Call Button
//                     InkWell(
//                       onTap: () {
//                         // call function
//                       },
//                       child: CircleAvatar(
//                         radius: 20,
//                         backgroundColor: Colors.green.shade100,
//                         child: const Icon(Icons.phone, color: Colors.green),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//
//                 // Loan info
//                 Row(
//                   children: [
//                     const Icon(Icons.account_balance, size: 18),
//                     const SizedBox(width: 4),
//                     Text("$loanType  •  $amount",
//                         style: const TextStyle(fontWeight: FontWeight.w500)),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//
//                 // Source
//                 Text("Source: $source",
//                     style: const TextStyle(color: Colors.black87)),
//                 const SizedBox(height: 6),
//
//                 // Follow-up
//                 Row(
//                   children: const [
//                     Icon(Icons.calendar_today, size: 16),
//                     SizedBox(width: 6),
//                     Text("No Follow-up",
//                         style: TextStyle(color: Colors.black87)),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//
//                 // KYC
//                 Row(
//                   children: [
//                     const Icon(Icons.assignment, size: 16),
//                     const SizedBox(width: 6),
//                     Text("KYC: $kycStatus",
//                         style: const TextStyle(color: Colors.red)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           // Top-left Tag (Qualified)
//           Positioned(
//             top: 0,
//             left: 0,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFFE9FBE7),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               child: Text(
//                 topLeftTag,
//                 style: const TextStyle(color: Colors.green, fontSize: 12),
//               ),
//             ),
//           ),
//
//           // Top-right Tag (Self-Fulfillment)
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFF673AB7),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(16),
//                   bottomLeft: Radius.circular(8),
//                 ),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               child: Text(
//                 statusTag,
//                 style: const TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class LeadsScreen extends StatelessWidget {
//   const LeadsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Pre-Login Leads")),
//       body: ListView(
//         children: const [
//           LeadCard(
//             name: "Hshsh Dhdhdhd",
//             leadId: "77022",
//             loanType: "HL | BT",
//             amount: "₹10.0 L",
//             source: "PRADEEP KUMAR",
//             followUp: "No Follow-up",
//             kycStatus: "Pending",
//             statusTag: "Self-Fulfillment",
//             topLeftTag: "Qualified",
//           ),
//           LeadCard(
//             name: "Sggs Hhhhh",
//             leadId: "75739",
//             loanType: "HL | BT",
//             amount: "₹1.0 K",
//             source: "PRADEEP KUMAR",
//             followUp: "No Follow-up",
//             kycStatus: "Pending",
//             statusTag: "Self-Fulfillment",
//             topLeftTag: "Qualified",
//           ),
//           LeadCard(
//             name: "Teep Singh",
//             leadId: "70400",
//             loanType: "HL | BT",
//             amount: "₹2.2 K",
//             source: "PRADEEP KUMAR",
//             followUp: "No Follow-up",
//             kycStatus: "Pending",
//             statusTag: "Self-Fulfillment",
//             topLeftTag: "Qualified",
//           ),
//         ],
//       ),
//     );
//   }
// }
