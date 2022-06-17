import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/otp_controller.dart';
import 'screens/otp_screens/otp_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<OtpController>(
      create: (_) => OtpController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTP',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const OtpScreen(),
    );
  }
}
