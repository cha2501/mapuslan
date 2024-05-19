import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../camera_scan_feature_page/camera_scan_feature_page.dart';
import '../dashboard_or_profile_card_normal_user_page/dashboard_or_profile_card_normal_user_page.dart';
import '../map_feature_page/map_feature_page.dart';
import 'models/home_one_container_model.dart';
import 'provider/home_one_container_provider.dart';

class HomeOneContainerScreen extends StatefulWidget {
  const HomeOneContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  HomeOneContainerScreenState createState() => HomeOneContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeOneContainerProvider(),
      child: HomeOneContainerScreen(),
    );
  }
}

class HomeOneContainerScreenState extends State<HomeOneContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Navigator(
          key: navigatorKey,
          initialRoute: "/",
          onGenerateRoute: (routeSetting) =>
              PageRouteBuilder(pageBuilder: (ctx, ani, ani1) {
            return getCurrentPage(context, routeSetting.name!);
          }, transitionDuration: Duration(seconds: 0)),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: _buildBottombar(context),
        ),
      ),
    );
  }

  Widget _buildBottombar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Map:
        return AppRoutes.mapFeaturePage;
      case BottomBarEnum.Camera:
        return AppRoutes.cameraScanFeaturePage;
      case BottomBarEnum.Notifications:
        return "/";
      case BottomBarEnum.Profile:
        return AppRoutes.dashboardOrProfileCardNormalUserPage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.mapFeaturePage:
        return MapFeaturePage.builder(context);
      case AppRoutes.cameraScanFeaturePage:
        return CameraScanFeaturePage.builder(context);
      case AppRoutes.dashboardOrProfileCardNormalUserPage:
        return DashboardOrProfileCardNormalUserPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
