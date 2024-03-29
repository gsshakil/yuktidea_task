import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_task/core/constants/colors.dart';
import 'package:yuktidea_task/presentation/screens/otp_verification_screen.dart';
import 'package:yuktidea_task/presentation/screens/signup_screen.dart';
import 'package:yuktidea_task/presentation/widgets/k_large_button.dart';
import 'package:yuktidea_task/presentation/widgets/k_password_text_field.dart';
import 'package:yuktidea_task/presentation/widgets/k_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: _buildHeading(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          _buildLoginForm(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          _buildLoginButton(),
        ]),
      ),
    );
  }

  Column _buildLoginButton() {
    return Column(
      children: [
        KLargeButton(
          title: 'Login',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const OtpVerificationScreen()));
          },
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SignupScreen()));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style:
                    GoogleFonts.montserrat(color: kWhiteColor.withOpacity(0.5)),
              ),
              const SizedBox(width: 5),
              Text(
                'Signup',
                style: GoogleFonts.montserrat(color: kRedColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KTextField(
          controller: emailController,
          hintText: 'Email/Phone number',
        ),
        const SizedBox(height: 10),
        KPasswordTextField(
          controller: passwordController,
          hintText: 'Password',
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.montserrat(color: kWhiteColor.withOpacity(0.5)),
          ),
        )
      ],
    );
  }

  Column _buildHeading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome Back!',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Please sign in to your account',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
