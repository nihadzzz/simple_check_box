import 'package:flutter/material.dart';

import '../../data/models/nav_bar_model.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int selectedItem = 0;

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 300,
        height: 60,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      selectedItem = i;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Icon(
                          NavBarModel.navBarDatas[i].icon,
                          color:
                              selectedItem == i ? Colors.amber : Colors.black,
                        ),
                        Text(
                          NavBarModel.navBarDatas[i].iconTitle,
                          style: TextStyle(
                            color:
                                selectedItem == i ? Colors.amber : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
