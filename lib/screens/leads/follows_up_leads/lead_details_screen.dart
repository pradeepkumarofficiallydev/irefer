import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/lead_details_controller.dart';
import 'package:jsp/screens/leads/follows_up_leads/status_update_screen.dart';

import '../../../Utils/NewTextstyle.dart';
import '../follow_ups_screen.dart';

class LeadDetailsScreen extends StatelessWidget {
  var leadsId;

  LeadDetailsScreen({super.key, this.leadsId});

  var leadDetailsController = Get.put(LeadDetailsController());

  @override
  Widget build(BuildContext context) {
    leadDetailsController.getLeadsDetails(leadsId);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        actions: const [
          Icon(Icons.edit, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<LeadDetailsController>(
              init: leadDetailsController,
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Profile + Info
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey.shade200,
                          child: const Icon(Icons.person,
                              size: 40, color: Colors.black54),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 8,
                                children: [
                                  _chip("Pre-login", Colors.blue.shade100,
                                      Colors.blue),
                                  _chip("Qualified", Colors.green.shade100,
                                      Colors.green),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${controller.getSingleLeadsResponse.value.data?.firstName ?? ""} (ID - ${leadsId})",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.phone,
                                      size: 16, color: Colors.black54),
                                  SizedBox(width: 6),
                                  Text(
                                      '${controller.getSingleLeadsResponse.value.data?.mobileNo ?? ""}'),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.email,
                                      size: 16, color: Colors.black54),
                                  SizedBox(width: 6),
                                  Text(
                                      '${controller.getSingleLeadsResponse.value.data?.email ?? ""}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone,
                              color: Colors.green, size: 32),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // /// Banner
                    // Container(
                    //   padding: const EdgeInsets.all(12),
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue.shade50,
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       const Icon(Icons.home, color: Colors.blue),
                    //       const SizedBox(width: 8),
                    //       const Expanded(
                    //         child: Text(
                    //           "Earn upto 0.25% payout on home insurance. Explore here",
                    //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    //         ),
                    //       ),
                    //       const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
                    //     ],
                    //   ),
                    // ),

                    const SizedBox(height: 16),

                    // /// Tabs
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     _tabButton("Overview", true),
                    //     _tabButton("Insurance", false),
                    //     _tabButton("History", false),
                    //   ],
                    // ),

                    // const SizedBox(height: 16),
                    //
                    // /// Credit Score
                    // Container(
                    //   padding: const EdgeInsets.all(12),
                    //   decoration: BoxDecoration(
                    //     color: Colors.orange.shade50,
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   child: Row(
                    //     children: const [
                    //       Icon(Icons.speed, color: Colors.orange),
                    //       SizedBox(width: 8),
                    //       Expanded(
                    //         child: Text(
                    //           "Check Free Credit Score here!",
                    //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    //         ),
                    //       ),
                    //       Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
                    //     ],
                    //   ),
                    // ),

                    const SizedBox(height: 20),

                    /// Pending Actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Pending Actions",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("View All",
                            style: TextStyle(color: Colors.purple)),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.verified_user, color: Colors.purple),
                              SizedBox(width: 10),
                              Text("KYC Pending",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Icon(Icons.calendar_today,
                                  size: 16, color: Colors.black54),
                              SizedBox(width: 6),
                              Text("28 Aug, 2025",
                                  style: TextStyle(color: Colors.black87)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text("Upload Now",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      alignment: Alignment.center,



                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,

                              child: Text("Login Details",style: Newtextstyle.normalopenSans1(AppColor.blackcolor,height*.03),))

,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Login Id"),
                              Text('${controller.getSingleLeadsResponse.value.data?.login?.loginNumber ?? ""}'),
                            ],
                          )
                        ],
                      ),
                    ),

                    // ExpansionTile(
                    //   // leading: Icon(Icons.qr_code),
                    //   title: Text(
                    //     "Login Details",
                    //     style: Newtextstyle.normalopenSans1(
                    //         AppColor.blackcolor, height * .03),
                    //   ),
                    //   children: [
                    //     Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text("Login Id"),
                    //         Text(
                    //             '${controller.getSingleLeadsResponse.value.data?.login?.loginNumber ?? ""}'),
                    //       ],
                    //     )
                    //   ],
                    // ),


                    /// Documents
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Documents",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("Go to Docs",
                            style: TextStyle(color: Colors.purple)),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          _docCount("2", "Pending"),
                          _docCount("0", "Submitted"),
                          _docCount("0", "Approved"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        "Get recommended doc list",
                        style: TextStyle(
                            color: Colors.purple,
                            decoration: TextDecoration.underline),
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                );
              })),

      /// Bottom Buttons
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => ScheduleFollowUpSheet(
                        leadDetailsController.getSingleLeadsResponse),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Colors.purple),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Set Follow-up",
                    style: TextStyle(color: Colors.purple)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ///////////////
                  Get.to(ModernStatusUpdateScreen());
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Update Status",
                  style: TextStyle(color: AppColor.whitecolor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _chip(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(label,
          style: TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  static Widget _tabButton(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.purple : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _docCount extends StatelessWidget {
  final String count;
  final String label;

  const _docCount(this.count, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

//
//
// class ScheduleFollowUpSheet extends StatefulWidget {
//   var getSingleLeadsResponse;
//
//   ScheduleFollowUpSheet(this.getSingleLeadsResponse, {super.key});
//
//   @override
//   State<ScheduleFollowUpSheet> createState() => _ScheduleFollowUpSheetState();
// }
//
// class _ScheduleFollowUpSheetState extends State<ScheduleFollowUpSheet> {
//   int selectedOption = 0; // 0 = Call, 1 = Doc Pickup
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//
//   final TextEditingController commentController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(20),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         ),
//         child: GetBuilder<LeadDetailsController>(
//             init: LeadDetailsController(),
//             builder: (controller) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Header
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Schedule Follow-up",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       IconButton(
//                         onPressed: () => Navigator.pop(context),
//                         icon: const Icon(Icons.close, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     "${widget.getSingleLeadsResponse.value.data?.firstName ?? ""} ${widget.getSingleLeadsResponse.value.data?.lastName ?? ""} . ${widget.getSingleLeadsResponse.value.data?.mobileNo ?? ""} ",
//                     style: TextStyle(color: Colors.black87, fontSize: 14),
//                   ),
//                   const SizedBox(height: 20),
//
//                   /// Options (Call, Doc Pickup)
//                   Row(
//                     children: [
//                       _radioOption("Call", 0),
//                       const SizedBox(width: 20),
//                       _radioOption("Doc Pickup", 1),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//
//                   /// Date & Time
//                   Row(
//                     children: [
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: _pickDate,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 12, vertical: 14),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Colors.grey.shade400),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(selectedDate == null
//                                     ? "Date*"
//                                     : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"),
//                                 const Icon(Icons.calendar_today, size: 18),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: _pickTime,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 12, vertical: 14),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Colors.grey.shade400),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(selectedTime == null
//                                     ? "Time*"
//                                     : selectedTime!.format(context)),
//                                 const Icon(Icons.access_time, size: 18),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//
//                   /// Comment
//                   TextField(
//                     controller: commentController,
//                     maxLines: 3,
//                     decoration: InputDecoration(
//                       hintText: "Comment",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//
//                   /// Schedule Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepPurple,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {
//
//
//
//
//
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         "Schedule Now",
//                         style: TextStyle(
//                         //  color: Colors.w,
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }));
//   }
//
//   Widget _radioOption(String label, int value) {
//     return Row(
//       children: [
//         Radio(
//           activeColor: Colors.deepPurple,
//           value: value,
//           groupValue: selectedOption,
//           onChanged: (v) {
//             setState(() => selectedOption = v as int);
//           },
//         ),
//         Text(label),
//       ],
//     );
//   }
//
//
//
//   Future<void> _pickDate() async {
//     final picked = await showDatePicker(
//       context: context,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//       initialDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() => selectedDate = picked);
//     }
//   }
//
//   Future<void> _pickTime() async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() => selectedTime = picked);
//     }
//   }
// }

// class LeadDetailsController extends GetxController {
//   var selectedOption = 0.obs; // 0 = Call, 1 = Doc Pickup
//   var selectedDate = Rxn<DateTime>();
//   var selectedTime = Rxn<TimeOfDay>();
//   var commentController = TextEditingController();
//
//   void pickDate(BuildContext context) async {
//     final picked = await showDatePicker(
//       context: context,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//       initialDate: DateTime.now(),
//     );
//     if (picked != null) selectedDate.value = picked;
//   }
//
//   void pickTime(BuildContext context) async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) selectedTime.value = picked;
//   }
//
//   /// Combine date & time into a single DateTime
//   DateTime? get scheduledDateTime {
//     if (selectedDate.value == null || selectedTime.value == null) return null;
//     return DateTime(
//       selectedDate.value!.year,
//       selectedDate.value!.month,
//       selectedDate.value!.day,
//       selectedTime.value!.hour,
//       selectedTime.value!.minute,
//     );
//   }
//
//
//
// }

class ScheduleFollowUpSheet extends StatelessWidget {
  final dynamic getSingleLeadsResponse;

  ScheduleFollowUpSheet(this.getSingleLeadsResponse, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeadDetailsController());

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Schedule Follow-up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "${getSingleLeadsResponse.value.data?.firstName ?? ""} "
              "${getSingleLeadsResponse.value.data?.lastName ?? ""} · "
              "${getSingleLeadsResponse.value.data?.mobileNo ?? ""}",
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
            const SizedBox(height: 20),

            /// Options (Call, Doc Pickup)
            Row(
              children: [
                _radioOption(controller, "Call", 0),
                const SizedBox(width: 20),
                _radioOption(controller, "Doc Pickup", 1),
              ],
            ),
            const SizedBox(height: 20),

            /// Date & Time
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.pickDate(context),
                    child: _inputBox(
                      label: controller.selectedDate.value == null
                          ? "Date*"
                          : "${controller.selectedDate.value!.day}-"
                              "${controller.selectedDate.value!.month}-"
                              "${controller.selectedDate.value!.year}",
                      icon: Icons.calendar_today,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.pickTime(context),
                    child: _inputBox(
                      label: controller.selectedTime.value == null
                          ? "Time*"
                          : controller.selectedTime.value!.format(context),
                      icon: Icons.access_time,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Comment
            TextField(
              controller: controller.commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Comment",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// Schedule Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (controller.scheduledDateTime == null) {
                    Get.snackbar("Error", "Please select Date & Time");
                    return;
                  }

                  // final data = {
                  //   "option": controller.selectedOption.value == 0
                  //       ? "Call" : "Doc Pickup",
                  //   "dateTime": controller.scheduledDateTime.toString(),
                  //   "comment": controller.commentController.text,
                  // };

                  controller.followUp(
                      '${getSingleLeadsResponse.value.data?.sId ?? ""}');

                  // print("📌 Scheduled Follow Up => $data");

                  // Here you can call API to save follow-up
                  Navigator.pop(context);
                },
                child: const Text(
                  "Schedule Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _radioOption(
      LeadDetailsController controller, String label, int value) {
    return Row(
      children: [
        Radio(
          activeColor: Colors.deepPurple,
          value: value,
          groupValue: controller.selectedOption.value,
          onChanged: (v) => controller.selectedOption.value = v as int,
        ),
        Text(label),
      ],
    );
  }

  Widget _inputBox({required String label, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Icon(icon, size: 18),
        ],
      ),
    );
  }
}
