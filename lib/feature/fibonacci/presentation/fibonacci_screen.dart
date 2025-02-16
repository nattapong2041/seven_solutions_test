import 'package:flutter/material.dart';
import 'view_model/fibonacci_view_model.dart';
import '../../../core/extension/scroll_controller_extension.dart';

import '../model/fibonacci_model.dart';
import 'widget/fibonacci_item_widget.dart';

part 'widget/_fibonacci_bottomsheet.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  final FibonacciViewModel _viewModel = FibonacciViewModel();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fibonacci'),
      ),
      body: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, child) {
            return ListView.builder(
              controller: _controller,
              itemBuilder: (context, index) {
                final item = _viewModel.state.mainList[index];
                bool isHightlighted = _viewModel.state.hightlightIndex == index;
                return FibonacciItemWidget(
                  data: item,
                  isHightlighted: isHightlighted,
                  onTap: () {
                    _viewModel.onPressedItemMainList(item);
                    showModalBottomSheet<bool>(
                      context: context,
                      enableDrag: true,
                      showDragHandle: true,
                      builder: (context) {
                        return _FibonacciBottomsheet(
                          data: _viewModel.state.listByType(item.type),
                          highlightIndex: _viewModel.state.hightlightIndexByType(item.type),
                          onTap: (selectedItem) {
                            _viewModel.onPressedItemBottomSheet(selectedItem);
                            Navigator.pop(context, true);
                          },
                        );
                      },
                    ).then((value) {
                      if(value != true) return;
                      if (_viewModel.state.hightlightIndex == null) return;
                      _controller.scrollToIndex(
                          _viewModel.state.hightlightIndex!, FibonacciItemWidget.height);
                    });
                  },
                );
              },
              itemCount: _viewModel.state.mainList.length,
            );
          }),
    );
  }
}
