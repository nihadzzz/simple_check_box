import 'package:check_box/enum_box.dart';
import 'package:flutter/material.dart';

class CheckBoxesAndTexts extends StatefulWidget {
  const CheckBoxesAndTexts({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<CheckBoxesAndTexts> createState() => _CheckBoxAndTextState();
}

class _CheckBoxAndTextState extends State<CheckBoxesAndTexts> {
  IconData? icon;
  Enum enumBox = EnumBox.notSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: GestureDetector(
              onTap: () {
                if (enumBox == EnumBox.selected) {
                  enumBox = EnumBox.notSelected;
                  setState(() {});
                } else {
                  enumBox = EnumBox.selected;
                  icon = Icons.check;
                  setState(() {});
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                height: 35,
                width: 35,
                child: Icon(
                  icon = enumBox == EnumBox.selected ? icon : null,
                ),
              ),
            ),
          ),
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
