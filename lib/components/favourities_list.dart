import 'package:flutter/cupertino.dart';
import 'package:quotesapp/components/quote.dart';

class ListOfFavourites extends ChangeNotifier {
  List<Quote> favouriteQuotes = [];

  void addQuote(String newFavourite) {
    final userFavourite = Quote(statement: newFavourite);
    favouriteQuotes.add(userFavourite);
    notifyListeners();
  }

  int get quoteCount {
    return favouriteQuotes.length;
  }
}
