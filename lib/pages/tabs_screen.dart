import 'package:flutter/material.dart';
import '../pages/composerslist_screen.dart';

import '../widgets/categorieswidget.dart';
import '../widgets/mapscreenwidget.dart';
import '../helpers/overflowoptions.dart';
import './enter_composer_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesWidget(), 'title': 'Categories'},
      {'page': MapScreenWidget(), 'title': 'Map'}
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Composers by Geography - ${_pages[_selectedPageIndex]["title"]}'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.insert_chart),
              onPressed: () {
                Navigator.of(context).pushNamed(ComposersListScreen.routeName);
              },
            ),
            PopupMenuButton(
              onSelected: (value) {
              if (value == OverflowOptions.enterdata) {
                Navigator.of(context).pushNamed(EnterComposerScreen.routeName);
              } else {
                Navigator.of(context).pushNamed(ComposersListScreen.routeName);
              }
            }, 
            itemBuilder: (BuildContext ctx) {
              return OverflowOptions.options
                  .map(
                    (settingoption) => PopupMenuItem(
                      value: settingoption,
                      child: Text(settingoption),
                    ),
                  )
                  .toList();
            }),
          ]),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        currentIndex: _selectedPageIndex,
        // can also set selectedfontsize and unselectedfontsize
        ////type:BottomNavigationBarType.shifting,
        // items are the tabs
        items: [
          BottomNavigationBarItem(
            ////backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            ////backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
        ],
      ),
    );
  }
}
