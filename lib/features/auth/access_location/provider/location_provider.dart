import 'package:flutter/material.dart';
import 'package:food_app/core/common/app_snackbar.dart';
import 'package:location/location.dart';

class LocationProvider {
  Location location = Location();

  // Request for permissin
  Future<bool> requestPermission() async {
    final permission = await location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  // Get current location
  Future<LocationData> getCurrentLocation(BuildContext context) async {
    // First check if GPS is enabled
    final serviceEnabled = await location.serviceEnabled();

    // If service is not enebled then request user to enable it
    if (!serviceEnabled) {
      final result = await location.requestService();
      if (result == true) {
        AppSnackBar.show(context, message: "Service has been enabled");
      } else {
        throw Exception('GPS service not enabled');
      }
    }
    final locationData = await location.getLocation();
    AppSnackBar.show(context, message: "Your location is $locationData");
    return locationData;
  }
}
