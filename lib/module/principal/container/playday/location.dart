import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grafu/models/address.dart';

class Location extends StatelessWidget {
  final Address address;

  const Location({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller = Completer();

    const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Local',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            Text(address.district,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        Row(
          children: [
            Text(address.street),
          ],
        ),
        Row(
          children: [
            Text('${address.city},'),
            const SizedBox(width: 10.0),
            Text(address.state),
          ],
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: double.maxFinite,
          height: 250.0,
          child: GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: kLake,
            onMapCreated: (GoogleMapController c) {
              controller.complete(c);
            },
          ),
        ),
      ],
    );
  }
}
