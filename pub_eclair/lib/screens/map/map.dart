import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
          backgroundColor: TColors.primary,
          title: Text(
            TTexts.map,
            style: GoogleFonts.poppins(
              color: TColors.textWhite,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(5.3037, -4.0082),
          initialZoom: 15,
          interactionOptions: const InteractionOptions(
            flags: ~InteractiveFlag.doubleTapZoom
          ),
        ),
        children: [
          openStreetMapTileLater,
          MarkerLayer(markers: [
            Marker(
              point: LatLng(5.3037, -4.0082),
              width: 60,
              height: 60,
              alignment: Alignment.centerLeft,
              child: Icon(Icons.location_pin,
              size: 60,
              color: TColors.primary,)
            ),
            Marker(
              point: LatLng(4.02, 3.98),
              width: 60,
              height: 60,
              alignment: Alignment.centerLeft,
              child: Icon(Icons.location_pin,
              size: 60,
              color: TColors.primary,)
            ),
          ])
        ])
    );
  }
}

TileLayer get openStreetMapTileLater => TileLayer(
  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
  userAgentPackageName: "dev.fleaflet.flutter_map.example",
);
