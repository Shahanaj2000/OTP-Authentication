import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phoneauth_firebase/Screens/homeScreen.dart';
import 'package:phoneauth_firebase/Widgets/customButton.dart';
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
  String? otpCode;
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
                 Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(text: "Verify", onPressed: () {},),
                ),
                const SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text(
                      "Did't received any code ?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                     const SizedBox(width: 10,),
                     InkWell(
                      onTap: () {
                        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
                      },
                       child: const Text(
                        "Resend New Code",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent
                        ),
                       ),
                     ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
