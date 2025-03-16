import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for Text Fields
  final TextEditingController organizationTypeController = TextEditingController(text: "individial");
  final TextEditingController partnerCodeController = TextEditingController(text: "UPP922952");
  final TextEditingController partnerEmployeeCodeController = TextEditingController(text: "00Z9U");
  final TextEditingController nameController = TextEditingController(text: "Pradeep");
  final TextEditingController mobileNumberController = TextEditingController(text: "9520583930");
  final TextEditingController emailController = TextEditingController(text: "pradeepkumarrdx74@gmail.com");
  final TextEditingController panController = TextEditingController(text: "DZPPK2816F");
  final TextEditingController pincodeController = TextEditingController(text: "202127");
  final TextEditingController cityController = TextEditingController(text: "Aligarh");
  final TextEditingController districtController = TextEditingController(text: "Aligarh");
  final TextEditingController stateController = TextEditingController(text: "UTTAR PRADESH");
  final TextEditingController addressController = TextEditingController(text: "Noida");
  final TextEditingController gstinController = TextEditingController();

  // Profession dropdown
  String selectedProfession = "Affiliate";
  List<String> professionList = ["Affiliate", "Agent", "Manager"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(
                controller: organizationTypeController,
                label: "Organization Type",
                icon: Icons.ac_unit,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: partnerCodeController,
                label: "Partner Code",
                icon: Icons.person_add_alt_sharp,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: partnerEmployeeCodeController,
                label: "Partner Employee Code",
                icon: Icons.people,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: nameController,
                label: "Name",
                icon: Icons.drive_file_rename_outline,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: mobileNumberController,
                label: "Mobile Number",
                icon: Icons.phone ,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: panController,
                label: "PAN Number *",
                icon: Icons.credit_card,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: pincodeController,
                label: "Pincode *",
                icon: Icons.pin_drop,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: cityController,
                label: "City",
                icon: Icons.location_city,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: districtController,
                label: "District",
                icon: Icons.location_on,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: stateController,
                label: "State",
                icon: Icons.map,
              ),
              SizedBox(height: 10),
              // Dropdown for Profession
              DropdownButtonFormField(
                value: selectedProfession,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFe8f0fe),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
                ),
                items: professionList.map((String profession) {
                  return DropdownMenuItem(
                    value: profession,
                    child: Text(profession),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedProfession = newValue.toString();
                  });
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: addressController,
                label: "Address *",
                icon: Icons.home,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: gstinController,
                label: "GSTIN",
                icon: Icons.receipt,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("CANCEL", style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Submit action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: Text("APPLY", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function for building the text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        fillColor: Color(0XFFe8f0fe),
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10, left: 1),
          child: Material(
            elevation: 0,
            color: Colors.blue,
            shadowColor: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              topLeft: Radius.circular(5.0),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 60,
          minHeight: 50,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
