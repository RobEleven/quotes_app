import 'package:flutter/material.dart';

import 'package:quotesapp/components/quotes_list.dart';
import 'package:quotesapp/constants.dart';

class ValuesScreen extends StatefulWidget {
  @override
  _ValuesScreenState createState() => _ValuesScreenState();
}

class _ValuesScreenState extends State<ValuesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Popular Quotes:',
              style: appBarTitleStyle,
            ),
            backgroundColor: Colors.indigoAccent.shade100,
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              color: Colors.indigoAccent.shade100,
              height: 70,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: ValuesList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
