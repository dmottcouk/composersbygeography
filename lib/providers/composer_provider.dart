import 'package:composersbygeography/helpers/geocoder_helper.dart';
import 'package:flutter/material.dart';
import '../models/composerwithdart.dart';
import '../models/placelocation.dart';

class ComposerProvider extends ChangeNotifier {
  ComposerWithDart _composer;
  bool _birthlocgeolocresult = false;
  bool _deathlocgeolocresult = false;
  PlaceLocation _birthlocation;
  PlaceLocation _deathlocation;

  void initComposer() {
    ComposerWithDart thecomposer =
        new ComposerWithDart(surname: null, firstnames: null, details: null);
    if (_composer == null) _composer = thecomposer;
  }

  void setComposerBirthLocation(String inputBirthLocation) async {
    PlaceLocation geoloc =
        await GeoCoderHelper.getlocationData(inputBirthLocation);
    if (geoloc.latitude > -100) {
      _birthlocgeolocresult = true;
      print('ComposerProvider: birthlocgeoresult = $_birthlocgeolocresult');
      _birthlocation = geoloc;
      notifyListeners();
    }
  }

 void setComposerDeathLocation(String inputDeathLocation) async {
    PlaceLocation geoloc =
        await GeoCoderHelper.getlocationData(inputDeathLocation);
    if (geoloc.latitude > -100) {
      _deathlocgeolocresult = true;
      print('ComposerProvider: deathlocgeoresult = $_deathlocgeolocresult');
      _deathlocation = geoloc;
      notifyListeners();
    }
  }


/*
  void setComposerBirthLocation(String inputBirthLocation) async {
    ComposerWithDart thecomposer =
        new ComposerWithDart(surname: null, firstnames: null, details: null);
    if (_composer == null) _composer = thecomposer;
    _birthlocgeolocresult =
        await _composer.setTempBirthLocation(inputBirthLocation);
    print('ComposerProvider: birthlocgeoresult = $_birthlocgeolocresult');
    notifyListeners();
  }
  */
/*
  void setComposerDeathLocation(String inputDeathLocation) async {
    ComposerWithDart thecomposer =
        new ComposerWithDart(surname: null, firstnames: null, details: null);
    if (_composer == null) _composer = thecomposer;
    _deathlocgeolocresult =
        await _composer.setTempDeathLocation(inputDeathLocation);
    print('ComposerProvider: deathlocgeoresult = $_deathlocgeolocresult');
    notifyListeners();
  }
*/
/*
  PlaceLocation getComposerBirthLocation() {
    return PlaceLocation(
        latitude: _composer.details.birthlatlng.lat,
        longitude: _composer.details.birthlatlng.long,
        address: _composer.details.placeofbirth);
  }
*/

  PlaceLocation getComposerBirthLocation() {
    return _birthlocation;
  }

  PlaceLocation getComposerDeathLocation() {
    return _deathlocation;
  }

  bool get birthlocgeolocresult {
    //print('birthlocgeolocresult = $birthlocgeolocresult');
    return (_birthlocgeolocresult);
  }

  bool get deathlocgeolocresult {
    //print('birthlocgeolocresult = $birthlocgeolocresult');
    return (_deathlocgeolocresult);
  }
}
