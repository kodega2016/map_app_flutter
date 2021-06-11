import 'package:flutter/material.dart';
import 'package:google_map_in_flutter/notifiers/places_notifier.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlacesNotifier>(builder: (context, noty, _) {
      return ListView.builder(
        itemCount: noty.places.length,
        itemBuilder: (context, i) {
          final _place = noty.places[i];
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black12,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_place.name}',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '${_place.formatted}',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    ..._place.categories!.map((e) {
                      return Chip(
                        label: Text(
                            '${e[0].toUpperCase()}${e.substring(1, e.length)}'),
                      );
                    }).toList(),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
