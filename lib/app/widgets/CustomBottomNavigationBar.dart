import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:webapp_amrm/data/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 87,
      child: BottomNavigationBar(
        fixedColor: ConstantColors.primaryColor,
        unselectedItemColor: ConstantColors.primaryColor,
        showUnselectedLabels: true,
        // iconSize: 16,
        // unselectedFontSize: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Elusive.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Elusive.clock),
            label: "Historial",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.book_open),
            label: "Guia de uso",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.user_alt),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
