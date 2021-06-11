import 'dart:convert';

import 'package:google_map_in_flutter/models/location.dart';
import 'package:google_map_in_flutter/services/api_keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PlacesService {
  final _apiKey = ApiKeys.sandBox();
  static final PlacesService _placesService = PlacesService._();
  factory PlacesService() => _placesService;
  PlacesService._();

  Future<List<Location>?> getPlaces(LatLng center) async {
    final url =
        'https://api.geoapify.com/v2/places?categories=education&filter=circle:${center.longitude},${center.latitude},10000&apiKey=${_apiKey.key}';
    final _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      final _decoded = jsonDecode(_response.body);
      return _decoded['features']
          .map<Location>((doc) => Location.fromJson(doc['properties']))
          .toList();
    } else {}
  }
}
