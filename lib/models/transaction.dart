import 'package:flutter/foundation.dart';

class Transaction {
  final id;
  final title;
  double amount;
  final date;

  Transaction({
    @required this.id,
    @required this.title,
    this.amount = 0.0,
    @required this.date,
  });
}
