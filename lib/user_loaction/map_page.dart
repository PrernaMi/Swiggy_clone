import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? currentPos;
  Completer<GoogleMapController> mController = Completer<GoogleMapController>();

  @override
  void initState() {
    getCurrentLocation(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.satellite,
          onMapCreated: (controller) {
            mController.complete(controller);
          },
          markers: {
            Marker(
                markerId: MarkerId("Current location"),
                position: currentPos ?? LatLng(0, 0),
                infoWindow:
                    InfoWindow(title: "My location", snippet: "Using GPS"))
          },
          initialCameraPosition: CameraPosition(
              target: currentPos ?? LatLng(0, 0),
              bearing: 192,
              tilt: 59.440717697143555,
              zoom: 19.151926040649414)),
    );
  }

  void getCurrentLocation({required BuildContext context}) async {
    bool isCheck = await checkBeforeCallingPermission(context: context);
    if (isCheck) {
      var currPos = await Geolocator.getCurrentPosition();
      currentPos = LatLng(currPos.latitude, currPos.longitude);
      GoogleMapController mapController = await mController.future;
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(currPos.latitude, currPos.longitude),
          bearing: 192,
          tilt: 59.440717697143555,
          zoom: 19.151926040649414)));
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("Don't have the proper permission to access loaction..")));
    }
  }

  Future<bool> checkBeforeCallingPermission(
      {required BuildContext context}) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Permission is denied")));
          return false;
        } else if (permission == LocationPermission.deniedForever) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Location permissions are permanently denied, we cannot request permissions.")));
          return false;
        } else
          return true;
      } else {
        return true;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location services are disabled..")));
      return false;
    }
  }
}
