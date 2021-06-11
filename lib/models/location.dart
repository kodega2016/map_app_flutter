import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String? name;
  final String? street;
  final String? city;
  final String? municipality;
  final double? lon;
  final double? lat;
  final String? formatted;
  final List<String>? categories;

  Location({
    this.name,
    this.street,
    this.city,
    this.municipality,
    this.lon,
    this.lat,
    this.formatted,
    this.categories,
  });

  factory Location.fromJson(Map<String, dynamic> map) =>
      _$LocationFromJson(map);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/*
"name": "Shree Manohar H.S. School",
"street": "Urlabari-Madhumalla Road",
"city": "Urlabari",
"municipality": "Uralabari",
"county": "Morang",
"state": "Province #1",
"postcode": "56604",
"country": "Nepal",
"country_code": "np",
"lon": 87.6661661,
"lat": 26.7376721,
"formatted": "Shree Manohar H.S. School, Urlabari-Madhumalla Road, Urlabari, Morang 56604, Nepal",
"address_line1": "Shree Manohar H.S. School",
"address_line2": "Urlabari-Madhumalla Road, Urlabari, Morang 56604, Nepal",
"categories": [
  "education",
  "education.school"
],

*/