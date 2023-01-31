import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_task/core/constants/colors.dart';
import 'package:yuktidea_task/presentation/widgets/k_large_button.dart';
import 'package:yuktidea_task/presentation/widgets/k_password_text_field.dart';
import 'package:yuktidea_task/presentation/widgets/k_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: _buildHeading(),
          ),
          _buildSignUpForm(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _buildSignUpButton(),
        ]),
      ),
    );
  }

  Column _buildSignUpButton() {
    return Column(
      children: [
        KLargeButton(
          title: 'Sign Up',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style:
                    GoogleFonts.montserrat(color: kWhiteColor.withOpacity(0.5)),
              ),
              const SizedBox(width: 5),
              Text(
                'Login',
                style: GoogleFonts.montserrat(color: kRedColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column _buildSignUpForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KTextField(
          controller: nameController,
          hintText: 'Name',
        ),
        const SizedBox(height: 10),
        KTextField(
          controller: emailController,
          hintText: 'Email',
        ),
        const SizedBox(height: 10),
        KTextField(
          controller: phoneController,
          hintText: 'Phone number',
        ),
        const SizedBox(height: 10),
        KPasswordTextField(
          controller: passwordController,
          hintText: 'Password',
        ),
        const SizedBox(height: 10),
        KPasswordTextField(
          controller: confirmPasswordController,
          hintText: 'Confirm Password',
        ),
      ],
    );
  }

  Column _buildHeading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Create New Account',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Fill in the form to continue',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
