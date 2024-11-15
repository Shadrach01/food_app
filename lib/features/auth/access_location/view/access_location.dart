import 'package:flutter/material.dart';
import 'package:food_app/core/common/widgets/app_container.dart';
import 'package:food_app/core/utils/color_res.dart';
import 'package:food_app/core/utils/image_res.dart';
import 'package:food_app/features/auth/access_location/provider/location_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AccessLocation extends StatefulWidget {
  const AccessLocation({super.key});

  @override
  State<AccessLocation> createState() => _AccessLocationState();
}

class _AccessLocationState extends State<AccessLocation> {
  // Initial location for the map's camera position (latitude and longitude)
  LatLng myCurrentLocation = const LatLng(27.7172, 85.3240);
  late GoogleMapController googleMapController;
  Set<Marker> marker = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appKWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 70),
            Center(
              child: Image.asset(
                ImageRes.accessLocation,
                width: 400,
                height: 400,
              ),
              // Container(
              //   width: 300,
              //   height: 300,
              //   decoration: const BoxDecoration(
              //     color: ColorRes.appKWhite,
              //     shape: BoxShape.circle,
              //   ),
              //   clipBehavior: Clip.hardEdge,
              //   child: GoogleMap(
              //     myLocationButtonEnabled: false,
              //     markers: marker,
              //     onMapCreated: (controller) {
              //       googleMapController = controller;
              //     },
              //     initialCameraPosition:
              //         CameraPosition(target: myCurrentLocation),
              //   ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                Position position = await currentPosition();
                googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      zoom: 30,
                      target: LatLng(position.latitude, position.longitude),
                    ),
                  ),
                );
                marker.clear();
                marker.add(
                  Marker(
                    markerId: const MarkerId("This is my location"),
                    position: LatLng(position.latitude, position.longitude),
                  ),
                );
                setState(() {});
              },
              child: appContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "ACCESS LOCATION",
                      style: TextStyle(
                        color: ColorRes.appKWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: ColorRes.appKWhite.withOpacity(.4),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: const Icon(
                        Icons.add_location,
                        color: ColorRes.appKWhite,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "FOODAPP WILL LIKE TO ACCESS YOUR LOCATION ONLY WHY USING THE APP",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorRes.appKGrey,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Future<Position> currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled or not
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    // Check location permission status
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location denied permanently");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
