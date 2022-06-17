import 'package:flutter/material.dart';
import 'package:otp/controller/otp_controller.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Phone Authentication'),
      ),
      body: Consumer<OtpController>(
        builder: (context, value, child) {
          return Container(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        labelText: 'Phone number',
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.phone,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        value.phone = phoneNumber.text;

                      await  value.verifyPhone(context);

                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Get OTP"),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),


    );
  }
}
