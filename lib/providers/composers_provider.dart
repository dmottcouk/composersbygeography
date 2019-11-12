import 'package:composersbygeography/helpers/composerdatabase_helper.dart';
import 'package:flutter/material.dart';

import '../models/composercatwithdart.dart';

class ComposersProvider extends ChangeNotifier {
  List<ComposerCatWithDart> _composers;
  List<ComposerCatWithDart> _filteredcomposers;
  String _currentcatFilter;

  List<ComposerCatWithDart> get composers {
    return [..._composers];
  }

  List<ComposerCatWithDart> get filteredcomposers {
    return [..._filteredcomposers];
  }

  Future<void> fetchAndSetComposers() async {
    _composers = await ComposerDatabaseHelper.getComposersFromDatabase();
    notifyListeners();
  }

  Future<void> fetchAndSetComposersByCatFilter(String cat) async {
    _currentcatFilter = cat;
    _filteredcomposers =
        await ComposerDatabaseHelper.getFilteredComposersFromDatabase(cat);
    notifyListeners();
  }
}
