import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
//import 'package:pinput/pinput.dart';

class OTPSCREEN extends StatefulWidget {
  //!
  final String verificationId;
  const OTPSCREEN({super.key, required this.verificationId});

  @override
  State<OTPSCREEN> createState() => _OTPSCREENState();
}

class _OTPSCREENState extends State<OTPSCREEN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //<- Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                ),

                Container(
                  width: 200,
                  height: 250,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue.shade50),
                  child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_nc1bp7st.json"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter the OTP send to your phone number.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Pinput()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
