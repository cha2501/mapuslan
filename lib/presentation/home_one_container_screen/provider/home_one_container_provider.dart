import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_one_container_model.dart';

/// A provider class for the HomeOneContainerScreen.
///
/// This provider manages the state of the HomeOneContainerScreen, including the
/// current homeOneContainerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeOneContainerProvider extends ChangeNotifier {
  HomeOneContainerModel homeOneContainerModelObj = HomeOneContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
