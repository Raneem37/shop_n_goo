import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/UserInfo/SignIn.dart';

class signUp extends StatefulWidget {
  static const String routeName = 'signUp';

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool isMale = false;
  bool isFemale = false;
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  void _navigateToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => signIn()),
    );
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    final password = value.trim();

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    _password = password; // Save for confirmation check
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value.trim() != _password) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required double screenWidth,
    required double screenHeight,
    required FormFieldValidator<String> validator,
    bool obscureText = false,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.schibstedGrotesk(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkGreen,
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.darkGreen, width: 2),
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.darkGreen, width: 2),
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
            ),
            hintText: hint,
          ),
          validator: validator,
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Create New Account",
          style: GoogleFonts.schibstedGrotesk(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkGreen,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'First Name',
                hint: 'Enter your first name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your first name'
                    : null,
              ),
              _buildTextField(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Last Name',
                hint: 'Enter your last name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your last name'
                    : null,
              ),
              _buildTextField(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Email or Phone Number',
                hint: 'Enter your email or phone number',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your email or phone number'
                    : null,
              ),
              _buildTextField(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
                validator: validatePassword,
              ),
              _buildTextField(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Confirm Password',
                hint: 'Confirm your password',
                obscureText: true,
                validator: validateConfirmPassword,
              ),
              Text(
                'Gender',
                style: GoogleFonts.schibstedGrotesk(
                  fontSize: screenWidth * 0.045,
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
                  SizedBox(width: screenWidth * 0.1),
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
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _navigateToSignIn();
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.darkGreen,
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  ),
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: GoogleFonts.schibstedGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
