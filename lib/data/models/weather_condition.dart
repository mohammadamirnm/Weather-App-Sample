import 'package:flutter/material.dart';

class WeatherCondition {
  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      WeatherCondition(
        text: textValues.map[json["text"]],
        icon: json["icon"],
        code: json["code"],
      );
  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final WeatherType? text;
  final String icon;
  final int code;
}

enum WeatherType {
  partlyCloudy,
  moderateRain,
  patchyRainPossible,
  sunny,
  lightRainShower,
  moderateOrHeavyRainShower,
  clear,
  cloudy,
  overcast
}

final EnumValues<WeatherType> textValues =
    EnumValues<WeatherType>(<String, WeatherType>{
  "Clear": WeatherType.clear,
  "Cloudy": WeatherType.cloudy,
  "Light rain shower": WeatherType.lightRainShower,
  "Moderate or heavy rain shower": WeatherType.moderateOrHeavyRainShower,
  "Moderate rain": WeatherType.moderateRain,
  "Overcast": WeatherType.overcast,
  "Partly cloudy": WeatherType.partlyCloudy,
  "Patchy rain possible": WeatherType.patchyRainPossible,
  "Sunny": WeatherType.sunny
});

final Map<WeatherType, IconData> weatherIcons = <WeatherType, IconData>{
  WeatherType.clear: Icons.sunny,
  WeatherType.cloudy: Icons.cloud,
  WeatherType.lightRainShower: Icons.water_drop,
  WeatherType.moderateOrHeavyRainShower: Icons.water,
  WeatherType.moderateRain: Icons.cloudy_snowing,
  WeatherType.overcast: Icons.foggy,
  WeatherType.partlyCloudy: Icons.cloud_off_sharp,
  WeatherType.patchyRainPossible: Icons.water_drop,
  WeatherType.sunny: Icons.sunny,
};

class EnumValues<T> {
  EnumValues(this.map);

  Map<String, T> map;

  Map<T, String> get reverse {
    final Map<T, String> reverseMap =
        map.map((String k, T v) => MapEntry<T, String>(v, k));

    return reverseMap;
  }
}
