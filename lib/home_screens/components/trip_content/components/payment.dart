import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart' as fb;
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:io';

import '../trip_main.dart';

class Stripe extends StatefulWidget {
  final String id, uid;
  const Stripe(this.id, this.uid);
  @override
  StripeState createState() => new StripeState(id, uid);
}

class StripeState extends State<Stripe> {
  final String id, uid;
  StripeState(this.id, this.uid);
  Token _paymentToken;
  PaymentMethod _paymentMethod;
  String _error;
  final String _paymentIntentClientSecret = null;

  PaymentIntentResult _paymentIntent;
  Source _source;

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
        publishableKey:
            "pk_test_51IZTswGPnwrBENOaTocWU9VHZ2HIu7ZF1MnMl4menHiHuaXjSs9Jwq2By6XhSElNE6jRqeA1lUEfeLm8PEHr40LI00kBKUqpYe",
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
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 160),
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            width: _width,
            height: 148,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color(0xFF4EAFC1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _source = null;
                          _paymentIntent = null;
                          _paymentMethod = null;
                          _paymentToken = null;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 330,
                height: 68,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Color(0xFF477983),
                    width: 2,
                  ),
                ),
                child: TextButton(
                  child: Text(
                    "Native payment",
                    style: TextStyle(
                      color: Color(0xFF4EAFC1),
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {
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
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('Received ${token.tokenId}')));
                        _paymentToken = token;
                      });
                      StripePayment.completeNativePayRequest().then((_) {
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text('Completed successfully')));
                      }).catchError(setError);
                    }).catchError(setError);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
              ),
              Container(
                width: 330,
                height: 68,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Color(0xFF477983),
                    width: 2,
                  ),
                ),
                child: TextButton(
                  child: Text(
                    'Join for free',
                    style: TextStyle(
                      color: Color(0xFF4EAFC1),
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {
                    fb.FirebaseFirestore.instance
                        .collection('Users')
                        .doc(uid)
                        .update({
                      "TripList": fb.FieldValue.arrayUnion([id])
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            TripContent(id: this.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
