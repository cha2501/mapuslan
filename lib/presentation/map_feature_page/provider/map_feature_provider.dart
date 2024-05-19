import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/map_feature_model.dart';

/// A provider class for the MapFeaturePage.
///
/// This provider manages the state of the MapFeaturePage, including the
/// current mapFeatureModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MapFeatureProvider extends ChangeNotifier {
  MapFeatureModel mapFeatureModelObj = MapFeatureModel();

  @override
  void dispose() {
    super.dispose();
  }
}
