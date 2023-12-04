import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/presentation/view_all_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Food Ordering App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: FoodMenuScreen(),
//       home: CartScreen(),
//     );
//   }
// }

// class FoodItem {
//   final String id;
//   final String name;
//   final String price;

//   FoodItem({required this.id, required this.name, required this.price});
// }

// class CartItem {
//   final String foodItemId;
//   int quantity;
//   final String foodName;
//   final String foodDescription;

//   CartItem(
//       {required this.foodName,
//       required this.foodDescription,
//       required this.foodItemId,
//       required this.quantity});
// }

// class FoodMenuScreen extends StatelessWidget {
//   final CollectionReference foodCollection =
//       FirebaseFirestore.instance.collection('menuCollection');
//   final CollectionReference cartCollection =
//       FirebaseFirestore.instance.collection('cartCollection');

//   final DatabaseService _dataService = DatabaseService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: ElevatedButton(
//         onPressed: () {
//           CartScreen();
//         },
//         child: Text('View Cart'),
//       )),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: foodCollection.snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           }

//           List<FoodItem> foodItems = snapshot.data!.docs.map((doc) {
//             Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//             return FoodItem(
//               id: doc.id,
//               name: data['foodName'],
//               price: data['price'],
//             );
//           }).toList();

//           return ListView.builder(
//             itemCount: foodItems.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(foodItems[index].name),
//                 subtitle: Text('\$${foodItems[index].price.toString()}'),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     addToCart(foodItems[index].id);
//                   },
//                   child: Text('Add to Cart'),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   Future<void> addToCart(String foodItemId) async {
//     // Check if the item already exists in the cart
//     var existingCartItem =
//         await cartCollection.where('foodItemId', isEqualTo: foodItemId).get();

//     var foodItem = await _dataService.getMenuItem(foodID: foodItemId);

//     if (existingCartItem.docs.isEmpty) {
//       // If the item is not in the cart, add it
//       await cartCollection.add({
//         'foodItemId': foodItemId,
//         'quantity': 1,
//         'foodName': foodItem.foodName,
//         'foodImage': foodItem.foodImage,
//         'price': foodItem.price,
//         'foodDescription': foodItem.foodDescription,
//       });
//     } else {
//       // If the item is already in the cart, update the quantity
//       var cartItem = existingCartItem.docs.first;
//       int newQuantity = cartItem['quantity'] + 1;
//       cartItem.reference.update({'quantity': newQuantity});
//     }
//   }
// }

// class CartScreen extends StatelessWidget {
//   final CollectionReference cartCollection =
//       FirebaseFirestore.instance.collection('cartCollection');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: cartCollection.snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           }

//           List<CartItem> cartItems = snapshot.data!.docs.map((doc) {
//             Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//             return CartItem(
//                 foodItemId: data['foodItemId'],
//                 quantity: data['quantity'],
//                 foodName: data['foodName'],
//                 foodDescription: data['foodDescription']);
//           }).toList();

//           return ListView.builder(
//             itemCount: cartItems.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('Item: ${cartItems[index].foodName}'),
//                 subtitle: Text('Quantity: ${cartItems[index].quantity}'),
//                 // Add buttons to increase/decrease quantity or remove item
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home page',
      initialRoute: '/', // Set the initial route
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/normal', page: () => FoodAppHome()),
        GetPage(
            name: '/login', page: () => LoginScreen()), // Login screen route
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/admin', page: () => const AdminDashboardScreen()),
        GetPage(name: '/staff', page: () => StaffDashboardScreen()),
        GetPage(name: '/viewAllUsers', page: () => const UserListScreen()),
        GetPage(name: '/menu_update', page: () => UploadImageScreen()),
// Add GetPage entries for other new screens as well

        // Signup screen route
      ],
    );
  }
}
