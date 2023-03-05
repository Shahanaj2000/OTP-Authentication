import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phoneauth_firebase/Widgets/customButton.dart';
import 'package:phoneauth_firebase/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //! PhoneNo. TEC
  final TextEditingController phoneController = TextEditingController();

  //! Country Picker
  Country selectedCoutry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "e164Key");
  @override
  Widget build(BuildContext context) {
    //! To avoid reverse order no. typing
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  "Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Add your phone number we'll send you verification code.",
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

                //!TextForm
                TextFormField(
                  controller: phoneController,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey.shade600),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black12)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black12)),
                      //! Country code
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(14),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 500, flagSize: 20),
                              onSelect: (value) {
                                setState(() {
                                  selectedCoutry = value;
                                });
                              },
                            );
                          },
                          child: Text(
                            "${selectedCoutry.flagEmoji} + ${selectedCoutry.phoneCode}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //! For Verification
                      suffixIcon: phoneController.text.length > 9
                          ? Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 16,
                              ),
                            )
                          : null),
                ),

                const SizedBox(
                  height: 20,
                ),

                //! Custom Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    text: "LogIn",
                    onPressed: () {
                      sendPhoneNumber();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  //! Sending the phoneNO.
  void sendPhoneNumber() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    authProvider.sigInWithPhone(context, "+ ${selectedCoutry.phoneCode} $phoneNumber"); 
  }


}
