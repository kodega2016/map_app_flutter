import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_in_flutter/notifiers/places_notifier.dart';
import 'package:google_map_in_flutter/screens/place_list.dart';
import 'package:google_map_in_flutter/screens/place_map.dart';
import 'package:provider/provider.dart';

import 'models/enums.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlacesNotifier>(
          create: (_) => PlacesNotifier(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Mero Thau',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.padauk().fontFamily,
          primaryColor: Color(0xff309975),
          accentColor: Color(0xff454D66),
        ),
        home: MyMap(),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  ViewMode _viewMode = ViewMode.Map;

  void _toggleMode() {
    _viewMode = _viewMode == ViewMode.List ? ViewMode.Map : ViewMode.List;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mero Thau'),
        elevation: 2.0,
        actions: [
          IconButton(
            onPressed: _toggleMode,
            icon: Icon(Icons.map_rounded),
          ),
        ],
      ),
      body: _viewMode == ViewMode.Map ? PlacesMap() : PlacesList(),
    );
  }
}
