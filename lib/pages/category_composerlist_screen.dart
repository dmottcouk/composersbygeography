import 'package:composersbygeography/providers/composers_provider.dart';
import 'package:composersbygeography/widgets/composer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryComposerListScreen extends StatelessWidget {
  static const routeName = '/categorycomposerslistscreen';

  // final String categoryname;

  // CategoryComposerListScreen(this.categoryname);

  @override
  Widget build(BuildContext context) {
    final categoryname = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryname'),
      ),
      body: FutureBuilder(
          future:
              Provider.of<ComposersProvider>(context, listen: false).fetchAndSetComposersByCatFilter(categoryname),
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
                    itemCount: composersData.filteredcomposers.length,
                    itemBuilder: (ctx, i) => ComposerItem(composersData.filteredcomposers[i]),
                  ),
                );
              }
            }
          })
    );
  }
}
