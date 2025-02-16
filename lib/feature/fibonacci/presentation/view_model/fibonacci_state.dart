part of 'fibonacci_view_model.dart';

final class FibonacciState {
  final List<FibonacciModel> mainList;
  final Map<FibonacciType, List<FibonacciModel>> typeList;
  FibonacciModel? lastAddedItem;
  final Map<FibonacciType, FibonacciModel?> lastAddedItemByType;

  List<FibonacciModel> listByType(FibonacciType type) {
    return typeList[type] ?? [];
  }

  int? get hightlightIndex {
    return lastAddedItem != null ? mainList.indexWhere((element) => element == lastAddedItem) : null;
  }

  int? hightlightIndexByType(FibonacciType type) {
    return lastAddedItemByType[type] != null ? typeList[type]!.indexWhere((element) => element == lastAddedItemByType[type]) : null;
  }

  FibonacciState({
    required this.mainList,
    this.typeList = const {},
    this.lastAddedItem,
    this.lastAddedItemByType = const {},
  });

  factory FibonacciState.initial(int count) {
    final List<FibonacciModel> data = [];
    for (var i = 0; i < count; i++) {
      data.add(FibonacciModel(
        number: i,
        result: i < 2 ? i : data[i - 1].result + data[i - 2].result,
      ));
    }

    return FibonacciState(
      mainList: data,
      typeList: FibonacciType.values.fold<Map<FibonacciType, List<FibonacciModel>>>(
        {},
        (map, type) {
          return map..[type] = [];
        },
      ),
      lastAddedItem: null,
      lastAddedItemByType: FibonacciType.values.fold<Map<FibonacciType, FibonacciModel?>>(
        {},
        (map, type) {
          return map..[type] = null;
        },
      ),
    );
  }
}
