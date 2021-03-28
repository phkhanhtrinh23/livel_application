import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:io';

class Stripe extends StatefulWidget {
  @override
  StripeState createState() => new StripeState();
}

class StripeState extends State<Stripe> {
  Token _paymentToken;
  PaymentMethod _paymentMethod;
  String _error;
  final String _paymentIntentClientSecret = null;

  PaymentIntentResult _paymentIntent;
  Source _source;

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 21,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey: "pk_test_51IZTswGPnwrBENOaTocWU9VHZ2HIu7ZF1MnMl4menHiHuaXjSs9Jwq2By6XhSElNE6jRqeA1lUEfeLm8PEHr40LI00kBKUqpYe",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  void setError(dynamic error) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text('Payment'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _source = null;
                  _paymentIntent = null;
                  _paymentMethod = null;
                  _paymentToken = null;
                });
              },
            )
          ],
        ),
        body: ListView(
          controller: _controller,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Divider(),
            TextButton(
              child: Text("Native payment"),
              onPressed: () {
                if (Platform.isIOS) {
                  _controller.jumpTo(450);
                }
                StripePayment.paymentRequestWithNativePay(
                  androidPayOptions: AndroidPayPaymentRequest(
                    totalPrice: "0",
                    currencyCode: "USD",
                  ),
                  applePayOptions: ApplePayPaymentOptions(
                    countryCode: 'US',
                    currencyCode: 'USD',
                    items: [
                      ApplePayItem(
                        label: 'Test',
                        amount: '0',
                      )
                    ],
                  ),
                ).then((token) {
                  setState(() {
                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text('Received ${token.tokenId}')));
                    _paymentToken = token;
                  });
                  StripePayment.completeNativePayRequest().then((_) {
                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text('Completed successfully')));
                  }).catchError(setError);
                }).catchError(setError);
              },
            ),
          ],
        ),
      ),
    );
  }
}