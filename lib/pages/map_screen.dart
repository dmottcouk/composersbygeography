import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/placelocation.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PlaceLocation location;
  MainFab _mainFAB;
  double _mapZoom;
  String _title;

  @override
  void initState() {
    _mainFAB = MainFab(location, _mapZoom);
    //_mapZoom = 16;
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    //location = ModalRoute.of(context).settings.arguments['loc'];

    location = routeArgs['loc'] as PlaceLocation;

    // _mapZoom = ModalRoute.of(context).settings.arguments['zoom'];
    _mapZoom = routeArgs['zoom'] as double;

    _title = routeArgs['title'] as String;

    print(
        'MapScreen :didChangeDependencies : lat=${location.latitude} lat=${location.longitude} ');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '$_title',
          ),
        ),
        body: GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              location.latitude,
              location.longitude,
            ),
            zoom: _mapZoom,
          ),
          onMapCreated: _onMapCreated,
          // a set is a bit like a list but the values are guaranteed to be unique
          markers: {
            Marker(
                markerId: MarkerId('A'),
                position: LatLng(location.latitude, location.longitude),
                onTap: () {})
          },
        ),
        floatingActionButton: MainFab(location, _mapZoom));
  }
}

class MainFab extends StatefulWidget {
  PlaceLocation _currentLocation;
  double _currentZoom;
  MainFab(this._currentLocation, this._currentZoom);

  @override
  _MainFabState createState() => _MainFabState();
}

class _MainFabState extends State<MainFab> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync:
          this, // informs flutter that the naimation is applicable to this screen
      duration: Duration(milliseconds: 400),
    ); // vsync is unlocked by the TickerProviderStateMixin
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);

    return Column(
      mainAxisSize: MainAxisSize
          .min, // note that floatingActionButton in Scaffold is at bottom so this means min at bottom
      children: [
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset
              .topCenter, // do positioning with the child size taken into account
          child: ScaleTransition(
            scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.3, 1.0, curve: Curves.easeOut)),
            child: FloatingActionButton(
              child: Icon(Icons.zoom_in, color: Theme.of(context).primaryColor),
              backgroundColor: Theme.of(context).cardColor,
              heroTag: 'refresh',
              mini: true,
              onPressed: () {
                print('loc lat = ${widget._currentLocation.latitude}');
                print('loc long = ${widget._currentLocation.longitude}');
                print('zoom = ${widget._currentZoom}');

                Navigator.of(context)
                    .pushReplacementNamed(MapScreen.routeName, arguments: {
                  'loc': widget._currentLocation,
                  'zoom': widget._currentZoom < 23.0 ? widget._currentZoom + 3.0 : widget._currentZoom // + 1.0
                });
              },
            ),
          ),
        ),
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 0.6,
                    curve: Curves.easeOut)), // we done animating by 0.6 x 400
            child: FloatingActionButton(
              child: Icon(Icons.zoom_out, color: Colors.red),
              backgroundColor: Theme.of(context).cardColor,
              heroTag: 'map',
              mini: true,
              onPressed: () {
                print('loc lat = ${widget._currentLocation.latitude}');
                print('loc long = ${widget._currentLocation.longitude}');
                print('zoom = ${widget._currentZoom}');

                Navigator.of(context)
                    .pushReplacementNamed(MapScreen.routeName, arguments: {
                  'loc': widget._currentLocation,
                  'zoom': widget._currentZoom > 4.0  ? widget._currentZoom - 3.0 : widget._currentZoom  // + 1.0
                });
              },
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: 'options',
          onPressed: () {
            if (_controller.isDismissed) {
              _controller.forward(); // play the animation in forward direction
            } else {
              _controller.reverse();
            }
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                child: Icon(
                    _controller.isDismissed ? Icons.more_vert : Icons.close),
              );
            },
          ),
        )
      ],
    );
  }
}
