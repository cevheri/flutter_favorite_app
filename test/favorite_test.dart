
import 'package:english_words/english_words.dart';
import 'package:flutter_favorite_app/presentation/state/app_state.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  test("An item should be added to the list", () {
    var appState = MyAppState();
    expect(appState.favorites.length, 0);
    var pair = WordPair.random();
    appState.toggleFavorite(pair);
    expect(appState.favorites.length, 1);
    expect(appState.favorites.first, pair);
  });

  test("An item should be removed from the list", () {
    var appState = MyAppState();
    expect(appState.favorites.length, 0);
    var pair = WordPair.random();
    appState.toggleFavorite(pair);
    expect(appState.favorites.length, 1);
    expect(appState.favorites.first, pair);
    appState.removeFavorite(pair);
    expect(appState.favorites.length, 0);
  });

}
