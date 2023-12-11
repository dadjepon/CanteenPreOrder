import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/cart_item.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/presentation/payment_view/payment_page.dart';
import 'package:canteen_preorderapp/widgets/cart_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

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
        userId: FirebaseAuthService().currentUser!.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 105, 4, 4))),
          onPressed: () async {
            setState(() {
              getTotalPrice(userId: FirebaseAuthService().currentUser!.id);
            });
            int timestamp = DateTime.now().millisecondsSinceEpoch;
            String id = FirebaseAuthService().currentUser!.id;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentPage(
                  orderId: "${timestamp}_${id}",
                  amount: "$amount",
                  email: FirebaseAuthService().currentUser!.email,
                  reference: "${timestamp}_${id}",
                ),
              ),
            );
          },
          child: Text(
            "Make Payment ${amount}",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: StreamBuilder(
            stream: _dataService.allCartItems(
                userId: FirebaseAuthService().currentUser!.id),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final cartItems = snapshot.data as Iterable<CartItem>;
                    _dataService.calculatingTotalPrice(
                        userId: FirebaseAuthService().currentUser!.id)
                      ..then((value) {
                        setState(() {
                          getTotalPrice(
                              userId: FirebaseAuthService().currentUser!.id);
                        });
                      });

                    return Expanded(
                      child: StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 2,
                        crossAxisSpacing: 7.53.h,
                        mainAxisSpacing: 7.53.h,
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
                            child: Column(
                              children: [
                                Row(
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
                                      margin: EdgeInsets.only(right: 5.h),
                                    ),
                                    SizedBox(height: 9.v),
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
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.h),
                                          child: Center(
                                            child: Flexible(
                                              child: new Text(
                                                "Cafeteria: " +
                                                    cartItem.cafeteria,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0XFFE78F0B)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.h),
                                          child: Center(
                                            child: Flexible(
                                              child: new Text(
                                                "Price: Ghc " + cartItem.price,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0XFFE78F0B)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 9.v),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.h),
                                          child: Container(
                                            width: 0.25 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            child: Flexible(
                                              child: new Text(
                                                cartItem.foodDescription,
                                                maxLines: 4,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 0,
                                      child: CartButton(
                                        quantity: cartItem.quantity,
                                        onAdd: (qty) {
                                          _dataService.addToCart(
                                              usedId: FirebaseAuthService()
                                                  .currentUser!
                                                  .id,
                                              cartItem.foodItemId);
                                        },
                                        onRemove: (qty) {
                                          _dataService.removeFromCart(
                                              usedId: FirebaseAuthService()
                                                  .currentUser!
                                                  .id,
                                              cartItem.foodItemId);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
      ),
    );
  }
}
