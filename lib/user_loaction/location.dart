import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swiggy_clone/user_loaction/map_page.dart';

class LocationPage extends StatelessWidget {
  double lat = 0;
  double longi = 0;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter your area or apartment name",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Try JP nagar, Siri Gardenia, etc..",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: InkWell(
              overlayColor: WidgetStateColor.transparent,
              onTap: () async{
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MapPage();
                }));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  Text(
                    "Use my current location",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
