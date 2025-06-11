import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_n_goo/Tabs/Settings/ProfileTab.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/UserInfo/SignIn.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = 'signUp';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isMale = false;
  bool isFemale = false;



  Widget _buildTextField({
    required String label,
    required FormFieldValidator<String> validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.schibstedGrotesk(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkGreen,
          ),
        ),
        const SizedBox(height:4),
        TextFormField(

          decoration: InputDecoration(
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.darkGreen, width: 2,),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.darkGreen, width: 2,),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),

          ),
          validator: validator,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.schibstedGrotesk(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkGreen,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              label: 'Email or Phone Number',
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your contact info' : null,
            ),
            _buildTextField(
              label: 'Name you want to appear',
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your name' : null,
            ),
            _buildTextField(
              label: 'Old Password',
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your old password' : null,
            ),
            _buildTextField(
              label: 'New Password',
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your new password' : null,
            ),
            _buildTextField(
              label: 'Confirm Password',
              validator: (value) =>
              value == null || value.isEmpty ? 'Please confirm your password' : null,
            ),
            const SizedBox(height: 16),
            Text(
              'Gender',
              style: GoogleFonts.schibstedGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkGreen,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isMale,
                  activeColor: AppTheme.darkGreen,
                  onChanged: (value) {
                    setState(() {
                      isMale = value ?? false;
                      if (isMale) isFemale = false;
                    });
                  },
                ),
                const Text("Male"),
                const SizedBox(width: 20),
                Checkbox(
                  value: isFemale,
                  activeColor: AppTheme.darkGreen,
                  onChanged: (value) {
                    setState(() {
                      isFemale = value ?? false;
                      if (isFemale) isMale = false;
                    });
                  },
                ),
                const Text("Female"),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.darkGreen,
                  padding: const EdgeInsets.symmetric(vertical:10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Profiletab.routeName);
                },
                child: Text(
                  "Confirm",
                  style: GoogleFonts.schibstedGrotesk(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppTheme.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04), // Dynamic spacing at bottom
          ],
        ),
      ),
    );
  }

}
