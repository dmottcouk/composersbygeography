import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/composerwithdart.dart';
import '../models/placelocation.dart';

import '../helpers/geocoder_helper.dart';

/*
{this.category,
      this.subcategory,
      this.dateofbirth,
      this.placeofbirth,
      this.birthlatlng,
      this.dateofdeath,
      this.placeofdeath,
      this.deathlatlng,
      this.bio,
      this.youtubelinks,
      this.textlinks});
*/

class ComposerProvider extends ChangeNotifier {
  ComposerWithDart _composer;
  bool _birthlocgeolocresult = false;
  bool _deathlocgeolocresult = false;
  PlaceLocation _birthlocation;
  PlaceLocation _deathlocation;

  void initComposer() {
    ComposerWithDart thecomposer = new ComposerWithDart(
        surname: null,
        firstnames: null,
        details: Details(
            category: "",
            subcategory: "",
            dateofbirth: "",
            placeofbirth: "",
            birthlatlng: Birthlatlng(lat: 0.0, long: 0.0),
            dateofdeath: "",
            placeofdeath: "",
            deathlatlng: Deathlatlng(lat: 0.0, long: 0.0),
            bio: [""],
            youtubelinks: [""],
            textlinks: [""]));
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

  void setComposerSurName(String surname) {
    print('setComposerSurname $surname');
    initComposer();
    _composer.surname = surname;
  }

  void setComposerFirstNames(String firstnames) {
    initComposer();
    _composer.firstnames = firstnames;
  }

  void setComposerCategory(String category) {
    print('Setting category as $category');
    initComposer();
    _composer.details.category = category;
  }

  void setComposersubCategory(String subCategory) {
    initComposer();
    _composer.details.subcategory = subCategory;
  }

  void setComposerDOB(String dob) {
    initComposer();
    _composer.details.dateofbirth = dob;
  }

  void setComposerPlaceOfBirth() {
    initComposer();
    _composer.details.placeofbirth = _birthlocation.address;
  }

  void setComposerBirthLatLng() {
    initComposer();
    _composer.details.birthlatlng = Birthlatlng(
        lat: _birthlocation.latitude, long: _birthlocation.longitude);
  }

  void setComposerDOD(String dod) {
    initComposer();
    _composer.details.dateofdeath = dod;
  }

  void setComposerPlaceOfDeath() {
    initComposer();
    _composer.details.placeofdeath = _deathlocation.address;
  }

  void setComposerDeathLatLng() {
    initComposer();
    _composer.details.placeofdeath = _deathlocation.address;
  }

  void setComposerbio(String bio) {
    initComposer();
    LineSplitter ls = new LineSplitter();
    _composer.details.bio = ls.convert(bio);
  }

  void setComposeryoutubelinks(String youtubelinks) {
    initComposer();
    LineSplitter ls = new LineSplitter();
    _composer.details.youtubelinks = ls.convert(youtubelinks);
  }

  void setComposertextlinks(String textlinks) {
    initComposer();
    LineSplitter ls = new LineSplitter();
    _composer.details.textlinks = ls.convert(textlinks);
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

  void saveToBackEnd() async {
    //save the composer to the database
    print('Save composer to backend');
    final url =
        'https://https://britishcomposers-6447e.firebaseio.com//composers.json';
    //encode knows how to convert maps to json !!
    // if you use async you wrap all the code into a future so you would not need the return on http
    //return http
    // so instead of catchError when you use async/await you can use try / catch
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'surname': _composer.surname,
          'firstnames': _composer.firstnames,
          'details': {
            'bio': _composer.details.bio,
            'category': _composer.details.category,
            'birthlatlng': {
              'lat': _composer.details.birthlatlng.lat,
              'long': _composer.details.birthlatlng.long
            },

            'dateofbirth': _composer.details.dateofbirth,
            'placeofbirth': _composer.details.placeofbirth,
            'deathlatlng': {
              'lat': _composer.details.deathlatlng.lat,
              'long': _composer.details.deathlatlng.long
            },
            'dateofdeath': _composer.details.dateofdeath,
            'placeofdeath': _composer.details.placeofdeath,
            'textlinks':  _composer.details.textlinks,
            'youtubelinks': _composer.details.youtubelinks
          }
        }),
      );
      //final newProduct = Product(
      //  title: product.title,
      //  description: product.description,
      //  price: product.price,
      //  imageUrl: product.imageUrl,
      //  id: json.decode(response.body)['name'],
      //);
      // _items.add(newProduct);
      //_items.insert(0, newProduct);
      notifyListeners();
      // note we could send this to the analytics server
      //})
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
