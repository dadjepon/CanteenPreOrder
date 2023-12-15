import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class StaffItem {
  final String documentId;
  final String customerEmail;
  final String customerName;
  final String institutionId;
  final String cafeteria;

  StaffItem({ required this.cafeteria,
    required this.documentId,
    required this.customerEmail,
    required this.customerName,
    required this.institutionId,
  });

    StaffItem.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        customerEmail = snapshot.data()[customerEmailField],
        customerName = snapshot.data()[customerNameField],
        institutionId = snapshot.data()[institutionIdField],
        cafeteria = snapshot.data()[cafeteriaField];
}