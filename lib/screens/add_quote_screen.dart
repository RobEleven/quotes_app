// import 'dart:html';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quotesapp/components/popular_quotes.dart';

class AddQuoteScreen extends StatefulWidget {
  @override
  _AddQuoteScreenState createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  @override
  Widget build(BuildContext context) {
    String userNewQuote;
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), topLeft: Radius.circular(60)),
          color: Colors.indigoAccent.shade100,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "Add Your own quote:",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 350,
              height: 80,
              child: TextField(
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Your quote",
                  hintStyle: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (addText) {
                  userNewQuote = addText;
                },
              ),
            ),
            TextButton(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]),
                width: 90,
                height: 30,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                Provider.of<PopularQuotes>(context, listen: false)
                    .addValue(userNewQuote);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
