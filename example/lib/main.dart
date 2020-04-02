import 'package:flutter/material.dart';
import 'package:momo_payment_plugin/momo_payment_data.dart';
import 'package:momo_payment_plugin/momo_payment_plugin.dart';
import 'package:momo_payment_plugin/momo_payment_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MomoPaymentResult _momoPaymentResult;
  final color = const Color(0xffAF2170);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  side: BorderSide(
                    width: 1,
                    color: color,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  'Payment with momo',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await _doPaymentWithMomoWallet();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('Phone: ${_momoPaymentResult?.phonenumber ?? '---'}'),
              Text('Token: ${_momoPaymentResult?.token ?? '---'}'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _doPaymentWithMomoWallet() async {
    MomoPaymentData momoPaymentData = MomoPaymentData(
      appScheme: "your_appScheme",
      merchantname: "your_merchantname",
      merchantcode: 'your_merchantcode',
      amount: 2000,
      orderId: 'orderId',
      orderLabel: 'orderLabel',
      merchantnamelabel: "sdsds",
      fee: 200,
      description: null,
      requestId: 'requestId',
      partnerCode: 'your_partnerCode',
    );

    MomoPaymentResult momoPaymentResult =
        await MomoPaymentPlugin().requestPayment(momoPaymentData);

    setState(() {
      _momoPaymentResult = momoPaymentResult;
    });
  }
}
