import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewDashboardScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  ViewDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafeteria Dashboard'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: getUserCafeteria(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (userSnapshot.hasError) {
            return Center(child: Text("Error: ${userSnapshot.error}"));
          }
          if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
            return Center(child: Text('User cafeteria information not found'));
          }

          String userCafeteria = userSnapshot.data!['cafeteria']; // Assuming 'cafeteria' is the field

          return StreamBuilder<QuerySnapshot>(
            stream: firestore
                .collection('menu') // Use the 'menu' collection
                .where('cafeteria', isEqualTo: userCafeteria) // Filter by the cafeteria name
                .snapshots(),
            builder: (context, menuSnapshot) {
              if (menuSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (menuSnapshot.hasError) {
                return Center(child: Text('Error: ${menuSnapshot.error}'));
              }
              if (!menuSnapshot.hasData || menuSnapshot.data!.docs.isEmpty) {
                return Center(child: Text('No menu items found for this cafeteria'));
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: menuSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = menuSnapshot.data!.docs[index];
                  Map<String, dynamic> foodItem = doc.data() as Map<String, dynamic>;
                  String foodItemId = doc.id; // Document ID for deletion

                  return Card(
                    color: Colors.red,
                    elevation: 5,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Image.network(
                                foodItem['foodImage'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                foodItem['foodName'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                              child: Text(
                                'Price: ${foodItem['price']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () => _deleteFoodItem(context, foodItemId),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot> getUserCafeteria() async {
    User? user = auth.currentUser;
    if (user != null) {
      return await firestore.collection('users').doc(user.uid).get();
    }
    throw Exception('Not signed in');
  }
  
void _deleteFoodItem(BuildContext context, String foodItemId) {
  // Show confirmation dialog before deleting
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this food item?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog and do nothing
            },
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () async {
              Navigator.of(context).pop(); // Dismiss the dialog first
              try {
                await firestore.collection('menu').doc(foodItemId).delete();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Food item deleted successfully')),
                );
              } on FirebaseException catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to delete the food item: ${e.message}')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('An error occurred')),
                );
              }
            },
          ),
        ],
      );
    },
  );
}

}