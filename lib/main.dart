
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/composers_provider.dart';
import './providers/composer_provider.dart';
import './pages/tabs_screen.dart';
import './pages/categories_description_screen.dart';
import './pages/composerslist_screen.dart';
import './pages/enter_composer_screen.dart';
import './pages/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ComposerProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ComposersProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.green, accentColor: Colors.purple),
          home: TabsScreen(),
          routes: {
            CategoriesDescriptionScreen.routeName: (ctx) =>
                CategoriesDescriptionScreen(),
            ComposersListScreen.routeName: (ctx) => ComposersListScreen(),
            EnterComposerScreen.routeName: (ctx) => EnterComposerScreen(),
            MapScreen.routeName: (ctx) => MapScreen()
          }),
    );
  }
}
