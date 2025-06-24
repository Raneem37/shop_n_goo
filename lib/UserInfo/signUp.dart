import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/UserInfo/SignIn.dart';
import 'package:shop_n_goo/cubit/auth/auth_cubit.dart';
import 'package:shop_n_goo/cubit/auth/auth_states.dart';
import 'package:shop_n_goo/data/models/auth/request/register_request.dart';

class signUp extends StatefulWidget {
  static const String routeName = 'signUp';

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool isMale = false;
  bool isFemale = false;
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  void _navigateToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),child: signIn())),
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
    _password = password; // Save for confirmation check
    return null;
  }


  Widget _buildTextField({
    required TextEditingController controller,
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
          controller: controller,
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
                controller: firstNameController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'First Name',
                hint: 'Enter your first name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your first name'
                    : null,
              ),
              _buildTextField(
                controller: lastNameController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Last Name',
                hint: 'Enter your last name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your last name'
                    : null,
              ),
              _buildTextField(
                controller: emailController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Email or Phone Number',
                hint: 'Enter your email or phone number',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your email or phone number'
                    : null,
              ),
              _buildTextField(
                controller: passwordController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
                validator: validatePassword,
              ),
              _buildTextField(
                controller: passwordController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                label: 'Confirm Password',
                hint: 'Confirm your password',
                obscureText: true,
                validator: (value) => null,
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
              BlocListener<AuthCubit, AuthStates>(
                listener: (context, state) {
        if(state is AuthLoadingState)
        {

        }
        else if (state is AuthErrorState){

        }
        else if(state is AuthSuccessState){
        _navigateToSignIn();
        }
        },
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().register(RegisterRequest(firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          passwordController.text,
                          isMale ? "male" : (isFemale ? "female" : "")));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
