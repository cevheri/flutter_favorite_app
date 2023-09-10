import 'package:flutter/material.dart';
import 'package:flutter_favorite_app/presentation/state/app_state.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Page'),
        ),
        body: Center(
          child: Text('No favorites yet'),
        ),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('You have ${appState.favorites.length} favorites'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asPascalCase),
            trailing: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                appState.removeFavorite(pair);
              },
            ),
          ),
      ],
    );
  }
}
