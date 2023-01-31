import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_task/core/constants/colors.dart';
import 'package:yuktidea_task/presentation/screens/login_screen.dart';
import 'package:yuktidea_task/presentation/widgets/k_large_button.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //Background Image
        Image.asset('assets/images/bg.png'),
        //Backdrop
        Container(
          color: kBlackColor.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.video_camera_back_rounded),
                      const SizedBox(width: 10),
                      Text(
                        'CINE COMPASS',
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'YOUR ONE STOP SOLUTION TO',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Rent Pre-Production Equipments Easily',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 40),
                    KLargeButton(
                      title: 'Get Started',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const LoginScreen()));
                      },
                    ),
                  ],
                ),
              ]),
        ),
      ],
    ));
  }
}
