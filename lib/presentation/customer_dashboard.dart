// ignore_for_file: file_names, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/models/food_item.dart';
import 'package:flutter/material.dart';
import '../models/auth_service/auth_controller.dart';
import 'package:get/get.dart';

final AuthController authController = Get.find<AuthController>();

class FoodAppHome extends StatefulWidget {
  FoodAppHome({Key? key}) : super(key: key);

  @override
  _FoodAppHomeState createState() => _FoodAppHomeState();
}

class _FoodAppHomeState extends State<FoodAppHome>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _filterOptions = ['All', 'Akomfem', 'Big Ben', 'Munchies'];
  String _selectedFilter = 'All';
  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void showFoodDescription(String foodName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(foodName),
          content: Text("This is the description of $foodName."),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildFoodGrid() {
    return StreamBuilder(
      stream: _dataService.allFoods(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            if (snapshot.hasData) {
              final allFoods = snapshot.data as Iterable<FoodItem>;
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: allFoods.length,
                itemBuilder: (context, index) {
                  final foodItem = allFoods.elementAt(index);
                  String foodName = foodItem.foodName; // Example food name
                  return InkWell(
                    onTap: () => showFoodDescription(foodName),
                    child: Card(
                      color: Color(0xFF6B0808),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Image(
                              image: NetworkImage(foodItem.foodImage),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              foodName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(foodItem.price),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              // showLoadingDialog(context: context, text: "Please wait");
              return const CircularProgressIndicator();
            }
          default:
            // showLoadingDialog(context: context, text: "Please wait");
            return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Color(0xFF6B0808), // AppBar's custom background color
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color.fromARGB(255, 92, 55, 7),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.store), text: 'Cafeteria'),
            Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _filterOptions.map((filter) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    labelStyle: _selectedFilter == filter
                        ? TextStyle(color: Colors.white)
                        : null,
                    selectedColor: Colors.red,
                    backgroundColor: Colors.grey[300],
                    label: Text(filter),
                    selected: _selectedFilter == filter,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildFoodGrid(),
                const Text('Cafeteria Tab'),
                const Text('Cart Tab'),
                const Text('Profile Tab'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
