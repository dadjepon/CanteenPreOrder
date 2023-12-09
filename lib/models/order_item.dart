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

  const OrderItem({
    required this.orderId,
    required this.orderComponents,
    required this.amount,
    required this.timestamp,
    required this.orderStage,
  });

  OrderItem.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : orderId = snapshot.data()[orderIdField],
        orderComponents = snapshot.data()[orderCollectionField],
        amount = snapshot.data()[amountField],
        timestamp = snapshot.data()[timestampField],
        orderStage = snapshot.data()[orderStageField];
}
