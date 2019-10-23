import 'package:composersbygeography/models/composerwithdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComposerDatabaseHelper {
  static Future<List<ComposerWithDart>> getComposersFromDatabase() async {
    const url = 'https://britishcomposers-6447e.firebaseio.com/composers.json';
    List<ComposerWithDart> _composers = [];
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      //final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final extractedData = json.decode(response.body) as List<dynamic>;

           // extractedData.forEach((id, composerData) {

      extractedData.forEach((composerData) {
        _composers.add(ComposerWithDart.fromJson(composerData));
      });
    } catch (error) {
      print('error in getting composers data');
      throw error;
    }
    return _composers;
  }
}
