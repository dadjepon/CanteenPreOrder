import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/models/order_item.dart';
import 'package:canteen_preorderapp/widgets/designs/order_tracking.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentOrdersScreen extends StatefulWidget {
  const CurrentOrdersScreen({super.key});

  @override
  State<CurrentOrdersScreen> createState() => _CurrentOrdersScreenState();
}

class _CurrentOrdersScreenState extends State<CurrentOrdersScreen> {
  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: StreamBuilder(
            stream: _dataService.allOrderItems(
                userId: FirebaseAuthService().currentUser!.id),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final orderItems = snapshot.data as Iterable<OrderItem>;

                    return Expanded(
                      child: StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 1,
                        crossAxisSpacing: 7.53.h,
                        mainAxisSpacing: 7.53.h,
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.fit(1);
                        },
                        itemCount: orderItems.length,
                        itemBuilder: (context, index) {
                          final orderItem = orderItems.elementAt(index);
                          var orderComponents = [];
                          for (int i = 0;
                              i < orderItem.orderComponents.length;
                              i++) {
                            orderComponents.add(
                                "${orderItem.orderComponents[i]['quantity']} - ${orderItem.orderComponents[i]['foodName']}");
                          }

                          // Example food name
                          return Container(
                            width: 0.7 * MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.h,
                              vertical: 3.v,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Color(0XFF6B0808),
                              )),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 9.v),
                                      Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              "OrderItems: ${orderComponents}",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0XFFE78F0B)),
                                            ),
                                          ),
                                          SizedBox(height: 9.v),
                                          Center(
                                            child: Text(
                                              "OrderID: " + orderItem.orderId,
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
                                                  "Time placed: " +
                                                      orderItem.timestamp,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  "Price: Ghc " +
                                                      orderItem.amount,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0XFFE78F0B)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: OrderTracking(
                                        orderStage:
                                            int.parse(orderItem.orderStage)),
                                    height: 160.v,
                                  ),
                                ],
                              ),
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
