import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/menu_item.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodGridScreen extends StatefulWidget {
  const FoodGridScreen(
      {super.key, required this.currStream, required this.page});

  final Stream<Iterable<MenuItem>> currStream;
  final String page;

  @override
  State<FoodGridScreen> createState() => _FoodGridScreenState();
}

class _FoodGridScreenState extends State<FoodGridScreen> {
  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.currStream,
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
                                    widget.page != "StaffDashboard"
                                        ? Padding(
                                            padding:
                                                EdgeInsets.only(left: 50.h),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                if (menuItem
                                                        .availabilityStatus ==
                                                    "Yes") {
                                                  _dataService.addToCart(
                                                      usedId:
                                                          FirebaseAuthService()
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
                                                      .then((value) =>
                                                          print("value"));

                                                  final snackbar = SnackBar(
                                                    // duration: const Duration(seconds: 5),
                                                    content: Text(
                                                      'Item successfully added to cart',
                                                      style: GoogleFonts.ubuntu(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Color.fromARGB(
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
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 105, 4, 4),
                                                    elevation: 5,
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackbar);
                                                }
                                              },
                                              child: Text("Buy"),
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                EdgeInsets.only(left: 50.h),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                _dataService.removeFromMenu(
                                                    menuItem.menuItemId);
                                              },
                                              child: Text("Delete"),
                                            )),
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
}
