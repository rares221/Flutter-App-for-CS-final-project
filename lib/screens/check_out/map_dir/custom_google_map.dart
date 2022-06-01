import 'package:flutter/material.dart';

import '../../../config/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomGoogleMap extends StatefulWidget{
  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {

  LatLng _initialCameraPosition = LatLng(45.649421349425445, 25.601579286506585);

  GoogleMapController _controller;

  void _onMapCreated(GoogleMapController _controller){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "Locatia ta pe harta",
          style: TextStyle(fontSize: 18, color: textColor),

        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(initialCameraPosition: CameraPosition(
              target: _initialCameraPosition,

            ),
              mapType: MapType.normal,
              onMapCreated: (plm){

              },
              mapToolbarEnabled: true,
              myLocationButtonEnabled: true,
            )
          ],

        ),
      ),
    );
  }
}
