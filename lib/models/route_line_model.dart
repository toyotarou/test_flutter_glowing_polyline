import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class RouteLineModel {
  RouteLineModel({
    required this.id,
    required this.label,
    required this.points,
    this.coreColor = Colors.cyanAccent,
    this.glowColor = Colors.cyan,
    this.coreWidth = 4.0,
  });

  final String id;

  // ignore: unreachable_from_main
  final String label;
  final List<LatLng> points;
  final Color coreColor;
  final Color glowColor;
  final double coreWidth;
}
