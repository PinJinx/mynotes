import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class navbars
{
  BottomNavigationBar MenuBar() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: SvgPicture.asset('assets/Create.svg'),label: "Create"),
      BottomNavigationBarItem(icon: SvgPicture.asset('assets/Categories.svg'),label: "Create"),
      BottomNavigationBarItem(icon: SvgPicture.asset('assets/todo.svg'),label: "Todo"),
      BottomNavigationBarItem(icon: SvgPicture.asset('assets/Check.svg'),label: "Project")
    ]);
  }
}