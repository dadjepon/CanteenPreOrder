// ignore_for_file: file_names, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/cart_item.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/models/menu_item.dart';
import 'package:canteen_preorderapp/presentation/cart_view/cart_view.dart';
import 'package:canteen_preorderapp/presentation/current_orders.dart';
import 'package:canteen_preorderapp/presentation/profile_screen.dart';
import 'package:canteen_preorderapp/widgets/designs/food_grid.dart';
import 'package:flutter/material.dart';
import '../models/auth_service/auth_controller.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

final AuthController authController = Get.find<AuthController>();

class FoodAppHome extends StatefulWidget {
  FoodAppHome({Key? key}) : super(key: key);

  @override
  _FoodAppHomeState createState() => _FoodAppHomeState();
}

class _FoodAppHomeState extends State<FoodAppHome>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _filterOptions = ['All', 'Munchies', 'Akornor', 'Big Ben'];
  String _selectedFilter = 'All';
  late final DatabaseService _dataService;
  late Stream<Iterable<MenuItem>> currStream;

  @override
  void initState() {
    _dataService = DatabaseService();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _activeIndex = _tabController.index;
        print('_activeIndex: $_activeIndex');
      });
    });
    currStream = _dataService.allFoods();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6B0808), // AppBar's custom background color
        bottom: new PreferredSize(
          preferredSize: new Size(24.0, 24.0),
          child: Container(
            height: 80.0,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color.fromARGB(255, 86, 92, 7),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(
                  child: StreamBuilder(
                    stream: _dataService.allCartItems(
                      userId: FirebaseAuthService().currentUser!.id,
                    ),
                    builder: (context, snapshot) {
                      var cartItemsLength = 0;
                      if (snapshot.hasData) {
                        final items = snapshot.data as Iterable<CartItem>;
                        for (int i = 0; i < items.length; i++) {
                          cartItemsLength += items.elementAt(i).quantity;
                        }
                      }

                      return badges.Badge(
                        badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                        badgeContent: Text(
                          '$cartItemsLength',
                          style:
                              TextStyle(color: Color.fromARGB(255, 230, 9, 9)),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                        ),
                      );
                    },
                  ),
                ),
                Tab(icon: Icon(Icons.person), text: 'Profile'),
                Tab(icon: Icon(Icons.food_bank_outlined), text: 'Orders'),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _activeIndex == 10
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[300]),
                  ),
                )
              : Text(""),
          _activeIndex != 2
              ? Container(
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
                          selectedColor: Color(0xFF6B0808),
                          backgroundColor: Colors.grey[300],
                          label: Text(filter),
                          selected: _selectedFilter == filter,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedFilter = filter;
                              if (filter == "All") {
                                currStream = _dataService.allFoods();
                              } else {
                                currStream =
                                    _dataService.foodsInCafeteria(filter);
                              }
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                )
              : Text(""),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FoodGridScreen(
                  currStream: currStream,
                  page: "CustomerDashboard",
                ),
                CartView(),
                SfProfileScreen(),
                CurrentOrdersScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
