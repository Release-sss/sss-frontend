import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.onClick});

  final Function(int) onClick;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? _controller;
  static const LatLng _center = const LatLng(37.514703, 126.975570);
  static const _zoom = 13.0;
  static final _initalCameraLocation = const CameraPosition(target: _center, zoom: _zoom);
  final List<Marker> _markers = [];
  @override
  void initState(){
    super.initState();
    _updateMarkers([{"id":1, "lat":37.5217, "lon":126.977570}]);
    _updateMarkers([{"id":2, "lat":37.5197, "lon":126.988570}]);
    _updateMarkers([{"id":3, "lat":37.5197, "lon":126.979370}]);
    _updateMarkers([{"id":4, "lat":37.5197, "lon":126.980270}]);
    _updateMarkers([{"id":5, "lat":37.5197, "lon":126.989970}]);
    _updateMarkers([{"id":6, "lat":37.5197, "lon":126.979170}]);
  }

  void changeMapMode(GoogleMapController mapController) {
    getJsonFile("assets/google_map_style.json")
        .then((value) => setMapStyle(value, mapController));
  }
  
  //helper function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }
  
  //helper function
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes,byte.lengthInBytes);
    return utf8.decode(list);
  }

	Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  _updateMarkers(List<dynamic> responses){
    print(responses);
    for(var data in responses){
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(data["id"].toString()),
            onTap: ()=>widget.onClick(data["id"] is int ? data["id"] : int.parse(data["id"])),
            position: LatLng(data["lat"], data["lon"]),
          )
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: Set.from(_markers),
      mapType: MapType.normal,
      initialCameraPosition: _initalCameraLocation,
      onMapCreated: (GoogleMapController controller){
        changeMapMode(controller);
        // setState((){
        //   _controller = controller;
        // });
      });
  }
}