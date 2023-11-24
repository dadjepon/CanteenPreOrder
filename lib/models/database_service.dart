import 'package:canteen_preorderapp/models/food_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final menu = FirebaseFirestore.instance.collection('menu');

  Stream<Iterable<FoodItem>> allFoods() => menu
      .snapshots()
      .map((event) => event.docs.map((doc) => FoodItem.fromSnapshot(doc)));

  //creating a singleton to mantains the same instance across the application
  static final DatabaseService _shared = DatabaseService._sharedInstance();
  DatabaseService._sharedInstance();
  factory DatabaseService() => _shared;
}
