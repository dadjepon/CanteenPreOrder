// ignore_for_file: file_names, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:canteen_preorderapp/core/utils/size_utils.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/cart_item.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/models/menu_item.dart';
import 'package:canteen_preorderapp/presentation/cart_view/cart_view.dart';
import 'package:canteen_preorderapp/presentation/current_orders.dart';
import 'package:canteen_preorderapp/presentation/profile_screen.dart';
import 'package:canteen_preorderapp/theme/app_decoration.dart';
import 'package:canteen_preorderapp/theme/custom_text_style.dart';
import 'package:canteen_preorderapp/theme/theme_helper.dart';
import 'package:canteen_preorderapp/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/auth_service/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  final List<String> _filterOptions = [
    'All',
    'Filter 1',
    'Filter 2',
    'Filter 3'
  ];
  String _selectedFilter = 'All';
  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildFoodGrid() {
    return StreamBuilder(
      stream: _dataService.allFoods(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            if (snapshot.hasData) {
              final allFoods = snapshot.data as Iterable<MenuItem>;

              return Expanded(
                  child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      primary: false,
                      crossAxisCount: 4,
                      crossAxisSpacing: 7.53.h,
                      mainAxisSpacing: 7.53.h,
                      staggeredTileBuilder: (index) {
                        return StaggeredTile.fit(1);
                      },
                      itemCount: allFoods.length,
                      itemBuilder: (context, index) {
                        final menuItem = allFoods.elementAt(index);
                        // Example food name
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.h,
                            vertical: 4.v,
                          ),
                          decoration:
                              AppDecoration.outlineOnErrorContainer1.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder11,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 9.v),
                              Center(
                                child: Text(
                                  menuItem.cafeteria,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFE78F0B)),
                                ),
                              ),
                              SizedBox(height: 9.v),
                              CustomImageView(
                                imagePath: menuItem.foodImage,
                                height: 160.v,
                                width: 166.h,
                                radius: BorderRadius.circular(
                                  5.h,
                                ),
                                margin: EdgeInsets.only(left: 2.h),
                              ),
                              SizedBox(height: 9.v),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Text(
                                      menuItem.foodName +
                                          " (" +
                                          menuItem.menuType +
                                          ")",
                                      style: CustomTextStyles
                                          .titleSmallPoppinsWhiteA700,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 50.h),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: menuItem.availabilityStatus == "Yes"
                                          ? Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                            )
                                          : Icon(
                                              Icons.cancel,
                                              color: Colors.red[50],
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 9.v),
                              Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text(
                                  menuItem.foodDescription.length > 20
                                      ? menuItem.foodDescription.substring(0,
                                          menuItem.foodDescription.length - 20)
                                      : menuItem.foodDescription,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Row(
                                  children: [
                                    Text(
                                      "Ghc " + menuItem.price,
                                      style: theme.textTheme.titleLarge,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 50.h),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (menuItem.availabilityStatus ==
                                              "Yes") {
                                            _dataService.addToCart(
                                                usedId: FirebaseAuthService()
                                                    .currentUser!
                                                    .id,
                                                menuItem.menuItemId);

                                            _dataService
                                                .allCartItems(
                                                    userId:
                                                        FirebaseAuthService()
                                                            .currentUser!
                                                            .id)
                                                .length
                                                .then(
                                                    (value) => print("value"));

                                            final snackbar = SnackBar(
                                              // duration: const Duration(seconds: 5),
                                              content: Text(
                                                'Item successfully added to cart',
                                                style: GoogleFonts.ubuntu(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              backgroundColor: Color.fromARGB(
                                                  255, 105, 4, 4),
                                              elevation: 5,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar);
                                          } else {
                                            final snackbar = SnackBar(
                                              // duration: const Duration(seconds: 5),
                                              content: Text(
                                                'Sorry, the food is finished.',
                                                style: GoogleFonts.ubuntu(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              backgroundColor: Color.fromARGB(
                                                  255, 105, 4, 4),
                                              elevation: 5,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar);
                                          }
                                        },
                                        child: Text("Buy"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.v),
                            ],
                          ),
                        );
                      }));
            } else {
              // showLoadingDialog(context: context, text: "Please wait");
              debugPrint("Active, no data");
              return const CircularProgressIndicator();
            }
          default:
            // showLoadingDialog(context: context, text: "Please wait");
            debugPrint("Not active");
            return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6B0808), // AppBar's custom background color
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color.fromARGB(255, 92, 55, 7),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.store), text: 'Cafeteria'),
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
                      style: TextStyle(color: Color.fromARGB(255, 230, 9, 9)),
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
      body: Column(
        children: [
          Padding(
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
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildFoodGrid(),
                const Text(
                    'Cafeteria Tab - Drop down where you can select all a specific cafeteria or all menus grouped into heading of the cafeteria name'),
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
