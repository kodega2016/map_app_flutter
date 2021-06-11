// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    name: json['name'] as String?,
    street: json['street'] as String?,
    city: json['city'] as String?,
    municipality: json['municipality'] as String?,
    lon: (json['lon'] as num?)?.toDouble(),
    lat: (json['lat'] as num?)?.toDouble(),
    formatted: json['formatted'] as String?,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'street': instance.street,
      'city': instance.city,
      'municipality': instance.municipality,
      'lon': instance.lon,
      'lat': instance.lat,
      'formatted': instance.formatted,
      'categories': instance.categories,
    };
