import 'package:flutter/material.dart';
import 'package:shared_preference/box_widget.dart';

class BoxesWidget extends StatelessWidget {
  const BoxesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++) BoxWidget(index: i),
          ],
        ),
      ),
    );
  }
}
