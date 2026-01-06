import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/leads_status_controller.dart';
import '../../data/response/status.dart';
import '../../model_view/LeadsStatusRepository.dart';
import '../../models/GetAllLeadsCountResponse.dart';
import 'follow_ups_screen.dart';
import 'new_leads_screen.dart';
class LeadStatusScreen extends StatelessWidget {
  const LeadStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LeadsStatusController controller = Get.put(LeadsStatusController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Leads",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Top Tabs (Home Loan / LAP)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                        child: Text("Home Loan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                        child: Text("LAP",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ),
          ),

          // List of Lead Status Cards
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.blue));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: controller.leads.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final key = controller.leads.keys.elementAt(index);
                  final value = controller.leads[key]!;
                  final gradient = _getGradient(index);
                  final icon = _getIcon(key);

                  return _modernCard(key, gradient, icon, value);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // Modern Card with Gradient Background
  Widget _modernCard(
      String title, List<Color> gradient, IconData icon, int count) {
    return
      InkWell(
        onTap: ()
        {


          _handleCardClick(title);






        },
        child: Container(

        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradient.last.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              radius: 22,
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            Text(
              "$count",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
            ),
      );
  }


  List<Color> _getGradient(int index) {
    List<List<Color>> gradients = [
      [Colors.green.shade300, Colors.green.shade200],
      [Colors.purple.shade300, Colors.purple.shade200],
      [Colors.teal.shade300, Colors.teal.shade200],
      [Colors.orange.shade300, Colors.orange.shade200],
      [Colors.red.shade300, Colors.red.shade200],
      [Colors.blue.shade300, Colors.blue.shade200],
    ];
    return gradients[index % gradients.length];
  }




  // Dynamic icons
  IconData _getIcon(String title) {
    switch (title) {
   // Follow Ups
    case "Follow Ups":
    return Icons.follow_the_signs;
      case "Confirmation Pending":
        return Icons.pending;
      case "New Leads":
        return Icons.fiber_new;
      case "Logged In":
        return Icons.login;
      case "Sanctioned":
        return Icons.verified;
      case "Disbursed":
        return Icons.account_balance_wallet;
      case "Lost":
        return Icons.close;
      default:
        return Icons.dashboard;
    }
  }




  void _handleCardClick(String title) {
    switch (title) {
      case "New Leads":
        Get.to(() => NewLeadsScreen());   // Your New Leads Screen
        break;
      //
      case "Follow Ups":
        Get.to(() => FollowUpsScreen());  // Example screen for Follow Ups
        break;




      //
      // case "Confirmation Pending":
      //   Get.to(() => ConfirmationPendingScreen());
      //   break;
      //
      // case "Logged In":
      //   Get.to(() => LoggedInScreen());
      //   break;
      //
      // case "Sanctioned":
      //   Get.to(() => SanctionedScreen());
      //   break;
      //

      case "Disbursed":
        Get.to(() => FollowUpsScreen());
        break;
      //
      // case "Lost":
      //   Get.to(() => LostLeadsScreen());
      //   break;

      default:
     //   Get.to(() => LeadsScreen()); // fallback
        break;
    }
  }




}





