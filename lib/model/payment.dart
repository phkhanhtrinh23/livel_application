import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/view/home_screens/components/trip_content/trip_main.dart';
import 'package:stripe_payment/stripe_payment.dart';

class Stripe extends StatefulWidget {
  final String id, uid, cost;

  const Stripe(this.id, this.uid, this.cost);

  @override
  StripeState createState() => new StripeState(id, uid, cost);
}

class StripeState extends State<Stripe> {
  final String id, uid, cost;

  StripeState(this.id, this.uid, this.cost);

  Token _paymentToken;
  String _error;
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
            margin: const EdgeInsets.only(bottom: 180),
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            width: _width,
            height: 148,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color(0xFF289CB4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Text(
                  'Payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
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
                      "Credit Card",
                      style: TextStyle(
                        color: Color(0xFF289CB4),
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      StripePayment.paymentRequestWithNativePay(
                        androidPayOptions: AndroidPayPaymentRequest(
                          totalPrice: this.cost,
                          currencyCode: "USD",
                        ),
                        applePayOptions: ApplePayPaymentOptions(
                          countryCode: 'US',
                          currencyCode: 'USD',
                          items: [
                            ApplePayItem(
                              label: 'Test',
                              amount: this.cost,
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
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Completed successfully')));
                        }).catchError(setError);
                      }).catchError(setError);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
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
                      'Free',
                      style: TextStyle(
                        color: Color(0xFF289CB4),
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(uid)
                          .update(
                        {
                          "TripList": FieldValue.arrayUnion([id])
                        },
                      );
                      await FirebaseFirestore.instance
                          .collection('Trips')
                          .doc(id)
                          .update(
                        {
                          "UserList": FieldValue.arrayUnion([uid])
                        },
                      );
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                            'This trip has successfully been added to your list.',
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  color: Color(0xFF289CB4),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                          ],
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => TripContent(
                            id: this.id,
                            checkHomeScreen: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
