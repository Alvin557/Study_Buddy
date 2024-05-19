import 'package:flutter/material.dart';

import 'bottom_sheet_provider.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem(this.text, this.icon, this.index, this.provider,
      {super.key});
  final int index;
  final BottomsheetProvider provider;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Center(
            child: ImageIcon(AssetImage(icon),
                size: 22,
                color: index == provider.selectedIndex
                    ? const Color(0xff2EC4B6)
                    : const Color(0xffCBF3F0)),
          ),
          onPressed: () {
            provider.changeIndex(index);
          },
        ),
        Text(
          text,
          style: TextStyle(
              color: index == provider.selectedIndex
                  ? const Color(0xff2EC4B6)
                  : const Color(0xffCBF3F0)),
        )
      ],
    );
  }
}
