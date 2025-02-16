import 'package:flutter/material.dart';

enum FibonacciType {
  circle,
  cross,
  square;

  IconData get icon {
    return switch (this) {
      circle => Icons.circle_outlined,
      cross => Icons.close,
      square => Icons.square_outlined,
    };
  }
}

class FibonacciModel {
  final int number;
  final int result;

  FibonacciType get type {
    if (result % 3 == 0) {
      return FibonacciType.circle;
    }
    if (result % 2 == 0) {
      return FibonacciType.cross;
    }
    return FibonacciType.square;
  }

  const FibonacciModel({
    required this.number,
    required this.result,
  });
}
