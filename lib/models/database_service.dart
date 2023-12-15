import 'package:canteen_preorderapp/core/constants/constants.dart';
import 'package:canteen_preorderapp/models/auth_service/auth_exceptions.dart';
import 'package:canteen_preorderapp/models/cart_item.dart';
import 'package:canteen_preorderapp/models/customer_model.dart';
import 'package:canteen_preorderapp/models/food_item.dart';
import 'package:canteen_preorderapp/models/menu_item.dart';
import 'package:canteen_preorderapp/models/order_item.dart';
import 'package:canteen_preorderapp/models/staff_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final menu = FirebaseFirestore.instance.collection('menu');
  final menuCollection =
      FirebaseFirestore.instance.collection('menuCollection');
  final foodCollection =
      FirebaseFirestore.instance.collection('foodCollection');
  final users = FirebaseFirestore.instance.collection('users');
  final usersCollection =
      FirebaseFirestore.instance.collection('usersCollection');
  final paymentsCollection =
      FirebaseFirestore.instance.collection('paymentCollection');

  final ordersCollection =
      FirebaseFirestore.instance.collection('ordersCollection');
  final canteenOrdersCollection =
      FirebaseFirestore.instance.collection('canteenOrdersCollection');

  Stream<Iterable<MenuItem>> allFoods() => menuCollection
      .snapshots()
      .map((event) => event.docs.map((doc) => MenuItem.fromSnapshot(doc)));

  Stream<Iterable<MenuItem>> foodsInCafeteria(String cafeteriaName) =>
      menuCollection
          .where('cafeteria', isEqualTo: cafeteriaName)
          .snapshots()
          .map((event) => event.docs.map((doc) => MenuItem.fromSnapshot(doc)));

  Stream<Iterable<OrderItem>> foodOrdersByStage(String cafeteriaName, String stage) =>
    canteenOrdersCollection.doc('canteenOrders').collection(cafeteriaName)
        .where('orderStage', isEqualTo: stage)
        .snapshots()
        .map((event) => event.docs.map((doc) => OrderItem.fromSnapshot(doc)));

  Stream<Iterable<CartItem>> allCartItems(
      {required String userId, required String cafeteria}) {
    final cartCollection = FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(userId)
        .collection(cafeteria);
    return cartCollection
        .snapshots()
        .map((event) => event.docs.map((doc) => CartItem.fromSnapshot(doc)));
  }

  Stream<Iterable<OrderItem>> allOrderItems({required String userId}) {
    final cartCollection = ordersCollection.doc(userId).collection(userId);
    return cartCollection
        .snapshots()
        .map((event) => event.docs.map((doc) => OrderItem.fromSnapshot(doc)));
  }

  Future<void> fromCartToOrders(
      {required String userId,
      required String orderId,
      required String paymentRef,
      required String amount,
      required String orderStage,
      required String timestamp,
      required String cafeteria,
      required String email,
      required String delivery,
      required String location}) async {
    final cartCollection = FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(userId)
        .collection(cafeteria);
    QuerySnapshot snap = await cartCollection.get();
    final allData = snap.docs.map((doc) => doc.data()).toList();
    await ordersCollection.doc(userId).collection(userId).add({
      'orderId': orderId,
      'cafeteria': cafeteria,
      'paymentRef': paymentRef,
      'amount': amount,
      'orderCollection': allData,
      'timestamp': timestamp,
      'orderStage': orderStage,
      'email': email,
      'userId': userId,
      'deliveryOption': delivery,
      'location': location
    });
    final instance = FirebaseFirestore.instance;
    final batch = instance.batch();
    var snapshots = await cartCollection.get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
    await canteenOrdersCollection
        .doc("canteenOrders")
        .collection(cafeteria)
        .add({
      'orderId': orderId,
      'paymentRef': paymentRef,
      'amount': amount,
      'orderCollection': allData,
      'timestamp': timestamp,
      'orderStage': orderStage,
      'email': email,
      'userId': userId,
      'cafeteria': cafeteria,
      'deliveryOption': delivery,
      'location': location
    });
  }

  Future<num> calculatingTotalPrice(
      {required String userId, required String cafeteria}) async {
    num amount = 0;
    final firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qSnaps = await firestoreInstance
        .collection("cartCollection")
        .doc(userId)
        .collection(cafeteria)
        .get();

    if (qSnaps.docs.length == 0) amount = 0;

    for (int i = 0; i < qSnaps.docs.length; i++) {
      num price =
          num.parse(qSnaps.docs[i]["price"]) * qSnaps.docs[i]["quantity"];
      amount = amount + price;
    }
    return amount;
  }

  Future<CustomerItem> getUser({required String userId}) async {
    return usersCollection
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

  Future<StaffItem> getStaff({required String userId}) async {
    return usersCollection
        .where(FieldPath.documentId, isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) {
      final documents = querySnapshot.docs;
      if (documents.isEmpty) {
        // handle error when no document is found
        throw CouldNotFindUserException();
      }
      return StaffItem.fromSnapshot(documents.first);
    }).first;
  }

  Future<FoodItem> getFoodItem({required String foodID}) async {
    return foodCollection
        .where(FieldPath.documentId, isEqualTo: foodID)
        .snapshots()
        .map((querySnapshot) {
      final documents = querySnapshot.docs;
      if (documents.isEmpty) {
        // handle error when no document is found
        throw CouldNotFindFoodException();
      }
      return FoodItem.fromSnapshot(documents.first);
    }).first;
  }

  Future<MenuItem> getMenuItem({required String foodID}) async {
    return menuCollection
        .where(FieldPath.documentId, isEqualTo: foodID)
        .snapshots()
        .map((querySnapshot) {
      final documents = querySnapshot.docs;
      if (documents.isEmpty) {
        // handle error when no document is found
        throw CouldNotFindFoodException();
      }
      return MenuItem.fromSnapshot(documents.first);
    }).first;
  }

  Future<void> addToCart(
      {required String foodItemId,
      required String cafeteriaName,
      required String usedId}) async {
    final cartCollection = FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(usedId)
        .collection(cafeteriaName);
    // Check if the item already exists in the cart
    var existingCartItem =
        await cartCollection.where('foodItemId', isEqualTo: foodItemId).get();

    var foodItem = await getMenuItem(foodID: foodItemId);

    if (existingCartItem.docs.isEmpty) {
      // If the item is not in the cart, add it
      await cartCollection.add({
        'foodItemId': foodItemId,
        'quantity': 1,
        'foodName': foodItem.foodName,
        'foodImage': foodItem.foodImage,
        'price': foodItem.price,
        'foodDescription': foodItem.foodDescription,
        'cafeteria': foodItem.cafeteria,
      });
    } else {
      // If the item is already in the cart, update the quantity
      var cartItem = existingCartItem.docs.first;
      int newQuantity = cartItem['quantity'] + 1;
      cartItem.reference.update({'quantity': newQuantity});
    }
  }


// Future<void> updateOrderStage(
//       {required String orderItemId,
//       required String cafeteriaName,}) async {
//     final orderCollection = FirebaseFirestore.instance
//         .collection('cartCollection')
//         .doc(usedId)
//         .collection(cafeteriaName);
//     // Check if the item already exists in the cart
//     var existingCartItem =
//         await cartCollection.where('foodItemId', isEqualTo: foodItemId).get();

//     var foodItem = await getMenuItem(foodID: foodItemId);

//     if (existingCartItem.docs.isEmpty) {
//       // If the item is not in the cart, add it
//       await cartCollection.add({
//         'foodItemId': foodItemId,
//         'quantity': 1,
//         'foodName': foodItem.foodName,
//         'foodImage': foodItem.foodImage,
//         'price': foodItem.price,
//         'foodDescription': foodItem.foodDescription,
//         'cafeteria': foodItem.cafeteria,
//       });
//     } else {
//       // If the item is already in the cart, update the quantity
//       var cartItem = existingCartItem.docs.first;
//       int newQuantity = cartItem['quantity'] + 1;
//       cartItem.reference.update({'quantity': newQuantity});
//     }
//   }





  Future<void> removeFromCart({
    required String foodItemId,
    required String usedId,
    required String cafeteriaName,
  }) async {
    final cartCollection = FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(usedId)
        .collection(cafeteriaName);
    // Check if the item already exists in the cart
    var existingCartItem =
        await cartCollection.where('foodItemId', isEqualTo: foodItemId).get();

    if (existingCartItem.docs.isEmpty) {
      // If the item is not in the cart, add it
      return;
    } else {
      // If the item is already in the cart, update the quantity
      var cartItem = existingCartItem.docs.first;
      int newQuantity = cartItem['quantity'] - 1;
      if (newQuantity == 0) {
        cartItem.reference.delete();
      } else {
        cartItem.reference.update({'quantity': newQuantity});
      }
    }
  }

  Future<void> removeFromMenu(String foodItemId) async {
    final menuCollection =
        FirebaseFirestore.instance.collection('menuCollection');
    // Check if the item already exists in the cart
    var existingMenuItem = await menuCollection
        .where(FieldPath.documentId, isEqualTo: foodItemId)
        .get();

    if (existingMenuItem.docs.isEmpty) {
      return;
    } else {
      // If the item is already in the cart, update the quantity
      var MenuItem = existingMenuItem.docs.first;
      MenuItem.reference.delete();
    }
  }

  Future<void> addFoodItem(
      {required String foodName,
      required String foodDescription,
      required String foodImage,
      required String cafeteria,
      required String price,
      required String availabilityStatus,
      required String menuType,
      required String timestamp}) async {
    var addedDoc = await foodCollection.add({
      'foodDescription': foodDescription,
      'foodImage': foodImage,
      'foodName': foodName
    });
    await menuCollection.add({
      'cafeteria': cafeteria,
      'foodDescription': foodDescription,
      'price': price,
      'foodName': foodName,
      'foodImage': foodImage,
      'availabilityStatus': availabilityStatus,
      'menuType': menuType,
      'timestamp': timestamp,
      'foodID': addedDoc.id
    });
  }

  Future<void> savePaymentData({
    required String orderId,
    required String paymentId,
    required String status,
    required String reference,
    required String amount,
    required String gateWayResponse,
    required String receiptNumber,
    required String cafeteria,
  }) async {
    await paymentsCollection.add({
      'reference': reference,
      'paymentId': paymentId,
      'amount': amount,
      'orderId': orderId,
      'paymentStatus': status,
      'gateWayResponse': gateWayResponse,
      'receiptNumber': receiptNumber,
      'cafeteria': cafeteria,
    });
  }

  // TO DO: Send this to the model section later
  Future<void> saveUserInfoToFirestore(String name, String email, String instID,
      String phoneNumber, String role, user) async {
    try {
      if (user != null) {
        await usersCollection.doc(user.uid).set({
          'name': name,
          'email': email,
          'phoneNumber': phoneNumber,
          'instID': instID,
          'role': role
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error saving user information to Firestore: $e');
    }
  }

  Future<void> removeUser(String userId) async {
    var existingUsers = await usersCollection
        .where(FieldPath.documentId, isEqualTo: userId)
        .get();

    if (existingUsers.docs.isEmpty) {
      return;
    } else {
      // If the item is already in the cart, update the quantity
      var User = existingUsers.docs.first;
      User.reference.delete();
    }
  }

  //creating a singleton to mantains the same instance across the application
  static final DatabaseService _shared = DatabaseService._sharedInstance();
  DatabaseService._sharedInstance();
  factory DatabaseService() => _shared;
}
