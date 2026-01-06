import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:jsp/controller/lead_details_controller.dart';

class ModernStatusUpdateScreen extends StatelessWidget {
  ModernStatusUpdateScreen({super.key});

  var controller = Get.put(LeadDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {},
        ),
        title: const Text(
          "Status Update",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.black54),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black54),
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],

                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.deepPurple, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "${controller.getSingleLeadsResponse.value.data?.firstName ?? ""} ${controller.getSingleLeadsResponse.value.data?.lastName ?? ""} • ${controller.getSingleLeadsResponse.value.data?.mobileNo ?? ""}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                      ),
                    ],
                  ),


                ),
                const SizedBox(height: 20),
                // Dropdown
                _buildDropdown(
                  label: "Update Status to",
                  value: "Login",
                  items: ["Login", "Sanction", "Disbursed"],
                  onChanged: (val) {},
                ),
                const SizedBox(height: 24),

                const Text(
                  "Login Details* ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                ),
                const SizedBox(height: 16),

                // Bank Name
                _buildTextField(


                      controller:  controller.bankNameController ,
                      label: "Bank Name*", icon: Icons.account_balance),
                const SizedBox(height: 16),

                // Login Date + Amount
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                          controller:  controller.bankNameController ,

                          label: "Login Date*", icon: Icons.calendar_today),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTextField(
                          controller:  controller.bankNameController ,

                          label: "Login Amount*", icon: Icons.currency_rupee),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Login Number
                _buildTextField(
                    controller:  controller.bankNameController ,



                    label: "Login Number*", icon: Icons.numbers),
                const SizedBox(height: 16),

                // Supporting Docs
                _buildUploadTile("Supporting Docs*"),
                const SizedBox(height: 16),

                // Comment
                _buildTextField(
                    controller:  controller.bankNameController ,

                    label: "Comment", icon: Icons.comment, maxLines: 2),
                const SizedBox(height: 16),

                // Aadhaar Upload
                _buildUploadTile("Aadhaar"),
                const SizedBox(height: 16),

                // PAN Upload
                _buildUploadTile("PAN"),
                const SizedBox(height: 32),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      elevation: 6,
                    ),






                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header info
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.person,
                              color: Colors.deepPurple, size: 28),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "ram singh • 8575455444",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Dropdown
                    _buildDropdown(
                      label: "Update Status to",
                      value: "Sanction",
                      items: ["Login", "Sanction", "Disbursed"],
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      "Sanction Details* (2/3)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 16),

                    // Amount
                    _buildTextField(
                        controller:  controller.bankNameController ,

                        label: "Amount*", icon: Icons.currency_rupee),
                    const SizedBox(height: 16),

                    // Approval Date + EMI
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                              controller:  controller.bankNameController ,

                              label: "Approval Date*",
                              icon: Icons.calendar_today),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                              controller:  controller.bankNameController ,

                              label: "Approved EMI*", icon: Icons.payments),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Sanction Number
                    _buildTextField(
                        controller:  controller.bankNameController ,

                        label: "Sanction Number*", icon: Icons.numbers),
                    const SizedBox(height: 16),

                    // Supporting Docs
                    _buildUploadTile("Supporting Docs"),
                    const SizedBox(height: 16),

                    // Comment
                    _buildTextField(
                        controller:  controller.bankNameController ,

                        label: "Comment", icon: Icons.comment, maxLines: 2),
                    const SizedBox(height: 16),

                    // Aadhaar Upload
                    _buildUploadTile("Aadhaar"),
                    const SizedBox(height: 16),

                    // PAN Upload
                    _buildUploadTile("PAN"),
                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          elevation: 6,
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildTextField(
      { required TextEditingController   controller  ,
        required String label, required IconData icon, int maxLines = 1}) {
    return TextFormField(

      controller: controller
      ,
      maxLines: maxLines,
      decoration: InputDecoration(

        prefixIcon: Icon(icon, color: Colors.deepPurple),
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        prefixIcon:
            const Icon(Icons.check_circle_outline, color: Colors.deepPurple),
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      items: items
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }



  Widget _buildUploadTile(String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.insert_drive_file_outlined,
                color: Colors.deepPurple),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            ),
            const Icon(Icons.upload_file, color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
