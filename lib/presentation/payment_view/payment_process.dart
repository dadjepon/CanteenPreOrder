import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/presentation/payment_view/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentProcess {
  PaymentProcess({
    required this.orderID,
    required this.amount,
    required this.userId,
    required this.cafeteria,
    required this.email,
    required this.reference,
  }) {}

  final String orderID;
  final String amount;
  final String userId;
  final String cafeteria;
  final String email;
  final String reference;
  String selectedDeliveryOption = '';
  String selectedPaymentMethod = '';
  String deliveryLocation = '';
  int deliveryFee = 10;

  final DatabaseService _dataService = DatabaseService();

  TextEditingController locationController = TextEditingController();
  TextEditingController paymentDetailsController = TextEditingController();

  Future<void> initiatePaymentProcess(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Delivery Option'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildOptionTile('Pickup', context),
                _buildOptionTile('Delivery', context),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Color(0xFF6B0808)),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOptionTile(String option, BuildContext context) {
    return ListTile(
      title: Text(
        option,
        style: GoogleFonts.ubuntu(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      hoverColor: Color.fromARGB(255, 241, 164, 164),
      onTap: () {
        selectedDeliveryOption = option;
        if (selectedDeliveryOption == "Pickup") {
          Navigator.of(context).pop();
          showPaymentOptionsDialog(context);
        } else {
          Navigator.of(context).pop();
          showLocationEntryDialog(context);
        }
      },
    );
  }

  Future<void> showPaymentOptionsDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Options'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildPaymentOptionTile('Mobile Money Payment', context),
                _buildPaymentOptionTile('Cash Payment', context),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B0808))),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                initiatePaymentProcess(context);
              },
              child: Text('Back',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B0808))),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPaymentOptionTile(String paymentMethod, BuildContext context) {
    return ListTile(
      title: Text(paymentMethod),
      onTap: () {
        Navigator.of(context).pop();
        selectedPaymentMethod = paymentMethod;
        if (selectedPaymentMethod == 'Mobile Money Payment') {
          showPaymentDetailsDialog(context);
        } else {
          showPolicyInformation(context);
        }
      },
    );
  }

  Future<void> showPaymentDetailsDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment',
              style: GoogleFonts.ubuntu(
                  fontSize: 15, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              selectedDeliveryOption == "Delivery"
                  ? Center(
                      child: Column(
                      children: [
                        Text("Payment Breakdown",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("Delivery: GHS ${deliveryFee}",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("Food: GHS ${amount}",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("Total: GHS ${int.parse(amount) + deliveryFee}",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6B0808))),
                      ],
                    ))
                  : Center(
                      child: Column(
                      children: [
                        Text("Payment Breakdown",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("Food: GHS ${amount}",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("Total: GHS ${int.parse(amount)}",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6B0808))),
                      ],
                    )),
              Text(
                  '\nYou will be redirected to a secure page to perform your transaction',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B0808))),
            ),
            TextButton(
              onPressed: () {
                // Add logic to process mobile money payment
                _processMobileMoneyPayment(context);
                Navigator.of(context).pop();
              },
              child: Text('Proceed',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B0808))),
            ),
          ],
        );
      },
    );
  }

  Future<void> showLocationEntryDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delivery Location'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Please enter your current location on Campus(State Building + Room Number):'),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B0808))),
            ),
            TextButton(
              onPressed: () {
                // Set the delivery location
                deliveryLocation = locationController.text;
                if (deliveryLocation != "") {
                  Navigator.of(context).pop();
                  showPaymentOptionsDialog(context);
                }
              },
              child: Text('Next',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B0808))),
            ),
          ],
        );
      },
    );
  }

  void _processMobileMoneyPayment(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(
          orderId: orderID,
          amount: selectedDeliveryOption == "Delivery"
              ? '${int.parse(amount) + deliveryFee}'
              : amount,
          userId: userId,
          cafeteria: cafeteria,
          email: email,
          reference: reference,
          delivery: selectedDeliveryOption,
          location:
              selectedDeliveryOption == "Delivery" ? deliveryLocation : "NA",
        ),
      ),
    );
  }

  void _redirectToPaymentPage() {
    // Add your logic to navigate to the payment page
  }

  void _redirectToMobileMoneyPaymentPage() {
    // Add your logic to navigate to the mobile money payment page
  }

  void showPolicyInformation(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('PLEASE NOTE',
              style: GoogleFonts.ubuntu(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B0808))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'It is a serious matter that will be escalated to AJC to order and not show up for your pickup or delivery.'),
              Text('Ensure to honor your commitment.'),
              Center(
                  child: Column(
                children: [
                  Text("Payment Breakdown",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  Text("Food: ${amount}",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  Text("Total: GHS ${amount}",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B0808))),
                ],
              )),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                int timestamp = DateTime.now().millisecondsSinceEpoch;
                await _dataService.fromCartToOrders(
                    userId: FirebaseAuthService().currentUser!.id,
                    orderId: orderID,
                    paymentRef:
                        "${timestamp}_${FirebaseAuthService().currentUser!.id}_pod",
                    amount: selectedDeliveryOption == "Delivery"
                        ? '${int.parse(amount) + deliveryFee}'
                        : amount,
                    orderStage: '0',
                    cafeteria: cafeteria,
                    email: email,
                    delivery: selectedDeliveryOption,
                    location: selectedDeliveryOption == "Delivery"
                        ? deliveryLocation
                        : "NA",
                    timestamp: timestamp.toString());
                Navigator.of(context).pop();
              },
              child: Text('OK',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B0808))),
            ),
          ],
        );
      },
    );
  }
}
