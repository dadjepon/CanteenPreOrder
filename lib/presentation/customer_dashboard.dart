// ignore_for_file: file_names, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:canteen_preorderapp/core/utils/size_utils.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/models/food_item.dart';
import 'package:canteen_preorderapp/presentation/profile_screen.dart';
import 'package:canteen_preorderapp/theme/app_decoration.dart';
import 'package:canteen_preorderapp/theme/custom_text_style.dart';
import 'package:canteen_preorderapp/theme/theme_helper.dart';
import 'package:canteen_preorderapp/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import '../models/auth_service/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    _tabController = TabController(length: 4, vsync: this);
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
              final allFoods = snapshot.data as Iterable<FoodItem>;
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
                        final foodItem = allFoods.elementAt(index);
                        String foodName =
                            foodItem.foodName; // Example food name
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
                              CustomImageView(
                                imagePath: foodItem.foodImage,
                                height: 160.v,
                                width: 166.h,
                                radius: BorderRadius.circular(
                                  5.h,
                                ),
                                margin: EdgeInsets.only(left: 2.h),
                              ),
                              SizedBox(height: 9.v),
                              Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text(
                                  foodName,
                                  style: CustomTextStyles
                                      .titleSmallPoppinsWhiteA700,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(
                                  children: <Widget>[
                                    Spacer(),
                                    Expanded(
                                      child: Text(
                                        foodItem.foodDescription.length > 10
                                            ? foodItem.foodDescription
                                                .substring(
                                                    0,
                                                    foodItem.foodDescription
                                                            .length -
                                                        8)
                                            : foodItem.foodDescription,
                                        maxLines: 2,
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        foodItem.foodDescription.length > 10
                                            ? foodItem.foodDescription
                                                .substring(foodItem
                                                        .foodDescription
                                                        .length -
                                                    8)
                                            : '',
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Row(
                                  children: [
                                    Text(
                                      foodItem.price,
                                      style: theme.textTheme.titleLarge,
                                    ),
                                    CustomImageView(
                                      imagePath: foodItem.foodImage,
                                      height: 10.adaptSize,
                                      width: 10.adaptSize,
                                      margin: EdgeInsets.only(
                                        left: 70.h,
                                        top: 5.v,
                                        bottom: 6.v,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.v),
                            ],
                          ),
                        );
                      }));
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
        title: const Text('Home'),
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
                const Text('Cart Tab'),
                SfProfileScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
