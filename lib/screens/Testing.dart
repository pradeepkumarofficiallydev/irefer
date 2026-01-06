// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
// import 'package:intl/intl.dart';
//
// import '../Utils/NewTextstyle.dart';
//
//
//
// class EmiCalculatorScreen extends StatefulWidget {
//   @override
//   _EmiCalculatorScreenState createState() => _EmiCalculatorScreenState();
// }
//
// class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
//   double loanAmount = 14100000;
//   int tenure = 20;
//   double interestRate = 21.45;
//
//   double emi = 0;
//   double totalAmount = 0;
//   double totalInterest = 0;
//
//
//
//   final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
//
//   @override
//   void initState() {
//     super.initState();
//     calculateEMI();
//   }
//
//   void calculateEMI() {
//     double monthlyRate = interestRate / (12 * 100);
//     int months = tenure * 12;
//
//     emi = loanAmount *
//         monthlyRate *
//         (pow(1 + monthlyRate, months) / (pow(1 + monthlyRate, months) - 1));
//
//     totalAmount = emi * months;
//     totalInterest = totalAmount - loanAmount;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     calculateEMI();
//
//     return SafeArea(
//
//         child: Scaffold(
//         backgroundColor:   Color(0xFFF3F5FF),
//
//           appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 1,
//           centerTitle: true,
//           title: Text(
//             "EMI Calculator",
//             style: Newtextstyle.normalopenSans2(Colors.black87,height*.56),
//
//
//           ),
//     ),
//
//
//
//         body: SingleChildScrollView(
//           padding: EdgeInsets.all(height*.5),
//           child: Column(
//             children: [
//               Container(
//
//                 height: height*8,
//                 padding: EdgeInsets.all(height*.5),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
//                 ),
//                 child: SfRadialGauge(
//                   axes: <RadialAxis>[
//                     RadialAxis(
//                       minimum: 0,
//                       maximum: totalAmount,
//                       pointers: <GaugePointer>[
//                         RangePointer(
//                           value: totalInterest,
//                           color: Colors.green,
//                           width: 0.2,
//                           sizeUnit: GaugeSizeUnit.factor,
//                         )
//                       ],
//                       annotations: <GaugeAnnotation>[
//                         GaugeAnnotation(
//                           widget: Text(format.format(totalAmount),
//
//
//                             style: Newtextstyle.normalopenSans(Colors.black87,height*.34),
//                           ),
//                           angle: 90,
//                           positionFactor: 0.6,
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//
//
//
//
//               SizedBox(height: height*.3),
//               Text('Monthly EMI: ${format.format(emi)}',
//               //  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 style: Newtextstyle.normalopenSans(Colors.black87,height*.5),
//
//               ),
//
//
//               SizedBox(height: height*.3),
//               Card(
//              //   #f3f5ff
//              //   color: Color(0XFFf3f5ff),
//
//
//                   color: Colors.white,
//
//               elevation: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           Text('Principal Amount',
//                             style: Newtextstyle.normalopenSans(Colors.black87,height*.4),
//                           ),
//                           SizedBox(height: 8),
//                           Text(format.format(loanAmount),
//                             style: Newtextstyle.normalopenSans1(Colors.black87,height*.35),
//
//
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text('Interest Amount',
//
//                             style: Newtextstyle.normalopenSans(Colors.black87,height*.4),
//
//                           ),
//                           SizedBox(height: 8),
//                           Text(format.format(totalInterest),
//                             style: Newtextstyle.normalopenSans1(Colors.black87,height*.35),
//
//
//
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               buildSlider("Loan Amount", loanAmount, 500000, 100000000, (value) => setState(() => loanAmount = value),height),
//               buildSlider("Tenure (Years)", tenure.toDouble(), 5, 30,
//                       (value) => setState(() => tenure = value.round()),height),
//
//               buildSlider("Interest Rate (%)", interestRate, 7, 25,
//                       (value) => setState(() => interestRate = value),height),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget buildSlider(String label, double value, double min, double max, Function(double) onChanged, double height) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(label,
//     style: Newtextstyle.normalopenSans1(Colors.black87,height*.4),
//
//
//     ),
//             Text(
//               label.contains("Tenure")
//                   ? "$tenure years"
//                   : label.contains("Interest")
//                   ? "${value.toStringAsFixed(2)}%"
//                   : format.format(value.round()),
//               style: Newtextstyle.normalopenSans1(Colors.black87,height*.4),
//
//             )
//           ],
//         ),
//         Slider(
//           min: min,
//           max: max,
//           value: value,
//           divisions: 100,
//           label: value.toStringAsFixed(2),
//           onChanged: onChanged,
//         ),
//       ],
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
// // import 'dart:math';
// // import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_gauges/gauges.dart';
// // import 'package:intl/intl.dart';
// //
// // class EmiCalculatorScreen extends StatefulWidget {
// //   @override
// //   _EmiCalculatorScreenState createState() => _EmiCalculatorScreenState();
// // }
// //
// // class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
// //   double loanAmount = 14100000;
// //   int tenure = 20;
// //   double interestRate = 21.45;
// //
// //   double emi = 0;
// //   double totalAmount = 0;
// //   double totalInterest = 0;
// //
// //   final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     calculateEMI();
// //   }
// //
// //   void calculateEMI() {
// //     double monthlyRate = interestRate / (12 * 100);
// //     int months = tenure * 12;
// //
// //     emi = loanAmount *
// //         monthlyRate *
// //         (pow(1 + monthlyRate, months) / (pow(1 + monthlyRate, months) - 1));
// //
// //     totalAmount = emi * months;
// //     totalInterest = totalAmount - loanAmount;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;
// //     double height = MediaQuery.of(context).size.height;
// //
// //     calculateEMI();
// //
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: const Color(0xFFF3F5FF),
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           elevation: 1,
// //           centerTitle: true,
// //           title: Text(
// //             "EMI Calculator",
// //             style: TextStyle(
// //               color: Colors.black87,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //         body: SingleChildScrollView(
// //           padding: EdgeInsets.all(16),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // EMI Gauge
// //               Container(
// //                 padding: EdgeInsets.all(16),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(16),
// //                   boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
// //                 ),
// //                 child: SfRadialGauge(
// //                   axes: <RadialAxis>[
// //                     RadialAxis(
// //                       minimum: 0,
// //                       maximum: totalAmount,
// //                       showLabels: false,
// //                       showTicks: false,
// //                       axisLineStyle: AxisLineStyle(
// //                         thicknessUnit: GaugeSizeUnit.factor,
// //                         thickness: 0.1,
// //                       ),
// //                       pointers: <GaugePointer>[
// //                         RangePointer(
// //                           value: totalInterest,
// //                           color: Colors.teal,
// //                           width: 0.2,
// //                           sizeUnit: GaugeSizeUnit.factor,
// //                         )
// //                       ],
// //                       annotations: <GaugeAnnotation>[
// //                         GaugeAnnotation(
// //                           widget: Column(
// //                             mainAxisSize: MainAxisSize.min,
// //                             children: [
// //                               Text("Total Payable", style: TextStyle(fontSize: 14)),
// //                               SizedBox(height: 4),
// //                               Text(format.format(totalAmount), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                             ],
// //                           ),
// //                           angle: 90,
// //                           positionFactor: 0.1,
// //                         )
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //
// //               SizedBox(height: 30),
// //
// //               // EMI Text
// //               Center(
// //                 child: Text(
// //                   'Monthly EMI: ${format.format(emi)}',
// //                   style: TextStyle(
// //                     fontSize: 20,
// //                     color: Colors.black87,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //               ),
// //
// //               SizedBox(height: 30),
// //
// //               // Principal & Interest
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(16),
// //                   boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
// //                 ),
// //                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     buildAmountCard("Principal Amount", loanAmount),
// //                     buildAmountCard("Interest Amount", totalInterest),
// //                   ],
// //                 ),
// //               ),
// //
// //               SizedBox(height: 30),
// //
// //
// //               // Sliders
// //               buildSlider("Loan Amount", loanAmount, 500000, 100000000,
// //                       (value) => setState(() => loanAmount = value)),
// //               buildSlider("Tenure (Years)", tenure.toDouble(), 5, 30,
// //                       (value) => setState(() => tenure = value.round())),
// //               buildSlider("Interest Rate (%)", interestRate, 7, 25,
// //                       (value) => setState(() => interestRate = value)),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget buildAmountCard(String label, double value) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
// //         SizedBox(height: 6),
// //         Text(format.format(value), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
// //       ],
// //     );
// //   }
// //
// //   Widget buildSlider(
// //       String label,
// //       double value,
// //       double min,
// //       double max,
// //       Function(double) onChanged,
// //       ) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         SizedBox(height: 24),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
// //             Text(
// //               label.contains("Tenure")
// //                   ? "$tenure years"
// //                   : label.contains("Interest")
// //                   ? "${value.toStringAsFixed(2)}%"
// //                   : format.format(value.round()),
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             )
// //           ],
// //         ),
// //         SliderTheme(
// //           data: SliderTheme.of(context).copyWith(
// //             activeTrackColor: Colors.teal,
// //             inactiveTrackColor: Colors.teal.shade100,
// //             thumbColor: Colors.teal,
// //             overlayColor: Colors.teal.withOpacity(0.2),
// //             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
// //             trackHeight: 4.0,
// //           ),
// //           child: Slider(
// //             min: min,
// //             max: max,
// //             value: value,
// //             divisions: 100,
// //             label: value.toStringAsFixed(2),
// //             onChanged: onChanged,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
//
//
//
//














import 'package:flutter/material.dart';

class SanctionUpdateScreen extends StatelessWidget {
  const SanctionUpdateScreen({super.key});

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
        padding: const EdgeInsets.all(20),
        child:


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
                  Icon(Icons.person, color: Colors.deepPurple, size: 28),
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
            _buildTextField(label: "Amount*", icon: Icons.currency_rupee),
            const SizedBox(height: 16),

            // Approval Date + EMI
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                      label: "Approval Date*", icon: Icons.calendar_today),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                      label: "Approved EMI*", icon: Icons.payments),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Sanction Number
            _buildTextField(label: "Sanction Number*", icon: Icons.numbers),
            const SizedBox(height: 16),

            // Supporting Docs
            _buildUploadTile("Supporting Docs"),
            const SizedBox(height: 16),

            // Comment
            _buildTextField(label: "Comment", icon: Icons.comment, maxLines: 2),
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



      ),
    );
  }

  Widget _buildTextField(
      {required String label, required IconData icon, int maxLines = 1}) {
    return TextField(
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
        prefixIcon: const Icon(Icons.check_circle_outline,
            color: Colors.deepPurple),
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
