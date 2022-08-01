import 'package:flutter/material.dart';
import 'package:weather_app/data/models/location.dart';

typedef OnLocationTapped = void Function();

class LocationRow extends StatelessWidget {
  const LocationRow({
    required this.location,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Location location;
  final OnLocationTapped onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${location.name}, ${location.country}'),
      onTap: onTap,
    );
  }
}
