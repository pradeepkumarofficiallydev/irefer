// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jsp/Utils/AppColors.dart';
//
// import '../../Utils/NewTextstyle.dart';
// import '../../Utils/custom_widgets.dart';
//
// class CreateLeadView extends StatelessWidget {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();
//
//   final RxString selectedLoanType = 'Home Loan'.obs;
//   final RxBool referToAmbak = false.obs;
//
//   final RxList<String> selectedOptions = <String>[].obs;
//
//   final List<String> loanOptions = ['Balance Transfer', 'Top-Up', 'OD'];
//
//
//
//   final List<String> indianStates = [
//     'Andhra Pradesh',
//     'Arunachal Pradesh',
//     'Assam',
//     'Bihar',
//     'Chhattisgarh',
//     'Goa',
//     'Gujarat',
//     'Haryana',
//     'Himachal Pradesh',
//     'Jharkhand',
//     'Karnataka',
//     'Kerala',
//     'Madhya Pradesh',
//     'Maharashtra',
//     'Manipur',
//     'Meghalaya',
//     'Mizoram',
//     'Nagaland',
//     'Odisha',
//     'Punjab',
//     'Rajasthan',
//     'Sikkim',
//     'Tamil Nadu',
//     'Telangana',
//     'Tripura',
//     'Uttar Pradesh',
//     'Uttarakhand',
//     'West Bengal',
//     'Andaman and Nicobar Islands',
//     'Chandigarh',
//     'Dadra and Nagar Haveli and Daman and Diu',
//     'Delhi',
//     'Jammu and Kashmir',
//     'Ladakh',
//     'Lakshadweep',
//     'Puducherry',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     double width = MediaQuery.of(context).size.width * 0.24;
//     double height = width * 0.4;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColor.whitecolor,
//         //appBar: AppBar(title: const Text("Create Lead")),
//        // appBar: AppBar(title: const Text("Capacity")),
//
//
//
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(height * 4),
//           child: Stack(
//             children: [
//               /// Curved header background
//               Container(
//                 height: height * 2,
//                 width: double.infinity,
//                 color: AppColor.appColor,
//
//
//                 padding: EdgeInsets.symmetric(
//                   horizontal: height * .6,
//                   vertical: height * .6,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//
//
//                     /// Drawer icon
//                     InkWell(
//                       onTap: () => Navigator.pop(context),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.black,
//                         size: height * .7,
//                       ),
//                     ),
//
//                     Spacer(),
//
//                     /// Title
//                     Text(
//                       '', style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.8),
//
//
//                     ),
//                     SizedBox(width: height*.5,),
//
//                     Spacer()
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//
//         body: SingleChildScrollView(
//           padding:  EdgeInsets.all(height*.5),
//
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("Would you like Ambak to fulfill this lead?"),
//                SizedBox(height: height*.3),
//               Obx(() => Row(
//                 children: [
//                   _choiceChip("No, I will do it myself", !referToAmbak.value, () => referToAmbak.value = false),
//                   SizedBox(width: height*.3),
//
//
//                 //  const SizedBox(width: 8),
//                   _choiceChip("Yes, refer to Ambak", referToAmbak.value, () => referToAmbak.value = true),
//
//
//                 ],
//               )),
//               SizedBox(height: height*.3),            Row(
//
//
//                 children: [
//                   Expanded(child: _textField(firstNameController, "First Name*")),
//                   const SizedBox(width: 10),
//                   Expanded(child: _textField(lastNameController, "Last Name*")),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               _textField(mobileController, "Mobile No.*", keyboardType: TextInputType.phone),
//               const SizedBox(height: 20),
//               const Text("Loan Type"),
//               const SizedBox(height: 8),
//               Obx(() => Row(
//                 children: [
//
//                   _choiceChip("Home Loan", selectedLoanType.value == 'Home Loan',
//                           () => selectedLoanType.value = 'Home Loan'),
//                   const SizedBox(width: 8),
//                   _choiceChip("LAP", selectedLoanType.value == 'LAP',
//                           () => selectedLoanType.value = 'LAP'),
//                 ],
//               )),
//               const SizedBox(height: 10),
//               Obx(() => Wrap(
//                 spacing: 10,
//                 children: loanOptions.map((option) {
//                   final selected = selectedOptions.contains(option);
//                   return FilterChip(
//                     label: Text(option),
//                     selected: selected,
//                     onSelected: (value) {
//                       selected
//                           ? selectedOptions.remove(option)
//                           : selectedOptions.add(option);
//                     },
//                   );
//                 }).toList(),
//               )),
//               SizedBox(height: height*.3),
//
//               _textField(emailController, "Email Id"),
//               // _dropdownTile("Property State", onTap: () {
//               //   // show state selection modal
//               // }),
//               SizedBox(height: height*.3),
//
//               CustomDropdown(
//                 items: indianStates,
//                 hintText: 'Select State',
//                 dropdownHeight: indianStates.length * 45.0 > 300 ? 300 : indianStates.length * 45.0,
//                 buttonDecoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.black87),
//                   borderRadius: BorderRadius.circular(8,),
//                 ),
//                 dropdownDecoration: BoxDecoration(
//                   color: Colors.green[100],
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.purple, width: 1.5),
//                 ),
//                 textStyle: TextStyle(fontSize: 16, color: Colors.black),
//                 onItemSelected: (value) {
//                   print("State selected: $value");
//                   // You can assign it to your controller.selectedState.value = value;
//                 },
//               ),
//
//
//
//               SizedBox(height: height*.3),
//
//               _textField(emailController, "Property City"),
//
//              // _dropdownTile("Property City", onTap: () {
//                 // show city selection modal
//            //   }),
//
//               SizedBox(height: height*.3),
//
//
//               _textField(amountController, "Required Amount*", keyboardType: TextInputType.number),
//               SizedBox(height: height*.3),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepPurple,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
//                   onPressed: () {
//                     // Submit logic
//                   },
//                   child: const Text("Continue", style: TextStyle(color: Colors.white)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _textField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         border: const OutlineInputBorder(),
//       ),
//
//
//     );
//   }
//
//   Widget _dropdownTile(String label, {required VoidCallback onTap}) {
//     return ListTile(
//       title: Text(label),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: onTap,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       tileColor: Colors.grey.shade100,
//     );
//   }
//
//   Widget _choiceChip(String label, bool selected, VoidCallback onTap) {
//     return ChoiceChip(
//       label: Text(label),
//       selected: selected,
//       onSelected: (_) => onTap(),
//     );
//   }
// }
//
//
//

 ///////////////////

//// that is my code



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import '../../Utils/NewTextstyle.dart';
import '../../Utils/custom_widgets.dart';
import '../../controller/leads_controller.dart';

class CreateLeadView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 4),
          child: Stack(
            children: [
              Container(
                height: height * 2,
                width: double.infinity,
                color: AppColor.appColor,
                padding: EdgeInsets.symmetric(horizontal: height * .6, vertical: height * .6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios, color: Colors.black, size: height * .7),
                    ),
                    Spacer(),
                    Text('', style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor, height * .8)),
                    SizedBox(width: height * .5),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(height * .5),
          child:
    GetBuilder<LeadsController>(
    init: LeadsController(),
    builder: (s) =>

    Form(
            key: s.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Would you like Refer to fulfill this lead?"),
                SizedBox(height: height * .3),
                Obx(() => Row(
                  children: [
                    _choiceChip("No, I will do it myself", !s.referToAmbak.value, () => s.referToAmbak.value = false),
                    SizedBox(width: height * .3),
                    _choiceChip("Yes, refer to Refer", s.referToAmbak.value, () => s.referToAmbak.value = true),
                  ],
                )),
                SizedBox(height: height * .3),

                Row(
                  children: [
                    Expanded(child: _textField(s.firstNameController, "First Name*", isRequired: true)),
                    const SizedBox(width: 10),
                    Expanded(child: _textField(s.lastNameController, "Last Name*", isRequired: true)),
                  ],
                ),
                const SizedBox(height: 10),
                _textField(s.mobileController, "Mobile No.*", keyboardType: TextInputType.phone, isRequired: true),
                const SizedBox(height: 20),
                const Text("Loan Type"),
                const SizedBox(height: 8),
                Obx(() => Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _choiceChip("Home Loan",s. selectedLoanType.value == 'Home Loan',
                            () => s.selectedLoanType.value = 'Home Loan'),
                    const SizedBox(width: 8),
                    _choiceChip("LAP", s.selectedLoanType.value == 'LAP',
                            () => s.selectedLoanType.value = 'LAP'),
                  ],
                )),
                const SizedBox(height: 10),
                Obx(() => Wrap(
                  spacing: 10,
                  children: s.loanOptions.map((option) {
                    final selected = s.selectedOptions.contains(option);
                    return FilterChip(
                      label: Text(option),
                      selected: selected,
                      onSelected: (value) {
                        selected
                            ?s. selectedOptions.remove(option)
                            :s. selectedOptions.add(option);
                      },
                    );
                  }).toList(),
                )),
                SizedBox(height: height * .3),
                _textField(s.emailController, "Email Id*", isRequired: true),
                SizedBox(height: height * .3),

                // Obx(() =>
            CustomDropdown(
                  items:s. indianStates,
                  hintText: 'Select State',
                  dropdownHeight: s.indianStates.length * 45.0 > 300 ? 300 : s.indianStates.length * 45.0,
                  buttonDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black87),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  dropdownDecoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.purple, width: 1.5),
                  ),
                  textStyle: TextStyle(fontSize: 16, color: Colors.black),
                  onItemSelected: (value) {
                   s. selectedState.value = value;
                  },
                )
          //)
                ,

                SizedBox(height: height * .3),
                _textField(s.cityController, "Property City*", isRequired: true),
                SizedBox(height: height * .3),
                _textField(s.amountController, "Required Amount*", keyboardType: TextInputType.number, isRequired: true),
                SizedBox(height: height * .3),




                s.isLoading.value
                    ? Center(

                      child: CustomWidgets.showCircularIndicator1(
                      context, height * .9, AppColor.appColor),
                    ):
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    onPressed: () {


                      if (s.formKey.currentState!.validate() && s.selectedState.value.isNotEmpty) {
                        final Map<String, dynamic> formData = {
                          "first_name": s.firstNameController.text.trim(),
                          "last_name": s.lastNameController.text.trim(),
                          "mobile_no": s.mobileController.text.trim(),
                          "email":s. emailController.text.trim(),
                          "loan_type": s.selectedLoanType.value,
                          "loan_purpose": s.selectedLoanType.value,
                          "loan_options":s. selectedOptions.toList(),
                          "refer_to_ambak":s. referToAmbak.value,
                          "property_state":s. selectedState.value,
                          "property_city":s. cityController.text.trim(),
                          "required_amount": s.amountController.text.trim(),
                          "source": 'Walk-in',
                          "status": 'New Leads',

                        };



                        s.createLeadFun(formData);

                        print("Form Data: $formData");
                        Get.snackbar("Success", "Form submitted successfully!");



                      } else {
                        Get.snackbar("Error", "Please fill all required fields.");
                      }
                    },
                    child: const Text("Continue", style: TextStyle(color: Colors.white)),
                  ),
                )


              ],
            ),
          ),
    )
        ),
      ),
    );
  }

  Widget _textField(TextEditingController controller, String label,
      {TextInputType? keyboardType, bool isRequired = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: isRequired
          ? (value) {
        if (value == null || value.trim().isEmpty) {
          return "$label is required";
        }
        return null;
      }
          : null,
    );
  }

  Widget _choiceChip(String label, bool selected, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }
}












