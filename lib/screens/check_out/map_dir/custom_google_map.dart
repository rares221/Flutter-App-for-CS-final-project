import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:licenta_2022_vr/providers/check_out_provider.dart';

class CustomGoogleMap extends StatefulWidget{
  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {

  LatLng _initialCameraPosition = LatLng(45.649383128658435, 25.60150982684679);

  GoogleMapController controller;
  
  Location _location =Location();

  void _onMapCreated(GoogleMapController _value) {
    controller = _value;
    _location.onLocationChanged.listen((event) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.latitude, event.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "Locatia Curenta",
          style: TextStyle(fontSize: 18, color: textColor),

        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialCameraPosition,
                ),
                myLocationEnabled: true,
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                  EdgeInsets.only(right: 60, left: 10, bottom: 40, top: 40),
                  child: MaterialButton(
                    onPressed: () async {
                       await _location.getLocation().then((value) {
                         setState(() {
                           checkoutProvider.location = value;
                         });
                       });
                      Navigator.of(context).pop();
                    },
                    color: primaryColor,
                    child: Text("Seteaza locatia curenta"),
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
