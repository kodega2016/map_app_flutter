import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_in_flutter/models/location.dart';
import 'package:google_map_in_flutter/services/places_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesNotifier extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late LatLng _center;
  LatLng get center => _center;

  List<Location> _places = [];
  List<Location> get places => _places;

  final PlacesService placesService = PlacesService();
  PlacesNotifier() {
    _init();
  }

  _init() async {
    try {
      _isLoading = true;
      notifyListeners();
      await Geolocator.checkPermission();
      final _currentLocation = await Geolocator.getCurrentPosition();
      _center = LatLng(_currentLocation.latitude, _currentLocation.longitude);
      _getPlaces(_center);
    } catch (e) {} finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  _getPlaces(LatLng center) async {
    final _data = await placesService.getPlaces(center);
    _places = _data ?? [];
    notifyListeners();
  }
}
