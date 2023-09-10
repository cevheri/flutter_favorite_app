import 'package:flutter/material.dart';
import 'package:flutter_favorite_app/presentation/screen/home_page.dart';
import 'package:flutter_favorite_app/presentation/state/home_page_state.dart';
import 'package:flutter_favorite_app/routes/page_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        //home: MyHomePage(),
        routes: routes,
      ),
    );
  }
}
