import 'package:bhagwat_geeta_app/provider/bhagwatgeetaProvider.dart';
import 'package:bhagwat_geeta_app/views/SplashScreen/splashScreen.dart';
import 'package:bhagwat_geeta_app/views/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => BhagwatGeetaProvider(),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
       // '/':(context)=>Splashscreen(),
        '/':(context)=>Homescreen(),
      },
    ),);
  }
}
