import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '99.99',
        status: PaymentItemStatus.final_price,
      )
    ];

    void onGooglePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: GooglePayButton(
            width: 200,
            height: 60,
            paymentConfigurationAsset:
                'google_pay.json',
            paymentItems: _paymentItems,
            style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: onGooglePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
