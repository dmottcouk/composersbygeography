import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/composers_provider.dart';
import './pages/tabs_screen.dart';
import './pages/categories_description_screen.dart';
import './pages/composerslist_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ComposersProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.green, accentColor: Colors.purple),
          home: TabsScreen(),
          routes: {
            CategoriesDescriptionScreen.routeName: (ctx) =>
                CategoriesDescriptionScreen(),
            ComposersListScreen.routeName: (ctx) => ComposersListScreen()
          }),
    );
  }
}
