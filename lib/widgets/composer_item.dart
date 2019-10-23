import 'package:flutter/material.dart';
import '../models/composerwithdart.dart';

class ComposerItem extends StatelessWidget {
  final ComposerWithDart composer;

  ComposerItem(this.composer);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${composer.firstnames} ${composer.surname}'),
    );
  }
}
