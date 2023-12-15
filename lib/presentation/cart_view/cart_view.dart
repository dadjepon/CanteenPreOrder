import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/cart_item.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/presentation/payment_view/payment_process.dart';
import 'package:canteen_preorderapp/widgets/cart_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.cafeteria});

  final String cafeteria;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    getTotalPrice(userId: FirebaseAuthService().currentUser!.id);
    super.initState();
  }

  num amount = 0;

  getTotalPrice({required String userId}) async {
    amount = await _dataService.calculatingTotalPrice(
        userId: FirebaseAuthService().currentUser!.id,
        cafeteria: widget.cafeteria);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: StreamBuilder(
            stream: _dataService.allCartItems(
                userId: FirebaseAuthService().currentUser!.id,
                cafeteria: widget.cafeteria),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final cartItems = snapshot.data as Iterable<CartItem>;
                    _dataService.calculatingTotalPrice(
                        userId: FirebaseAuthService().currentUser!.id,
                        cafeteria: widget.cafeteria)
                      ..then((value) {
                        setState(() {
                          getTotalPrice(
                              userId: FirebaseAuthService().currentUser!.id);
                        });
                      });

                    // return StaggeredGridView.countBuilder(
                    //   shrinkWrap: true,
                    //   primary: false,
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 7.50.h,
                    //   mainAxisSpacing: 7.50.h,
                    //   staggeredTileBuilder: (index) {
                    //     return StaggeredTile.fit(1);
                    //   },
                    //   itemCount: cartItems.length,
                    //   itemBuilder: (context, index) {
                    //     final cartItem = cartItems.elementAt(index);
                    //     // Example food name
                    //     return Container(
                    //         width: 0.5 * MediaQuery.of(context).size.width,
                    //         padding: EdgeInsets.symmetric(
                    //           horizontal: 4.h,
                    //           vertical: 4.v,
                    //         ),
                    //         decoration:
                    //             AppDecoration.outlineOnErrorContainer1.copyWith(
                    //           borderRadius: BorderRadiusStyle.customNormal,
                    //         ),
                    //         child: Container(
                    //           child: CartButton(
                    //             quantity: cartItem.quantity,
                    //             onAdd: (qty) {
                    //               _dataService.addToCart(
                    //                 usedId:
                    //                     FirebaseAuthService().currentUser!.id,
                    //                 foodItemId: cartItem.foodItemId,
                    //                 cafeteriaName: widget.cafeteria,
                    //               );
                    //             },
                    //             onRemove: (qty) {
                    //               _dataService.removeFromCart(
                    //                   usedId:
                    //                       FirebaseAuthService().currentUser!.id,
                    //                   foodItemId: cartItem.foodItemId,
                    //                   cafeteriaName: widget.cafeteria);
                    //             },
                    //           ),
                    //         ));
                    //   },
                    // );

                    return StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      primary: false,
                      crossAxisCount: 2,
                      crossAxisSpacing: 7.50.h,
                      mainAxisSpacing: 7.50.h,
                      staggeredTileBuilder: (index) {
                        return StaggeredTile.fit(1);
                      },
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems.elementAt(index);
                        // Example food name
                        return Container(
                          width: 0.5 * MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.h,
                            vertical: 4.v,
                          ),
                          decoration:
                              AppDecoration.outlineOnErrorContainer1.copyWith(
                            borderRadius: BorderRadiusStyle.customNormal,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: cartItem.foodImage,
                                height: 160.v,
                                // width: 166.h,
                                radius: BorderRadius.circular(
                                  5.h,
                                ),
                                margin: EdgeInsets.only(right: 2.h),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Food Name: " + cartItem.foodName,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFFE78F0B)),
                                    ),
                                  ),
                                  SizedBox(height: 7.v),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Center(
                                      child: Text(
                                        "Cafeteria: " + cartItem.cafeteria,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFFE78F0B)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 7.v),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Center(
                                      child: Text(
                                        "Price: Ghc " + cartItem.price,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFFE78F0B)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 7.v),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Container(
                                      width: 0.20 *
                                          MediaQuery.of(context).size.width,
                                      child: Text(
                                        cartItem.foodDescription,
                                        maxLines: 4,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CartButton(
                                quantity: cartItem.quantity,
                                onAdd: (qty) {
                                  _dataService.addToCart(
                                    usedId:
                                        FirebaseAuthService().currentUser!.id,
                                    foodItemId: cartItem.foodItemId,
                                    cafeteriaName: widget.cafeteria,
                                  );
                                },
                                onRemove: (qty) {
                                  _dataService.removeFromCart(
                                      usedId:
                                          FirebaseAuthService().currentUser!.id,
                                      foodItemId: cartItem.foodItemId,
                                      cafeteriaName: widget.cafeteria);
                                },
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                default:
                  debugPrint('default');
                  return const CircularProgressIndicator();
              }
            },
          ),
        ),
        Spacer(),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 105, 4, 4))),
            onPressed: () {
              setState(() {
                getTotalPrice(userId: FirebaseAuthService().currentUser!.id);
              });
              int timestamp = DateTime.now().millisecondsSinceEpoch;
              String id = FirebaseAuthService().currentUser!.id;

              PaymentProcess paymentProcessScreen = PaymentProcess(
                amount: "$amount",
                userId: FirebaseAuthService().currentUser!.id,
                cafeteria: widget.cafeteria,
                email: FirebaseAuthService().currentUser!.email,
                reference: "${timestamp}_${id}",
                orderID: "${timestamp}_${id}",
              );
              paymentProcessScreen.initiatePaymentProcess(context);
            },
            child: Text(
              "Place Order (GHS ${amount})",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
