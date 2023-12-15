import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/models/menu_item.dart';
import 'package:canteen_preorderapp/models/order_item.dart';
import 'package:canteen_preorderapp/widgets/custom_dialogs/show_logout_dialog.dart';
import 'package:canteen_preorderapp/widgets/designs/food_grid.dart';
import 'package:flutter/material.dart';

class StaffDashboardScreen extends StatefulWidget {
  StaffDashboardScreen({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

  @override
  _FoodAppHomeState createState() => _FoodAppHomeState();
}

class _FoodAppHomeState extends State<StaffDashboardScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _filterOptions = ['To be Processed', 'Processing', 'Processed', 'Done'];
  String cafeteria = "";
  late final DatabaseService databaseService;
  int _selectedFilter = 0;
  int _activeIndex = 0;

  @override
  void initState() {
    databaseService = DatabaseService();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _activeIndex = _tabController.index;
        print('_activeIndex: $_activeIndex');
      });
    });
    getCafeteria();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void getCafeteria() async {
    var staffItem = await databaseService.getStaff(userId: FirebaseAuthService().currentUser!.id);
    setState(() {
      cafeteria = staffItem.cafeteria;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedFilter.toString());
    print(cafeteria);
    Stream<Iterable<MenuItem>> currStream = databaseService.foodsInCafeteria(cafeteria);
    Stream<Iterable<OrderItem>> ordersCurrStream = databaseService.foodOrdersByStage(cafeteria, _selectedFilter.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6B0808),
        bottom: PreferredSize(
          preferredSize: Size(24.0, 24.0),
          child: Container(
            height: 80.0,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color.fromARGB(255, 92, 55, 7),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.person), text: 'Add Food'),
                Tab(icon: Icon(Icons.food_bank_outlined), text: 'View Menu'),
                Tab(icon: Icon(Icons.one_k_rounded), text: 'Orders'),
                Tab(
                  child: TextButton.icon(
                    onPressed: () async {
                      final shouldLogout = await showLogOutDialog(context);
                      if (shouldLogout) {
                        await FirebaseAuthService().logOut();
                        Get.toNamed("/login");
                      }
                    },
                    icon: Icon(Icons.logout, color: Colors.white54),
                    label: Text("Log Out", style: TextStyle(color: Colors.white54)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _activeIndex != 1
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
                      fillColor: Colors.grey[300],
                    ),
                  ),
                )
              : Text(""),
          _activeIndex != 1
              ? Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _filterOptions.asMap().entries.map((entry) {
                      int index = entry.key + 1;
                      String filter = entry.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          labelStyle: _selectedFilter == index ? TextStyle(color: Colors.white) : null,
                          selectedColor: Color(0xFF6B0808),
                          backgroundColor: Colors.grey[300],
                          label: Text(filter),
                          selected: _selectedFilter == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedFilter = index;
                              ordersCurrStream = databaseService.foodOrdersByStage(cafeteria, _selectedFilter.toString());
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
                OrdersList(currStage: ordersCurrStream), // Modify this to display filtered orders based on _selectedFilter
                AddFoodItemScreen(),
                FoodGridScreen(
                  currStream: currStream,
                  page: "StaffDashboard",
                ),
                OrdersList(currStage: ordersCurrStream), // Pass _selectedFilter to OrdersList
                // Other widgets...
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Make sure to update OrdersList widget to use the selectedFilter for filtering orders.
