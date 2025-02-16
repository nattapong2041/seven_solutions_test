import 'package:flutter/material.dart';

import '../../model/fibonacci_model.dart';

part 'fibonacci_state.dart';

class FibonacciViewModel extends ChangeNotifier {
  final FibonacciState state = FibonacciState.initial(10000);

  void add(FibonacciModel model) {
    state.mainList.add(model);
    state.mainList.sort((a, b) => a.number.compareTo(b.number));
    state.lastAddedItem = model;
    notifyListeners();
  }

  void remove(FibonacciModel model) {
    state.mainList.remove(model);
    notifyListeners();
  }

  void addToType(FibonacciModel model) {
    final type = model.type;
    state.typeList[type]?.add(model);
    state.typeList[type]?.sort((a, b) => a.number.compareTo(b.number));
    state.lastAddedItemByType[type] = model;
    notifyListeners();
  }

  void removeFromType(FibonacciModel model) {
    final type = model.type;
    state.typeList[type]?.remove(model);
    notifyListeners();
  }

  void onPressedItemMainList(FibonacciModel model) {
    addToType(model);
    remove(model);
  }

  void onPressedItemBottomSheet(FibonacciModel model) {
    removeFromType(model);
    add(model);
  }

}