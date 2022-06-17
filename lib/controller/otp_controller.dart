import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/otp_screens/otp.dart';

class OtpController with ChangeNotifier {
  String? phone;
  String? verificationCode ;

  Future<void> verifyPhone(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone!,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            notifyListeners();
          }).catchError((onError){
            print(onError);
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          verificationCode = verficationID;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(),
            ),
          );
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationCode = verificationID;
          notifyListeners();
        },
        timeout: const Duration(seconds: 120));
  }

  Future<void> verifyOtp(BuildContext context, String pin) async {
    print(verificationCode);
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verificationCode!, smsCode: pin))
        .then((value) async {

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
      notifyListeners();
    }).catchError((e) {
      FocusScope.of(context).unfocus();

      print(e.toString());
      notifyListeners();
    });
  }
}
