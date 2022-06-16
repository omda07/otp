import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp/otp.dart';
import 'package:otp/otp_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home:  OtpScreen() ,
    );
  }
}

