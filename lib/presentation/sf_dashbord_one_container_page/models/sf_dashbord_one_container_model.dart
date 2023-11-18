import '../../../core/app_export.dart';
import 'all_item_model.dart';
import 'beefburger_item_model.dart';
import 'ghcthirtyfive_item_model.dart';

/// This class defines the variables used in the [sf_dashbord_one_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SfDashbordOneContainerModel {
  Rx<List<AllItemModel>> allItemList = Rx([
    AllItemModel(
        all: "All".obs, all1: ImageConstant.imgGrillChickenSpicy48x55.obs),
    AllItemModel(all: "Akornor".obs, all1: ImageConstant.imgPizzaSlice1.obs),
    AllItemModel(all: "Munchies".obs, all1: ImageConstant.imgMeringue1.obs)
  ]);

  Rx<List<BeefburgerItemModel>> beefburgerItemList = Rx([
    BeefburgerItemModel(
        beefBurger: ImageConstant.imgFastFoodBurger5.obs,
        beefBurger1: "Beef Burger".obs,
        ghcTwenty: "Ghc20/".obs)
  ]);

  Rx<List<GhcthirtyfiveItemModel>> ghcthirtyfiveItemList = Rx([
    GhcthirtyfiveItemModel(
        ghcThirtyFive: "Ghc35/".obs,
        ghc: ImageConstant.imgFries1111.obs,
        kingSize: "King Size".obs,
        burger: "BURGER".obs,
        fries: "+ Fries".obs,
        coke: "+ Coke ".obs,
        ghc1: ImageConstant.imgCocaColaBottle19.obs,
        ghc2: ImageConstant.imgChickenburger1.obs)
  ]);
}
