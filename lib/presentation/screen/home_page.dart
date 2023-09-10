import 'package:flutter/material.dart';
import 'package:flutter_favorite_app/presentation/screen/favorite_page.dart';
import 'package:flutter_favorite_app/presentation/screen/generator_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritePage();
        break;
      default:
        throw UnimplementedError('No page for index $selectedIndex');
    }

    // The container for the current page,
    // with its background color and
    // subtle switching animation
    var mainArea = ColoredBox(
        color: colorScheme.surfaceVariant,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: page,
        ));

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return _mobileNavigation(mainArea);
          } else {
            return _webNavigation(constraints, context, page);
          }
        },
      ),
    );
  }

  // Web or desktop navigation with a navigation rail
  Row _webNavigation(
      BoxConstraints constraints, BuildContext context, Widget page) {
    return Row(
      children: [
        SafeArea(
          child: NavigationRail(
            selectedIndex: selectedIndex,
            extended: constraints.maxWidth > 600,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
            ],
            onDestinationSelected: (value) => {
              setState(() {
                selectedIndex = value;
              })
            },
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ),
        ),
      ],
    );
  }

  // Mobile navigation with a bottom navigation bar
  Column _mobileNavigation(ColoredBox mainArea) {
    return Column(
      children: [
        Expanded(
          child: mainArea,
        ),
        SafeArea(
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: (value) => {
              setState(() {
                selectedIndex = value;
              })
            },
          ),
        ),
      ],
    );
  }
}
