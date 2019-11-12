import 'package:composersbygeography/helpers/geocoder_helper.dart';

import './placelocation.dart';

class ComposerCatWithDart {
  String surname;
  String firstnames;
  String cat;
  Details2 details2;

  ComposerCatWithDart({this.surname, this.firstnames, this.cat, this.details2});

  ComposerCatWithDart.fromJson(Map<String, dynamic> json) {
    surname = json['surname'];
    firstnames = json['firstnames'];
    cat = json['cat'];
    details2 =
        json['details'] != null ? new Details2.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surname'] = this.surname;
    data['firstnames'] = this.firstnames;
    data['cat'] = this.cat;
    if (this.details2 != null) {
      data['details2'] = this.details2.toJson();
    }
    return data;
  }

  Future<bool> setTempBirthLocation(String userinputlocation) async {
    print('Composerwithdart: setTempBirthLocation');
    PlaceLocation geoloc =
        await GeoCoderHelper.getlocationData(userinputlocation);
    if (geoloc.latitude > -100) {
      print('Composerwithdart: setTempBirthLocation create new Details');

      Details2 newdetails = new Details2(
          //category: details2 == null ? "dummy" : details2.category,
          subcategory: details2 == null ? "dummy" : details2.subcategory,
          dateofbirth: details2 == null ? "dummy" : details2.dateofbirth,
          placeofbirth:
              geoloc.address.length == null ? "unknown" : geoloc.address,
          birthlatlng:
              Birthlatlng(lat: geoloc.latitude, long: geoloc.longitude),
          dateofdeath: details2 == null ? "dummy" : details2.dateofdeath,
          placeofdeath: details2 == null ? "unknown" : details2.placeofdeath,
          deathlatlng: details2 == null
              ? Deathlatlng(lat: -800.0, long: -800.0)
              : Deathlatlng(lat: -800.0, long: -800.0),
          bio: details2 == null ? ['dummy'] : details2.bio,
          youtubelinks: details2 == null ? ['dummy'] : details2.youtubelinks,
          textlinks: details2 == null ? ['dummy'] : details2.textlinks);

      this.details2 = newdetails;
      return true;
    } else {
      print('Composerwithdart: setTempBirthLocation cannot get a geoloc');
      return false;
    }
  }
}
/*
Future<bool> setTempDeathLocation(String userinputlocation) async {
    print('Composerwithdart: setTempBirthLocation');
    PlaceLocation geoloc =
        await GeoCoderHelper.getlocationData(userinputlocation);
    if (geoloc.latitude > -100) {
      print('Composerwithdart: setTempBirthLocation create new Details');

      Details newdetails = new Details(
          category: details == null ? "dummy" : details.category,
          subcategory: details == null ? "dummy" : details.category,
          dateofbirth: details == null ? "dummy" : details.dateofbirth,
          placeofbirth:
              geoloc.address.length == null ? "unknown" : geoloc.address,
          birthlatlng:
              Birthlatlng(lat: geoloc.latitude, long: geoloc.longitude),
          dateofdeath: details == null ? "dummy" : details.dateofdeath,
          placeofdeath: details == null ? "unknown" : details.placeofdeath,
          deathlatlng: details == null
              ? Deathlatlng(lat: -800.0, long: -800.0)
              : Deathlatlng(lat: -800.0, long: -800.0),
          bio: details == null ? ['dummy'] : details.bio,
          youtubelinks: details == null ? ['dummy'] : details.youtubelinks,
          textlinks: details == null ? ['dummy'] : details.textlinks);

      this.details = newdetails;
      return true;
    } else {
      print('Composerwithdart: setTempBirthLocation cannot get a geoloc');
      return false;
    }
  }
}

*/


class Details2 {
  //String category;
  String subcategory;
  String dateofbirth;
  String placeofbirth;
  Birthlatlng birthlatlng;
  String dateofdeath;
  String placeofdeath;
  Deathlatlng deathlatlng;
  List<String> bio;
  List<String> youtubelinks;
  List<String> textlinks;

  Details2(
      {

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

  Details2.fromJson(Map<String, dynamic> json) {
    //category = json['category'];
    subcategory = json['subcategory'];
    dateofbirth = json['dateofbirth'];
    placeofbirth = json['placeofbirth'];
    birthlatlng = json['birthlatlng'] != null
        ? new Birthlatlng.fromJson(json['birthlatlng'])
        : null;
    dateofdeath = json['dateofdeath'];
    placeofdeath = json['placeofdeath'];
    deathlatlng = json['deathlatlng'] != null
        ? new Deathlatlng.fromJson(json['deathlatlng'])
        : null;
    //bio = json['bio'].cast<List<String>>();
    //youtubelinks = json['youtubelinks'].cast<List<String>>();
    //textlinks = json['textlinks'].cast<List<String>>();

    if (json['bio'] != null) {
      bio = new List<String>();
      json['bio'].forEach((v) {
        bio.add(v);
      });
    }

    if (json['youtubelinks'] != null) {
      youtubelinks = new List<String>();
      json['youtubelinks'].forEach((v) {
        youtubelinks.add(v);
      });
    }

    if (json['textlinks'] != null) {
      textlinks = new List<String>();
      json['textlinks'].forEach((v) {
        textlinks.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['dateofbirth'] = this.dateofbirth;
    data['placeofbirth'] = this.placeofbirth;
    if (this.birthlatlng != null) {
      data['birthlatlng'] = this.birthlatlng.toJson();
    }
    data['dateofdeath'] = this.dateofdeath;
    data['placeofdeath'] = this.placeofdeath;
    if (this.deathlatlng != null) {
      data['deathlatlng'] = this.deathlatlng.toJson();
    }
    data['bio'] = this.bio;
    data['youtubelinks'] = this.youtubelinks;
    data['textlinks'] = this.textlinks;
    return data;
  }
}

class Birthlatlng {
  double lat;
  double long;

  Birthlatlng({this.lat, this.long});

  Birthlatlng.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Deathlatlng {
  double lat;
  double long;

  Deathlatlng({this.lat, this.long});

  Deathlatlng.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
