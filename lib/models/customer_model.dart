import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class CustomerItem {
  final String documentId;
  final String customerEmail;
  final String customerName;
  final String customerPhoneNumber;
  final String institutionId;
  String role;

  CustomerItem({
    required this.documentId,
    required this.customerEmail,
    required this.customerName,
    required this.customerPhoneNumber,
    required this.institutionId,
    required this.role,
  });

  CustomerItem.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        customerEmail = snapshot.data()[customerEmailField],
        customerName = snapshot.data()[customerNameField],
        institutionId = snapshot.data()[institutionIdField],
        customerPhoneNumber = snapshot.data()[customerPhoneNumberField],
        role = snapshot.data()[roleField];
}
