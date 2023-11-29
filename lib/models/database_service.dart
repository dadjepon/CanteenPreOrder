import 'package:canteen_preorderapp/core/constants/constants.dart';
import 'package:canteen_preorderapp/models/customer_model.dart';
import 'package:canteen_preorderapp/models/food_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final menu = FirebaseFirestore.instance.collection('menu');
  final users = FirebaseFirestore.instance.collection('users');

  Stream<Iterable<FoodItem>> allFoods() => menu
      .snapshots()
      .map((event) => event.docs.map((doc) => FoodItem.fromSnapshot(doc)));

  Future<CustomerItem> getUser({required String userId}) async {
    return users
        .where(FieldPath.documentId, isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) {
      final documents = querySnapshot.docs;
      if (documents.isEmpty) {
        // handle error when no document is found
        throw CouldNotFindUserException();
      }
      return CustomerItem.fromSnapshot(documents.first);
    }).first;
  }

  Future<void> addFoodItem(
      {required String foodName,
      required String foodDescription,
      required String foodImage,
      required String cafeteria,
      required String price,
      required String timestamp}) async {
    await menu.add({
      'cafeteria': cafeteria,
      'foodDescription': foodDescription,
      'price': price,
      'foodName': foodName,
      'foodImage': foodImage,
      'timestamp': timestamp,
    });
  }

  //creating a singleton to mantains the same instance across the application
  static final DatabaseService _shared = DatabaseService._sharedInstance();
  DatabaseService._sharedInstance();
  factory DatabaseService() => _shared;
}
