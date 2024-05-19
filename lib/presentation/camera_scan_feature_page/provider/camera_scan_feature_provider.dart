import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/camera_scan_feature_model.dart';

/// A provider class for the CameraScanFeaturePage.
///
/// This provider manages the state of the CameraScanFeaturePage, including the
/// current cameraScanFeatureModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CameraScanFeatureProvider extends ChangeNotifier {
  CameraScanFeatureModel cameraScanFeatureModelObj = CameraScanFeatureModel();

  @override
  void dispose() {
    super.dispose();
  }
}
