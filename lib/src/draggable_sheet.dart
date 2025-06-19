import 'package:flutter/material.dart';

/// A draggable sheet that can be used to show any widget
/// with a title and a drag handler.
///
class DraggableSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hideDragHandler;
  final bool hideTitle;
  DraggableSheet({
    super.key,
    this.title = 'Scan any QR code',
    this.child = const SizedBox.shrink(),
    this.hideDragHandler = false,
    this.hideTitle = false,
  });
  final _controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.4,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            ...[
              if (!hideDragHandler)
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).dividerColor, borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const SizedBox(width: 40, height: 5),
                ),
              if (!hideTitle) ...[
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ],
            Expanded(child: child),
          ],
        );
      },
    );
  }
}
