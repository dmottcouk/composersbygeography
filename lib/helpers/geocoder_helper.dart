import 'package:geocoder/geocoder.dart';
import '../models/placelocation.dart';

class GeoCoderHelper {
  static Future<PlaceLocation> getlocationData(String place) async {
    print('Rever geocode string = $place');
    try {
      var addresses = await Geocoder.local.findAddressesFromQuery(place);
      var first = addresses.first;
      print('${first.featureName}, ${first.coordinates} ');
      return (new PlaceLocation(
          latitude: first.coordinates.latitude,
          longitude: first.coordinates.longitude,
          address: first.addressLine + ',' + first.adminArea));
    } catch (err) {
      print(err.toString());
      return (new PlaceLocation(
          latitude: -800.0, longitude: -800.0, address: 'Not found'));
    }
  }
}
