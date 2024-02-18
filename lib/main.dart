import 'package:ecommerce/ui/route_navigation.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architecture MVVM Provider',
      initialRoute: RouteNavigation.signUp,
      onGenerateRoute: RouteNavigation.generateRoute,
    );
  }
}
