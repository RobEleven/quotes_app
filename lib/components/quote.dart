class Quote {
  final String statement;

  Quote({this.statement});

  @override
  String toString() => statement;

  add() => add().toString();
}
