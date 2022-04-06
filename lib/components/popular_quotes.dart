import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:randomizer/randomizer.dart';

import 'package:quotesapp/components/quote.dart';

class PopularQuotes extends ChangeNotifier {
  List<Quote> quotes = [
    Quote(
        statement:
            "\"Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking.\" \n Steve Jobs"),
    Quote(
        statement:
            "\"If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.\"\n James Cameron"),
    Quote(
        statement:
            "\"It is during our darkest moments that we must focus to see the light.\" \n Aristotle"),
    Quote(
        statement:
            "\"The greatest glory in living lies not in never falling, but in rising every time we fall.\" \n Nelson Mandela"),
    Quote(
        statement:
            "\"In the end, it's not the years in your life that count. It's the life in your years.\" \n Abraham Lincoln"),
    Quote(
        statement:
            "\"Many of life's failures are people who did not realize how close they were to success when they gave up.\" \n Thomas A. Edison"),
    Quote(
        statement:
            "\"I think it is possible for ordinary people to choose to be extraordinary.\" \n Elon Musk"),
    Quote(
        statement:
            "\"Only a life lived for others is a life worthwhile.\" \n Albert Einstein"),
    Quote(
        statement:
            "\"Life is really simple, but we insist on making it complicated.\" \n Confucius"),
    Quote(
        statement:
            "\"Never was so much owed by so many to so few.\" \n Winston Churchill"),
    Quote(
        statement:
            "\"The purpose of our lives is to be happy.\" \n Dalai Lama"),
    Quote(
        statement:
            "\"Two possibilities exist: either we are alone in the Universe or we are not. Both are equally terrifying.\" \n Arthur C. Clarke"),
    Quote(
        statement:
            "\"The secret of success is to do the common thing uncommonly well.\" \n John D. Rockefeller Jr."),
    Quote(
        statement:
            "\"The way to get started is to quit talking and begin doing.\" \n Walt Disney"),
    Quote(
        statement:
            "\"I alone cannot change the world, but I can cast a stone across the water to create many ripples.\" \n Mother Teresa"),
    Quote(
        statement:
            "\"Nothing is impossible, the word itself says, \"I'm possible!\"\" \n Audrey Hepburn"),
    Quote(
        statement:
            "\"Believe you can and you're halfway there.\" \n Theodore Roosevelt"),
  ];

  void addValue(String newUserQuote) {
    final userValue = Quote(statement: newUserQuote);
    quotes.add(userValue);
    notifyListeners();
  }

  String generateQuote() {
    Random random = new Random();
    int randomNumber = random.nextInt(quotes.length);
    return quotes[randomNumber].toString();
  }

  UnmodifiableListView<Quote> get ourQuotes {
    return UnmodifiableListView(quotes);
  }

  int get quoteCount {
    return quotes.length;
  }

  int listLength() {
    return quotes.length;
  }

  Randomizer randomizer = Randomizer();
}
