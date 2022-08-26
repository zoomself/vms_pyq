import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier{
  int _count = 0;

  CounterProvider(this._count);
  void add() {
    _count++;
    notifyListeners();
  }
  get count => _count;
}
