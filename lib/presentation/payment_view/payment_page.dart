import 'dart:convert';


import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';


import 'package:canteen_preorderapp/models/database_service.dart';


import 'package:flutter/material.dart';


import 'package:webview_flutter/webview_flutter.dart';


import 'package:canteen_preorderapp/models/payment_service/api_key.dart';


import 'package:canteen_preorderapp/models/payment_service/paystack_auth_response.dart';


import 'package:canteen_preorderapp/models/payment_service/transaction.dart'

    as transact;


import 'package:http/http.dart' as http;


class PaymentPage extends StatefulWidget {

  const PaymentPage({

    super.key,

    required this.amount,

    required this.email,

    required this.reference,

    required this.orderId,

  });


  final String amount;


  final String email;


  final String reference;


  final String orderId;


  @override

  State<PaymentPage> createState() => _PaymentPage();

}


class _PaymentPage extends State<PaymentPage> {

  late final DatabaseService _dataService;


  @override

  void initState() {

    _dataService = DatabaseService();


    super.initState();

  }


  @override

  void dispose() {

    verifyTransaction(widget.reference);


    super.dispose();

  }


  Future<PayStackAuthResponse> createTransaction(

      transact.Transaction transaction) async {

    const String url = 'https://api.paystack.co/transaction/initialize';


    final data = transaction.toJson();


    try {

      final response = await http.post(

        Uri.parse(url),

        headers: {

          'Authorization': 'Bearer ${ApiKey.secretKey}',

          'Content-Type': 'application/json',

        },

        body: jsonEncode(data),

      );


      if (response.statusCode == 200) {

        print(response.body);


        // Payment initialization successful


        final responseData = jsonDecode(response.body);


        return PayStackAuthResponse.fromJson(responseData['data']);

      } else {

        throw 'Payment unsuccessful - status code not 200';

      }

    } on Exception {

      throw 'Payment Unsuccessful - some exception';

    }

  }


  Future<bool> verifyTransaction(String reference) async {

    final String url = 'https://api.paystack.co/transaction/verify/$reference';


    try {

      final response = await http.get(Uri.parse(url), headers: {

        'Authorization': 'Bearer ${ApiKey.secretKey}',

        'Content-Type': 'application/json'

      });


      if (response.statusCode == 200) {

        DateTime timestamp = DateTime.now();


        final responseData = jsonDecode(response.body);


        if (responseData['data']['gateway_response'] == 'Approved') {

          await _dataService.savePaymentData(

              orderId: widget.orderId,

              paymentId: responseData['data']['id'].toString(),

              status: responseData['data']['status'].toString(),

              reference: widget.reference,

              amount: widget.amount,

              gateWayResponse:

                  responseData['data']['gateway_response'].toString(),

              receiptNumber: responseData['data']['receipt_number'].toString());


          await _dataService.fromCartToOrders(

              userId: FirebaseAuthService().currentUser!.id,

              orderId: widget.orderId,

              paymentRef: reference,

              amount: widget.amount,

              orderStage: '1',

              timestamp: timestamp.toString());


          return true;

        } else {

          return false;

        }

      } else {

        return false;

      }

    } on Exception {

      return false;

    }

  }


  Future<String> initializeTransaction() async {

    try {

      final price = double.parse(widget.amount);


      final transaction = transact.Transaction(

        amount: (price * 100).toString(),

        reference: widget.reference,

        currency: 'GHS',

        email: widget.email,

      );


      final authResponse = await createTransaction(transaction);


      return authResponse.authorization_url;

    } catch (e) {

      print('Error initializing transaction: $e');


      return e.toString();

    }

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

        body: SafeArea(

      child: FutureBuilder(

        future: initializeTransaction(),

        builder: (context, snapshot) {

          if (snapshot.hasData) {

            final url = snapshot.data as String;


            return WebViewWidget(

              controller: WebViewController()..loadRequest(Uri.parse(url)),

            );

          } else {

            return Column(

              children: [

                const Center(child: CircularProgressIndicator()),

                const Center(child: Text("Redirecting to Payment gateway")),

              ],

            );

          }

        },

      ),

    ));

  }

}

