import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:quotesapp/components/popular_quotes.dart';
import 'package:quotesapp/constants.dart';
import 'package:quotesapp/screens/add_quote_screen.dart';
import 'package:quotesapp/screens/favourites_screen.dart';
import 'package:quotesapp/screens/quotes_screen.dart';

import 'package:animated_size_and_fade/animated_size_and_fade.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Timer timer;
  int valueFromValues = 0;

  bool toggle;
  bool valueVisible = false;

  List<String> favouriteValues = [];

  @override
  void initState() {
    super.initState();
    toggle = false;

    Timer(Duration(milliseconds: 300), () {
      valueVisible = true;
      toggle = !toggle;
    });

    Timer.periodic(Duration(milliseconds: 5000), (timer) {
      setState(() {
        Random random = new Random();
        toggle = !toggle;
        valueFromValues = random.nextInt(PopularQuotes().listLength());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    PopularQuotes displayedValue = PopularQuotes();
    String popularValue = displayedValue.generateQuote();

    var widget1 = Container(
      key: ValueKey("first"),
      child: Visibility(
        visible: valueVisible,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Text(
              "$popularValue",
              textAlign: TextAlign.center,
              style: generatedValueStyle,
            ),
          ),
        ),
      ),
    );

    var widget2 = Container(
      key: ValueKey("second"),
      child: Visibility(
        visible: valueVisible,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Text(
              "$popularValue",
              textAlign: TextAlign.center,
              style: generatedValueStyle,
            ),
          ),
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        // accentColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // accentColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      title: 'Quotes Generator',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Quotes Generator ',
                style: appBarTitleStyle,
              ),
            ),
            backgroundColor: Colors.indigoAccent.shade100,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSizeAndFade(
                // vsync: this,
                child: toggle ? widget1 : widget2,
                fadeDuration: const Duration(milliseconds: 1200),
                sizeDuration: const Duration(milliseconds: 300),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 35,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddQuoteScreen(),
                        ),
                      ));
            },
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 11,
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: Colors.indigoAccent.shade100,
              height: 70,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ValuesScreen();
                                  },
                                ),
                              );
                            });
                          },
                          minWidth: 30,
                          child: Icon(
                            Icons.format_quote_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          'Quotes',
                          style: textIconStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return FavouritesScreen(
                                      favouriteValues, popularValue);
                                },
                              ));
                            });
                          },
                          minWidth: 30,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          'Save it',
                          style: textIconStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
