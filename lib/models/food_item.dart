import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class FoodItem {
  final String documentId;
  final String foodName;
  final String foodImage;
  final String foodDescription;

  const FoodItem({
    required this.documentId,
    required this.foodName,
    required this.foodImage,
    required this.foodDescription,
  });

  FoodItem.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        foodName = snapshot.data()[foodNameField],
        foodImage = snapshot.data()[foodImageField],
        foodDescription = snapshot.data()[foodDescriptionField];
}
