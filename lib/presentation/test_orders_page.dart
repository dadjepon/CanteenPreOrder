import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/models/order_item.dart';
import 'package:canteen_preorderapp/models/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrdersList extends StatefulWidget {
  OrdersList({
    Key? key,
    required this.currStage,
  }) : super(key: key);

  final Stream<Iterable<OrderItem>> currStage;

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  String? cafeteria; // Allow for a nullable cafeteria
  late final DatabaseService _databaseService;

  @override
  void initState() {
    _databaseService = DatabaseService();
    getUserCafeteria();
    super.initState();
  }

  void getUserCafeteria() async {
    StaffItem staffItem = await _databaseService.getStaff(
        userId: FirebaseAuthService().currentUser!.id);
    if (staffItem.cafeteria.isNotEmpty) {
      // Ensure we have a non-empty cafeteria value
      setState(() {
        cafeteria = staffItem.cafeteria;
      });
    }
  }

  Future<void> updateOrderStage(OrderItem document) async {
    int currentStage = int.tryParse(document.orderStage as String? ?? '0') ?? 0;
    if (currentStage < 4) {
      FirebaseFirestore.instance
          .collection('canteenOrdersCollection')
          .doc('canteenOrders')
          .collection(document.cafeteria)
          .where(FieldPath.documentId, isEqualTo: document.docId)
          .get()
          .then((orderItem) {
        orderItem.docs.first.reference
            .update({'orderStage': (currentStage + 1).toString()});
      });

      FirebaseFirestore.instance
          .collection('ordersCollection')
          .doc(document.orderId.split("_")[1])
          .collection(document.orderId.split("_")[1])
          .where("orderId", isEqualTo: document.orderId)
          .get()
          .then((orderItem) {
        orderItem.docs.first.reference
            .update({'orderStage': (currentStage + 1).toString()});
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('This food is already served successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cafeteria == null || cafeteria!.isEmpty) {
      // Show a loading indicator or return an empty Container while waiting for cafeteria to be set
      return Center(child: CircularProgressIndicator());
    }
    return StreamBuilder<Iterable<OrderItem>>(
      stream: widget.currStage,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final orderItems = snapshot.data as Iterable<OrderItem>;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.2,
              ),
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final orderDocument = orderItems.elementAt(index);

                return OrderCard(
                  personEmail: orderDocument.orderComponents[0]['foodName'],
                  personName: orderDocument.orderComponents[0]['foodName'],
                  personPhoneNumber: orderDocument.orderComponents[0]
                      ['foodName'],
                  foodName: orderDocument.orderComponents[0]['foodName'],
                  foodDescription: orderDocument.orderComponents[0]
                      ['foodDescription'],
                  foodImage: orderDocument.orderComponents[0]['foodImage'],
                  price: orderDocument.orderComponents[0]['price'].toString(),
                  orderItem: orderDocument,
                  onupdate: () => updateOrderStage(orderDocument),
                );
              },
            );
          } else {
            return Center(child: Text('No orders found.'));
          }
        }
        return Center(child: Text('No orders found.'));
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final String foodName;
  final String foodDescription;
  final String foodImage;
  final String price;
  final OrderItem orderItem;
  final VoidCallback onupdate;

  // Add these properties for displaying additional information
  final String personName;
  final String personEmail;
  final String personPhoneNumber;

  const OrderCard({
    Key? key,
    required this.foodName,
    required this.foodDescription,
    required this.foodImage,
    required this.price,
    required this.onupdate,
    required this.personName,
    required this.personEmail,
    required this.personPhoneNumber,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event here, you can show a dialog or navigate to another screen
        showAdditionalInfoDialog(context);
      },
      child: Card(
        color: Colors.red,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: foodImage,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(foodName,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child:
                  Text(foodDescription, style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ghc $price',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  IconButton(
                    icon: Icon(Icons.update, color: Colors.white),
                    onPressed: onupdate,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show additional information dialog
  void showAdditionalInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var ordersArray = [];
        for (int i = 0; i < orderItem.orderComponents.length; i++) {
          ordersArray.add(
              "${orderItem.orderComponents[i]['quantity']} - ${orderItem.orderComponents[i]['foodName']}");
        }
        return AlertDialog(
          title: Text('Additional Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Order ID: ${orderItem.orderId}'),
              Text('Email: ${orderItem.email}'),
              Text('Time: ${orderItem.timestamp}'),
              Text('Delivery option: ${orderItem.deliveryOption}'),
              Text('Delivery option: ${orderItem.location}'),
              Text('Order Items: ${ordersArray}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
