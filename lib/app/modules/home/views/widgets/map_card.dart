import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:kfs_governorate_app/app/core/theme/app_colors.dart';
import 'package:kfs_governorate_app/app/data/models/place_model.dart';
import 'package:kfs_governorate_app/app/modules/home/controllers/home_controller.dart';
import 'package:latlong2/latlong.dart';

List<Place> places = [
  Place(
    name: "Hotel A",
    type: "hotel",
    lat: 31.11,
    lng: 30.94,
    icon: Icons.hotel_rounded,
  ),
  Place(
    name: "Hospital B",
    type: "hospital",
    lat: 31.12,
    lng: 30.95,
    icon: Icons.local_hospital_rounded,
  ),
  Place(
    name: "Hospital A",
    type: "hospital",
    lat: 31.17,
    lng: 30.96,
    icon: Icons.local_hospital_rounded,
  ),
  Place(
    name: "Station A",
    type: "station",
    lat: 31.15,
    lng: 30.97,
    icon: Icons.directions_bus_rounded,
  ),
  Place(
    name: "Club A",
    type: "trip",
    lat: 31.17,
    lng: 30.99,
    icon: Icons.sports_soccer_rounded,
  ),
];

class MapScreen extends GetView<HomeController> {
  const MapScreen({super.key});

  List<Marker> getMarkers() {
    return places
        .where(
          (p) =>
              controller.selectedType.value == "all" ||
              p.type == controller.selectedType.value,
        )
        .map(
          (p) => Marker(
            point: LatLng(p.lat, p.lng),
            width: 40,
            height: 40,
            child: Tooltip(
              message: p.name,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
                ),
                child: Icon(p.icon, color: Colors.white, size: 22),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.explore_rounded,
                        color: AppColors.secondary,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'دليل العاصمة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'استكشف الأماكن الحيوية والمرافق الهامة',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _CapitalGuideIcon(
                        icon: Icons.local_hospital_rounded,
                        label: 'مستشفيات',
                        onTap: () => controller.changeFilter('hospital'),
                      ),
                      _CapitalGuideIcon(
                        icon: Icons.hotel_rounded,
                        label: 'فنادق',
                        onTap: () => controller.changeFilter('hotel'),
                      ),
                      _CapitalGuideIcon(
                        icon: Icons.directions_bus_rounded,
                        label: 'مواصلات',
                        onTap: () => controller.changeFilter('car'),
                      ),
                      _CapitalGuideIcon(
                        icon: Icons.sports_soccer_rounded,
                        label: 'نوادي',
                        onTap: () => controller.changeFilter('trip'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                height: 320,
                child: Stack(
                  children: [
                    FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLng(31.11, 30.94),
                        initialZoom: 11,
                        interactionOptions: InteractionOptions(
                          flags: InteractiveFlag.all,
                        ),
                      ),
                      children: [
                        TileLayer(
                          subdomains: ['a', 'b', 'c', 'd'],
                          urlTemplate:
                              "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png", // Dark
                          // urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png", // Light
                        ),
                        MarkerLayer(markers: getMarkers()),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _CapitalGuideIcon extends StatelessWidget {
  const _CapitalGuideIcon({
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.secondary, size: 28),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
