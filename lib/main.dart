import 'package:astrotak_demo/controllers/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AstrosTak Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,  
        scaffoldBackgroundColor: Colors.white,         
      ),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      initialRoute: AppRoutes.landingPage,
    );
  }
}
