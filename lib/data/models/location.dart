import 'dart:convert';

class Location {
  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        url: json["url"],
      );
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    this.url,
    this.id,
  });

  static List<Location> locationFromJson(String str) => List<Location>.from(
      json.decode(str).map((dynamic x) => Location.fromJson(x)));

  final int? id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String? url;
}
