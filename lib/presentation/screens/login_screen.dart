import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_task/core/constants/colors.dart';
import 'package:yuktidea_task/presentation/widgets/k_large_button.dart';
import 'package:yuktidea_task/presentation/widgets/k_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
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
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KTextField(
                    controller: emailController,
                    hintText: 'Email/Phone number',
                  ),
                  const SizedBox(height: 10),
                  KTextField(
                    controller: emailController,
                    hintText: 'Email/Phone number',
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.montserrat(
                          color: kWhiteColor.withOpacity(0.5)),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const KLargeButton(
                    title: 'Login',
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: GoogleFonts.montserrat(
                              color: kWhiteColor.withOpacity(0.5)),
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
              ),
            ]),
      ),
    );
  }
}
