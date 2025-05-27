import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
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
      body: Column(
        children: [
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                TAppBar(
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
                const SizedBox(height: TSizes.spaceBtwSections),
                // SearchBar
                TSearchContainer(),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(5.292206072969135, -3.9986412227153783),
                initialZoom: 15,
                interactionOptions: const InteractionOptions(
                  flags: ~InteractiveFlag.doubleTapZoom,
                ),
              ),
              children: [
                openStreetMapTileLater,
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(5.290728882830207, -3.9987547805102657),
                      width: 60,
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.location_pin,
                        size: 60,
                        color: TColors.primary,
                      ),
                    ),
                    Marker(
                      point: LatLng(5.290526824714783, -3.9992161741767194),
                      width: 60,
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.location_pin,
                        size: 60,
                        color: TColors.success,
                      ),
                    ),
                    Marker(
                      point: LatLng(5.290924676244146, -3.99903378608407),
                      width: 60,
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.location_pin,
                        size: 60,
                        color: TColors.success,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLater => TileLayer(
  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
  userAgentPackageName: "dev.fleaflet.flutter_map.example",
);
