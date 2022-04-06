import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quotesapp/components/quote_tile.dart';
import 'package:quotesapp/components/popular_quotes.dart';

class ValuesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PopularQuotes>(
      builder: (context, quoteInfo, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final quoteToTaskTile = quoteInfo.ourQuotes[index];
            return TaskTile(
              valueName: quoteToTaskTile.statement,
            );
          },
          itemCount: quoteInfo.quoteCount,
        );
      },
    );
  }
}
