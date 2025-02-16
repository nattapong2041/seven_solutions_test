import 'package:flutter/material.dart';

extension ScrollToIndex on ScrollController {
  void scrollToIndex(
    int index, 
    double itemSize, {
    Duration duration = const Duration(milliseconds: 300), 
    Curve curve = Curves.easeInOut,
  }) {
    if (!hasClients) return;
    
    double targetOffset = index * itemSize;
    
    // Clamp the target offset to valid scroll bounds
    targetOffset = targetOffset.clamp(
      position.minScrollExtent,
      position.maxScrollExtent
    );
        
    animateTo(
      targetOffset,
      duration: duration,
      curve: curve,
    );
  }
}