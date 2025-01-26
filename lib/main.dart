import 'package:bhagwat_geeta_app/provider/bhagwatgeetaProvider.dart';
import 'package:bhagwat_geeta_app/utils/theme.dart';
import 'package:bhagwat_geeta_app/views/SplashScreen/splashScreen.dart';
import 'package:bhagwat_geeta_app/views/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BhagwatGeetaProvider provider=BhagwatGeetaProvider();
  await provider.fetchSaveData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BhagwatGeetaProvider()..fetchSaveData(),
      child: Consumer<BhagwatGeetaProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: value.isDark ? ThemeMode.light : ThemeMode.dark,
            routes: {
              '/':(context)=>Splashscreen(),
              '/home': (context) => Homescreen(),
            },
          );
        },
      ),
    );
  }
}
