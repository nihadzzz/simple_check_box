import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoxWidget extends StatefulWidget {
  const BoxWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<BoxWidget> createState() => _SingleBoxState();
}

class _SingleBoxState extends State<BoxWidget> {
  bool isSelected = false;
  late final String boxKey;

  @override
  void initState() {
    boxKey = 'box${widget.index}';
    getSavedColor();
    super.initState();
  }

  void getSavedColor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isSelected = sharedPreferences.getBool(boxKey) ?? false;
    log('Saved Data ${widget.index}: $isSelected');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          isSelected = !isSelected;
          await sharedPreferences.setBool(boxKey, isSelected);
          setState(() {});
        },
        child: SizedBox(
          height: 50,
          width: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
