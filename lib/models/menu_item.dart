import 'package:canteen_preorderapp/models/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class MenuItem {
  final String menuItemId;
  final String foodID;
  final String availabilityStatus;
  final String price;
  final String menuType;
  final String cafeteria;
  final String foodDescription;
  final String foodName;
  final String foodImage;

  const MenuItem({
    required this.menuItemId,
    required this.foodID,
    required this.availabilityStatus,
    required this.price,
    required this.menuType,
    required this.cafeteria,
    required this.foodDescription,
    required this.foodName,
    required this.foodImage,
  });

  MenuItem.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : menuItemId = snapshot.id,
        cafeteria = snapshot.data()[cafeteriaField],
        foodID = snapshot.data()[foodIDField],
        availabilityStatus = snapshot.data()[availabilityStatusField],
        price = snapshot.data()[priceField],
        menuType = snapshot.data()[menuTypeField],
        foodImage = snapshot.data()[foodImageField],
        foodName = snapshot.data()[foodNameField],
        foodDescription = snapshot.data()[foodDescriptionField];
}
