part of '../fibonacci_screen.dart';

class _FibonacciBottomsheet extends StatefulWidget {
  const _FibonacciBottomsheet(
      {required this.data, required this.highlightIndex, this.onTap});

  final List<FibonacciModel> data;
  final int? highlightIndex;
  final ValueChanged<FibonacciModel>? onTap;

  @override
  State<_FibonacciBottomsheet> createState() => _FibonacciBottomsheetState();
}

class _FibonacciBottomsheetState extends State<_FibonacciBottomsheet> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.data.isNotEmpty && widget.highlightIndex != null && _controller.hasClients) {
        _controller.scrollToIndex(widget.highlightIndex!, FibonacciItemWidget.height);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return FibonacciItemWidget(
          data: widget.data[index],
          onTap: () => widget.onTap?.call(widget.data[index]),
          isHightlighted: widget.highlightIndex == index,
        );
      },
    );
  }
}
