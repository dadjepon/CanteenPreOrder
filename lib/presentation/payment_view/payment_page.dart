import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:canteen_preorderapp/models/payment_service/api_key.dart';
import 'package:canteen_preorderapp/models/payment_service/paystack_auth_response.dart';
import 'package:canteen_preorderapp/models/payment_service/transaction.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.amount,
    required this.email,
    required this.reference,
  });

  final String amount;
  final String email;
  final String reference;

  @override
  State<PaymentPage> createState() => _PaymentPage();
}

class _PaymentPage extends State<PaymentPage> {
  Future<PayStackAuthResponse> createTransaction(
      Transaction transaction) async {
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
        final responseData = jsonDecode(response.body);
        if (responseData['data']['gateway_response'] == 'Approved') {
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
      final transaction = Transaction(
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
