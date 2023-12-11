import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/widgets/custom_dialogs/show_logout_dialog.dart';
import 'package:flutter/material.dart';
import '../models/auth_service/auth_controller.dart';
import 'package:get/get.dart';

// import 'package:canteen_preorderapp/models/database_service.dart';

class StaffDashboardScreen extends StatefulWidget {
  StaffDashboardScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();
  @override
  _FoodAppHomeState createState() => _FoodAppHomeState();
}

class _FoodAppHomeState extends State<StaffDashboardScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _filterOptions = [
    'All',
    'Processed',
    'Processing',
    'Done'
  ];
  String _selectedFilter = 'All';
  // late final DatabaseService _dataService;

  @override
  void initState() {
    // _dataService = DatabaseService();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _activeIndex = _tabController.index;
        print('_activeIndex: $_activeIndex');
      });
    });
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
              indicatorColor: Color.fromARGB(255, 92, 55, 7),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.person), text: 'Add Food'),
                Tab(icon: Icon(Icons.food_bank_outlined), text: 'View Menu'),
                Tab(
                    child: TextButton.icon(
                        onPressed: () async {
                          final shouldLogout = await showLogOutDialog(context);

                          if (shouldLogout) {
                            await FirebaseAuthService().logOut();

                            Get.toNamed("/login");
                          }
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white54,
                        ),
                        label: Text(
                          "Log Out",
                          style: TextStyle(color: Colors.white54),
                        ))),
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
                        fillColor: Colors.grey[300]),
                  ),
                )
              : Text(""),
          _activeIndex != 1
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
                            });
                          },
                        ),
                      );
                    }).toList(),)):Text(""),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Text("All Orders Placed"),
                AddFoodItemScreen(),
                Text("View Menu"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}