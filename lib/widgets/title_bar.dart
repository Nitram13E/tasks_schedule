import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatefulWidget {
  final String title;
  const TitleBar({super.key, required this.title});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return DragToMoveArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(widget.title),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: windowManager.minimize,
                icon: const Icon(Icons.minimize, size: 20),
              ),
              IconButton(
                onPressed: () => windowManager.isMaximized().then(
                      (isMaximized) => isMaximized ? windowManager.restore() : windowManager.maximize(),
                    ),
                icon: const Icon(Icons.picture_in_picture, size: 20),
              ),
              IconButton(
                onPressed: windowManager.close,
                icon: const Icon(Icons.close, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
