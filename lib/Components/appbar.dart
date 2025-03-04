import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBars {
  AppBar NoteEditorBar({required VoidCallback toggleTheme}) {
    return AppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            GestureDetector(
              onTap: toggleTheme,
              child: SvgPicture.asset(
                'assets/Placeholder.svg',
                width: 30,
                height: 30,
              ),
            ),
            GestureDetector(
              child: SvgPicture.asset(
                'assets/Heart Outlined.svg',
                width: 30,
                height: 30,
              ),
            ),
            GestureDetector(
              child: SvgPicture.asset(
                'assets/Send.svg',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar MenuBar() {
    return AppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    "assets/Sort.svg",
                    width: 36,
                    height: 36,
                  ),
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    "assets/Hamburger Menu.svg",
                    width: 36,
                    height: 36,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
