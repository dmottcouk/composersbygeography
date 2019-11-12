import 'package:flutter/material.dart';
import '../models/composercatwithdart.dart';

//import '../models/composerwithdart.dart';

class ComposerItem extends StatelessWidget {
  final ComposerCatWithDart composer;

  ComposerItem(this.composer);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${composer.firstnames} ${composer.surname}'),
    );
  }
}
