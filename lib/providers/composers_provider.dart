import 'package:composersbygeography/helpers/composerdatabase_helper.dart';
import 'package:flutter/material.dart';

import '../models/composerwithdart.dart';

class ComposersProvider extends ChangeNotifier {
  List<ComposerWithDart> _composers;

  List<ComposerWithDart> get composers {
    return [..._composers];
  }

  Future<void> fetchAndSetComposers() async {
    _composers = await ComposerDatabaseHelper.getComposersFromDatabase();
    notifyListeners();

  }


}