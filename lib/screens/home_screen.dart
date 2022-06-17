import 'package:flutter/material.dart';
import 'package:otp/controller/otp_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Consumer<OtpController>(
        builder: (context, value, child) {
          return
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('${value.phone}'),
              const SizedBox(
                height: 20,
              ),
             Text('${value.verificationCode}'),
           ],
         ),
       );},
      ),
    );
  }
}
