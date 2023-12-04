import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class CartItem {
  final String foodItemId;
  final String documentId;
  final int quantity;
  final String foodName;
  final String foodDescription;
  final String foodImage;
  final String cafeteria;
  final String price;

  const CartItem({
    required this.documentId,
    required this.foodItemId,
    required this.quantity,
    required this.foodName,
    required this.foodDescription,
    required this.foodImage,
    required this.cafeteria,
    required this.price,
  });

  CartItem.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        foodItemId = snapshot.data()[foodItemIdField],
        foodName = snapshot.data()[foodNameField],
        foodDescription = snapshot.data()[foodDescriptionField],
        quantity = snapshot.data()[quantityField],
        foodImage = snapshot.data()[foodImageField],
        cafeteria = snapshot.data()[cafeteriaField],
        price = snapshot.data()[priceField];
}
