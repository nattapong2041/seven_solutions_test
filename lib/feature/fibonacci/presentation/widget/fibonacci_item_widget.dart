
import 'package:flutter/material.dart';

import '../../model/fibonacci_model.dart';

class FibonacciItemWidget extends StatelessWidget {
  final FibonacciModel data;
  final VoidCallback? onTap;
  final bool isHightlighted;

  const FibonacciItemWidget({
    super.key,
    required this.data,
    this.onTap,
    this.isHightlighted = false,
  });

  static const height = 64.0;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        color: isHightlighted ? Colors.green : null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text('Fibonacci ${data.number}, Result: ${data.result}'),
            const Spacer(),
            Icon(data.type.icon),
          ],),
        )
        
      ),
    );
  }
}