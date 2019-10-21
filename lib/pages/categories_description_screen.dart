import 'package:flutter/material.dart';

import '../helpers/categoriesdescriptions.dart';

class CategoriesDescriptionScreen extends StatelessWidget {
  static const routeName = '/categorydescription';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      //appBar: AppBar(
      //  title: Text(loadedProduct.title),
      //),
      // for sliver replace the SingleChildScrollView with a CustomScrollView and remove the appBar

      body: CustomScrollView(
        // slivers are scrollable areas on the screen
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(category),
              background: Hero(
                tag: category,
                child: Image.asset(
                  'assets/images/${category.toLowerCase()}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  CategoriesDescriptions.getCategoryDescription(category)
                      .join('.'),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
