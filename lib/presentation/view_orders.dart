import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Order {
  final String id;
  final String title;
  final double orderStatus;
  final String cafeteriaName;

  Order({
    required this.id,
    required this.title,
    required this.orderStatus,
    required this.cafeteriaName,
  });
}

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late Future<List<Order>> futureOrders;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    futureOrders = fetchOrdersFromFirestore();
  }

  Future<List<Order>> fetchOrdersFromFirestore() async {
    User? user = auth.currentUser;
    if (user == null) {
      throw Exception('User is not signed in');
    }
    var userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    String userCafeteria = userDoc['cafeteria']; // Assuming 'cafeteria' is the field

    var orderCollectionRef = FirebaseFirestore.instance.collection('orderCollection');
    var cafeteriaOrderCollectionRef = orderCollectionRef.doc(userCafeteria).collection('orders');
    var querySnapshot = await cafeteriaOrderCollectionRef.get();

    return querySnapshot.docs.map((doc) {
      return Order(
        id: doc.id,
        title: doc['paymentID'],
        orderStatus: doc['orderStatus'].toDouble(),
        cafeteriaName: userCafeteria,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: FutureBuilder<List<Order>>(
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found for this cafeteria'));
          } else {
            List<Order> orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(orders[index].title),
                  subtitle: Text('Order Status: ${orders[index].orderStatus}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
