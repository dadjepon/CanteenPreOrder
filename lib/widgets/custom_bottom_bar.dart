import 'package:canteenpreorder/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgVectorWhiteA700,
      activeIcon: ImageConstant.imgVectorWhiteA700,
      title: "lbl_22".tr,
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVectorWhiteA70020x20,
      activeIcon: ImageConstant.imgVectorWhiteA70020x20,
      title: "lbl_22".tr,
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVectorPrimary,
      activeIcon: ImageConstant.imgVectorPrimary,
      title: "lbl_22".tr,
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVector20x20,
      activeIcon: ImageConstant.imgVector20x20,
      title: "lbl_22".tr,
      type: BottomBarEnum.tf,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.v,
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 17.v,
                width: 20.h,
                color: appTheme.whiteA700,
              ),
              activeIcon: SizedBox(
                height: 33.v,
                width: 26.h,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      color: theme.colorScheme.primary,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(
                        top: 12.v,
                        right: 6.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 14.adaptSize,
                        width: 14.adaptSize,
                        margin: EdgeInsets.only(
                          left: 12.h,
                          top: 1.v,
                          bottom: 17.v,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                            7.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          right: 4.h,
                          bottom: 18.v,
                        ),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: appTheme.whiteA700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  tf,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
