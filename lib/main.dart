import 'package:astrotak_demo/controllers/providers/question_list_provider.dart';
import 'package:astrotak_demo/controllers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AstrotakProvider>(create: (_) => AstrotakProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AstrosTak Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.blue,  
        scaffoldBackgroundColor: const Color(0xfffafafa),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
        ),
                   
      ),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      initialRoute: AppRoutes.landingPage,
    );
  }
}
