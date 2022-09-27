import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grafu/models/address.dart';
import 'package:grafu/module/principal/container/playday/line.dart';
import 'package:grafu/module/principal/container/playday/section_title.dart';
import 'package:grafu/styles/text_style.dart';

class Location extends StatefulWidget {
  final Address address;

  const Location({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<Location> createState() => LocationState();
}

class LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller = Completer();

    const CameraPosition position = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Line(),
        const SectionTitle(title: 'Local'),
        const SizedBox(height: 12.0),
        Row(
          children: [
            Text(
              widget.address.district,
              style: textStrongStyle,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              widget.address.street,
              style: textStrongStyle,
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          width: double.maxFinite,
          height: 250.0,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: position,
            onMapCreated: (GoogleMapController c) {
              controller.complete(c);
            },
          ),
        ),
      ],
    );
  }
}
