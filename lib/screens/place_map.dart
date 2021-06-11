import 'package:flutter/material.dart';
import 'package:google_map_in_flutter/notifiers/places_notifier.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PlacesMap extends StatefulWidget {
  const PlacesMap({Key? key}) : super(key: key);

  @override
  _PlacesMapState createState() => _PlacesMapState();
}

class _PlacesMapState extends State<PlacesMap> {
  late GoogleMapController controller;

  void onMapCreated(GoogleMapController mapController) {
    controller = mapController;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlacesNotifier>(builder: (context, noty, _) {
      var markers = noty.places.map<Marker>((e) {
        return Marker(
          position: LatLng(e.lat!, e.lon!),
          markerId: MarkerId(e.name ?? ''),
          infoWindow: InfoWindow(title: e.name, snippet: e.city),
        );
      }).toSet();

      return noty.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: context.read<PlacesNotifier>().center,
                    zoom: 12,
                  ),
                  markers: [
                    ...markers,
                    Marker(
                      markerId: MarkerId('current'),
                      position: noty.center,
                      infoWindow: InfoWindow(
                        title: 'My Current Location',
                        snippet: 'I am browsing from here...:)',
                      ),
                    )
                  ].toSet(),
                ),
                Container(
                  height: 80,
                  margin: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: noty.places.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      final _location = noty.places[i];
                      return Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(_location.name ?? ''),
                          subtitle: Text(_location.street ?? ''),
                          onTap: () {
                            controller.moveCamera(
                              CameraUpdate.newLatLng(
                                  LatLng(_location.lat!, _location.lon!)),
                            );

                            controller.showMarkerInfoWindow(
                                MarkerId(_location.name!));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
    });
  }
}
