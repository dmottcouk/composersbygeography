


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/composerwithdart.dart';
import '../providers/composers_provider.dart';
import '../widgets/composer_item.dart';

class ComposersListScreen extends StatelessWidget {

  static const routeName = '/composersscreen';

 

  ComposersListScreen();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Composers'),
      ),
      body: FutureBuilder(
          future:
              Provider.of<ComposersProvider>(context, listen: false).fetchAndSetComposers(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
// do error
                return Center(
                  child: Text('An error occurred!'),
                );
              } else {
                return Consumer<ComposersProvider>(
                  builder: (ctx, composersData, child) => ListView.builder(
                    itemCount: composersData.composers.length,
                    itemBuilder: (ctx, i) => ComposerItem(composersData.composers[i]),
                  ),
                );
              }
            }
          })

    );
  }
}