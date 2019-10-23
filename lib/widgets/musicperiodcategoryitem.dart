
import 'package:flutter/material.dart';
import '../pages/categories_description_screen.dart';


class MusicPeriodCategoryItem extends StatelessWidget {
  final String categorytitle;
  final String assetimage;

  MusicPeriodCategoryItem(this.categorytitle, this.assetimage);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          //Navigator.of(context).push(
          //  MaterialPageRoute(
          //   builder: (ctx) => ProductDetailScreen(title),
          // ),
          //);
          Navigator.of(context).pushNamed(
            CategoriesDescriptionScreen.routeName,
            arguments: categorytitle,
          );
        },
        child: GridTile(
          child: Hero(
            tag: categorytitle,
            child: Image.asset(
              'assets/images/$assetimage',
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
           // leading: IconButton(icon: Icon(Icons.info), onPressed: () {}),
            title: Text(
              categorytitle,
              style: screenwidth > 600
                  ? TextStyle(fontSize: 24)
                  : TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
