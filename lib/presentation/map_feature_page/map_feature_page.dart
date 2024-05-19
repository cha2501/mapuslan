import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'package:geolocator/geolocator.dart';
import 'models/map_feature_model.dart';
import 'provider/map_feature_provider.dart'; // ignore_for_file: must_be_immutable

class MapFeaturePage extends StatefulWidget {
  const MapFeaturePage({Key? key})
      : super(
          key: key,
        );

  @override
  MapFeaturePageState createState() => MapFeaturePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapFeatureProvider(),
      child: MapFeaturePage(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MapFeaturePageState extends State<MapFeaturePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        body: Stack(
          alignment: Alignment.center,
          children: [
            _buildMapSection(context),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 11.h,
                  vertical: 25.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.v),
                    // Your other UI components can go here
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMapSection(BuildContext context) {
    return FutureBuilder<Position>(
      future: _determinePosition(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while fetching location
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Show error message if location fetch fails
        } else {
          final currentPosition = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Latitude: ${currentPosition.latitude}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Longitude: ${currentPosition.longitude}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          );
        }
      },
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}

