import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/leads_controller.dart';
import 'package:jsp/models/GetSingleLeadsResponse.dart';
import '../../Utils/custom_widgets.dart';
import '../../controller/follow_ups_controller.dart';
import 'follows_up_leads/lead_details_screen.dart';



class FollowUpsScreen extends StatefulWidget {
  @override
  _LeadsScreenState createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<FollowUpsScreen> {


  var followUpsController= Get.put(FollowUpsController());




  @override
  void initState() {





    followUpsController.getAllLeadsFun();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
        backgroundColor: AppColor.whitecolor,

        appBar: AppBar(
          title: Text('Follow Up'),
          backgroundColor: Colors.blue[800],
        ),

        body: GetBuilder<FollowUpsController>(
            init: followUpsController,
            builder: (controller) {

              return Padding(
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
                          itemCount: controller.getFollowUpsLeadsResponse
                              .value.data?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var items = controller.getFollowUpsLeadsResponse
                                .value.data![index];
                            return InkWell(
                                onTap: () {


                                  Get.to(LeadDetailsScreen( leadsId :items.sId));



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
                                            // Row(
                                            //   children: [
                                            //     const Icon(Icons.account_balance, size: 18),
                                            //     const SizedBox(width: 4),
                                            //     Text("${items.loanType}  •  ${items.requiredAmount}",
                                            //         style: const TextStyle(fontWeight: FontWeight.w500)),
                                            //   ],
                                            // ),



                                            const SizedBox(height: 6),



                                            Row(
                                              children: [
                                                const Icon(Icons.currency_rupee, size: 18),
                                                const SizedBox(width: 4),

                                                 Text(
                                                   controller.formatNumber(int.tryParse('${items.requiredAmount}'))

                                                     //"${items.requiredAmount}"

                                                     , style: const TextStyle(fontWeight: FontWeight.w500)),


                                                ],
                                            ),






                                            const SizedBox(height: 6),


                                            // // Source
                                            // Text("Source: ${items.source}",
                                            //     style: const TextStyle(color: Colors.black87)),
                                            // const SizedBox(height: 6),
                                            // Follow-up


                                            Row(
                                              children:  [
                                                Icon(Icons.calendar_today, size: 16),
                                                SizedBox(width: 6),
                                                Text('${items.status ?? ""} ${controller. formatIsoToDMMMYYYY(items.followUpDate??"")}', style: TextStyle(color: Colors.black87)),


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
                                            color: Colors.limeAccent,

                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(8),
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          child: Text(
                                            "Follow Ups",
                                            style: const TextStyle(color: Colors.black, fontSize: 12),
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
            })


    );





  }
}



