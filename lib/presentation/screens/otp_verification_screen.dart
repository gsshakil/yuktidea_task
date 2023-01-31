import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yuktidea_task/core/constants/colors.dart';
import 'package:yuktidea_task/presentation/screens/home_screen.dart';
import 'package:yuktidea_task/presentation/widgets/k_large_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          _buildOTPForm(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          KLargeButton(
            title: 'Verify',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const HomeScreen()));
            },
          ),
        ]),
      ),
    );
  }

  Container _buildOTPForm() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PinCodeTextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              animationType: AnimationType.fade,
              hintStyle: const TextStyle(color: Colors.red),
              scrollPadding: const EdgeInsets.all(0),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 65,
                fieldWidth: 65,
                activeColor: kBlackColor,
                inactiveColor: Theme.of(context).scaffoldBackgroundColor,
                selectedColor: kBlackColor,
                activeFillColor: Theme.of(context).scaffoldBackgroundColor,
                selectedFillColor: kBlackColor,
                inactiveFillColor: kBlackColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (pin) async {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                return true;
              },
            ),
          ),
          SizedBox(
            height: 20,
            child: ArgonTimerButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              initialTimer: 60,
              height: 50,
              width: MediaQuery.of(context).size.width,
              minWidth: MediaQuery.of(context).size.width,
              elevation: 0,
              borderRadius: 30.0,
              child: Text(
                'RESEND OTP',
                style: GoogleFonts.montserrat(),
              ),
              loader: (timeLeft) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Resend OTP in",
                      style: GoogleFonts.montserrat(),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$timeLeft seconds",
                      style: GoogleFonts.montserrat(color: kRedColor),
                    ),
                  ],
                );
              },
              onTap: (startTimer, btnState) async {
                if (btnState == ButtonState.Idle) {}
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Column _buildHeading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Verify Your Number',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Enter the OTP recieved on your number',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
