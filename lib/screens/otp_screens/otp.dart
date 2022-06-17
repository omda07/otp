import 'package:flutter/material.dart';
import 'package:otp/controller/otp_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';


class Otp extends StatelessWidget {

   Otp( {Key? key}) : super(key: key);



  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    //color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('OTP Verification'),

      ),
      body: Consumer<OtpController>(
        builder: (context, value, child) {
          print(value.phone);
          return  Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Verify ${value.phone}',
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Pinput(
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  pinAnimationType: PinAnimationType.fade,
                  length: 6,
                  onSubmitted: (pin) async {


                  },
                ),
              ),

              ElevatedButton(onPressed: (){
                value.verifyOtp( context, _pinPutController.text);
              },style: ElevatedButton.styleFrom(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

              ), child:const Text('Submit'),),

            ],
          );
        }

      ),
    );
  }


}
