import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/dashboard_or_profile_card_normal_user_model.dart';

/// A provider class for the DashboardOrProfileCardNormalUserPage.
///
/// This provider manages the state of the DashboardOrProfileCardNormalUserPage, including the
/// current dashboardOrProfileCardNormalUserModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class DashboardOrProfileCardNormalUserProvider extends ChangeNotifier {
  DashboardOrProfileCardNormalUserModel
      dashboardOrProfileCardNormalUserModelObj =
      DashboardOrProfileCardNormalUserModel();

  @override
  void dispose() {
    super.dispose();
  }
}
