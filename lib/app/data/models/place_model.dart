import 'package:flutter/material.dart';

class Place {
  final String name;
  final String type;
  final double lat;
  final double lng;
  final IconData icon;

  Place({
    required this.icon,
    required this.name,
    required this.type,
    required this.lat,
    required this.lng,
  });
}