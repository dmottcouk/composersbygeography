import 'package:flutter/material.dart';

import './musicperiodcategoryitem.dart';

class CategoriesWidget extends StatelessWidget {
  static const List<Map<String, String>> cats = [
    {'cat':'Medieval', 'pic':"medieval.jpg"},
    {'cat':'Renaissance',  'pic':"renaissance.jpg"},
    {'cat':'Baroque',  'pic':"baroque.jpg"},
    {'cat':'Classical',  'pic':"classical.jpg"},
    {'cat':'Romantic', 'pic': "romantic.jpg"},
    {'cat':'Contemporary', 'pic': "contemporary.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    final devicewidth = MediaQuery.of(context).size.width;
    final deviceheight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        margin: EdgeInsets.all(20.0),
        width: devicewidth * 7 / 8,
        height: deviceheight * 7 / 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(203, 233, 172, 30),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black26,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: cats.length,
          // we need multiple providers - one for each product.Always use .value in this situation
          itemBuilder: (ctx, i) =>
              MusicPeriodCategoryItem(cats[i]['cat'], cats[i]['pic']),
          // squeeze the columns to get this amount of columns
          // children are a bit taller than they are wide = 3/2
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2, // first number is width
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
