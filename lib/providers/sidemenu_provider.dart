import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isMenuOpen = false;

  String _currentPage = '';
  String get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    Future.delayed(Duration(milliseconds: 100), () {
      //detener
      notifyListeners();
    });
  }

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(CurvedAnimation(
          parent: menuController, curve: Curves.easeInOut)); // mostrar y salir
  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: menuController, curve: Curves.easeInOut)); // mostrar y salir

  static void openMenu() {
    isMenuOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isMenuOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isMenuOpen) ? menuController.reverse() : menuController.forward();

    isMenuOpen = !isMenuOpen;
  }
}
