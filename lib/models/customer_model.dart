import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class CustomerItem {
  final String documentId;
  final String customerEmail;
  final String customerName;

  const CustomerItem({
    required this.documentId,
    required this.customerEmail,
    required this.customerName,
  });

  CustomerItem.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        customerEmail = snapshot.data()[customerEmailField],
        customerName = snapshot.data()[customerNameField];
}
