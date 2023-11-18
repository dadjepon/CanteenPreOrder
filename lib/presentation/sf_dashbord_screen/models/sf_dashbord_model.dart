import '../../../core/app_export.dart';
import 'all1_item_model.dart';
import 'beefburger1_item_model.dart';
import 'sfdashbord_item_model.dart';
import 'ghcthirtyfive1_item_model.dart';

/// This class defines the variables used in the [sf_dashbord_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SfDashbordModel {
  Rx<List<All1ItemModel>> all1ItemList = Rx([
    All1ItemModel(
        all: "All".obs, all1: ImageConstant.imgGrillChickenSpicy48x55.obs),
    All1ItemModel(all: "Breakfast".obs, all1: ImageConstant.imgPizzaSlice1.obs),
    All1ItemModel(all: "Drinks".obs, all1: ImageConstant.imgMeringue1.obs)
  ]);

  Rx<List<Beefburger1ItemModel>> beefburger1ItemList = Rx([
    Beefburger1ItemModel(
        beefBurger: ImageConstant.imgFastFoodBurger5.obs,
        beefBurger1: "Beef Burger".obs,
        ghcTwenty: "Ghc20/".obs)
  ]);

  Rx<List<SfdashbordItemModel>> sfdashbordItemList = Rx([
    SfdashbordItemModel(
        ghcThirtyFive: "Ghc35/".obs,
        ghc: ImageConstant.imgFries1111.obs,
        kingSize: "King Size".obs,
        burger: "BURGER".obs,
        fries: "+ Fries".obs,
        coke: "+ Coke ".obs,
        ghc1: ImageConstant.imgCocaColaBottle19.obs,
        ghc2: ImageConstant.imgChickenburger1.obs),
    SfdashbordItemModel(
        ghcThirtyFive: "Ghc35/".obs,
        ghc: ImageConstant.imgFries1111.obs,
        kingSize: "King Size".obs,
        burger: "BURGER".obs,
        fries: "+ Fries".obs,
        coke: "+ Coke ".obs,
        ghc1: ImageConstant.imgCocaColaBottle19.obs,
        ghc2: ImageConstant.imgChickenburger1.obs)
  ]);

  Rx<List<Ghcthirtyfive1ItemModel>> ghcthirtyfive1ItemList = Rx([
    Ghcthirtyfive1ItemModel(
        ghcThirtyFive: "Ghc35/".obs,
        kingSize: "King Size".obs,
        burger: "BURGER".obs,
        fries: "+ Fries".obs,
        coke: "+ Coke ".obs)
  ]);
}
