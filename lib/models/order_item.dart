import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class OrderItem {
  final String orderId;
  final orderComponents;
  final String amount;
  final String timestamp;
  final String orderStage;
  final String email;
  final String cafeteria;
  final String docId;
  final String deliveryOption;
  final String location;

  const OrderItem({
    required this.orderId,
    required this.orderComponents,
    required this.amount,
    required this.timestamp,
    required this.orderStage,
    required this.email,
    required this.cafeteria,
    required this.docId,
    required this.deliveryOption,
    required this.location,
  });

  OrderItem.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : docId = snapshot.id,
      orderId = snapshot.data()[orderIdField],
        orderComponents = snapshot.data()[orderCollectionField],
        amount = snapshot.data()[amountField],
        timestamp = snapshot.data()[timestampField],
        orderStage = snapshot.data()[orderStageField],
        email = snapshot.data()[customerEmailField],
        cafeteria = snapshot.data()[cafeteriaField],
        location = snapshot.data()[locationField],
        deliveryOption = snapshot.data()[deliveryOptionField];
        
}
