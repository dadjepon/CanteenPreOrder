import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class FoodItem {
  final String documentId;
  final String foodImage;
  final String foodDescription;
  final String price;
  final String foodName;
  final String cafeteria;

  const FoodItem({
    required this.documentId,
    required this.foodImage,
    required this.foodDescription,
    required this.price,
    required this.foodName,
    required this.cafeteria,
  });

  FoodItem.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        cafeteria = snapshot.data()[cafeteriaField],
        foodImage = snapshot.data()[foodImageField],
        foodDescription = snapshot.data()[foodDescriptionField],
        price = snapshot.data()[priceField],
        foodName = snapshot.data()[foodNameField];
}
