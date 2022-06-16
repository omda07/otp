import 'package:flutter/material.dart';
import 'package:otp/otp.dart';

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
          backgroundColor: Colors.black45,
          title: const Text('Phone Authentication'),
        ),
        body: Container(
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

                const SizedBox(height: 10,),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)
                      => Otp(phoneNumber.text),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Get OTP"),
                  ),
                ),
              ],
            ),
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
