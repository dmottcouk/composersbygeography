import 'package:flutter/material.dart';

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
        },
        child: GridTile(
          child: Image.asset(
            'assets/images/$assetimage',
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              categorytitle,
              style: screenwidth > 600 ? TextStyle(fontSize: 24) : TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
