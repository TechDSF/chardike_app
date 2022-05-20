import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/route.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chardike App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleSpacing: 0,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          centerTitle: true, systemOverlayStyle: SystemUiOverlayStyle.light
        )
      ),
      routes: routes,
      initialRoute: MainScreen.routeName,
    );
  }
}
