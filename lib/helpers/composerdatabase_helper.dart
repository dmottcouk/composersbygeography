import 'package:http/http.dart' as http;
import 'dart:convert';

//import '../models/composerwithdart.dart';
import '../models/composercatwithdart.dart';

class ComposerDatabaseHelper {
  static Future<List<ComposerCatWithDart>> getComposersFromDatabase() async {
    const url = 'https://britishcomposers-6447e.firebaseio.com/composers.json';
    List<ComposerCatWithDart> _composers = [];
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      //final extractedData = json.decode(response.body) as List<dynamic>;

      // extractedData.forEach((id, composerData) {

      //extractedData.forEach((composerData) {
      //  _composers.add(ComposerCatWithDart.fromJson(composerData));
      // });
      extractedData.forEach((compid, composerData) {
        _composers.add(ComposerCatWithDart.fromJson(composerData));
      });
    } catch (error) {
      print('error in getting composers data');
      throw error;
    }
    return _composers;
  }


static Future<List<ComposerCatWithDart>> getFilteredComposersFromDatabase(String cat) async {
    final url = 'https://britishcomposers-6447e.firebaseio.com/composers.json?orderBy="cat"&equalTo="$cat"';
    List<ComposerCatWithDart> _composers = [];
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      //final extractedData = json.decode(response.body) as List<dynamic>;

      // extractedData.forEach((id, composerData) {

      //extractedData.forEach((composerData) {
      //  _composers.add(ComposerCatWithDart.fromJson(composerData));
      // });
      extractedData.forEach((compid, composerData) {
        _composers.add(ComposerCatWithDart.fromJson(composerData));
      });
    } catch (error) {
      print('error in getting filtered composers data');
      throw error;
    }
    return _composers;
  }





  
}
