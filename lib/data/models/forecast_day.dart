import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class ForecastDay {
  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour:
            List<Hour>.from(json["hour"].map((dynamic x) => Hour.fromJson(x))),
      );
  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final DateTime date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;
}
