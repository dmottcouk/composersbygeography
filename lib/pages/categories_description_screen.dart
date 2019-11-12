import 'package:flutter/material.dart';

import '../helpers/categoriesdescriptions.dart';
import './category_composerlist_screen.dart';

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
            expandedHeight: 380,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      //color: Colors.green,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.list),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                             CategoryComposerListScreen.routeName,
                            arguments: category,
                          );



                        },
                      ),
                    ),
                    Text(
                      CategoriesDescriptions.getCategoryDescription(category)
                          .join('\n'),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
