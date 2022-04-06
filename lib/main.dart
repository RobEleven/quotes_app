import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/components/popular_quotes.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PopularQuotes(),
      child: MaterialApp(
        home: AppSplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
