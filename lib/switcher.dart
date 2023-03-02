import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/pages/exercise.dart';
import 'package:wellbeing_tracker/pages/food.dart';
import 'package:wellbeing_tracker/pages/habits.dart';
import 'package:wellbeing_tracker/pages/home.dart';
import 'package:wellbeing_tracker/pages/settings.dart';
import 'package:wellbeing_tracker/provider.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  final PageController _pageController = PageController();
  int _index = 0;

  void switchToPage(int index) {
    setState(() {
      _index = index;
    });
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) => setState(() {
              _index = index;
            }),
            children: const [
              Home(),
              Exercise(),
              Food(),
              Habits(),
              Settings(),
            ],
          ),
          if(context.watch<BackEnd>().popup != null)
            Container(color: Colors.black.withOpacity(0.5)),
          if(context.watch<BackEnd>().popup != null)
            context.read<BackEnd>().popup!,
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        isFloating: true,
        borderRadius: const Radius.circular(16),
        backgroundColor: Constants().primaryColor,
        unSelectedColor: Colors.white,
        selectedColor: Constants().accentColor,
        strokeColor: Colors.transparent,
        currentIndex: _index,
        onTap: (index) => switchToPage(index),
        items: [
          CustomNavigationBarItem(icon: const FaIcon(FontAwesomeIcons.house)),
          CustomNavigationBarItem(icon: const FaIcon(FontAwesomeIcons.dumbbell)),
          CustomNavigationBarItem(icon: const FaIcon(FontAwesomeIcons.utensils)),
          CustomNavigationBarItem(icon: const FaIcon(FontAwesomeIcons.book)),
          // CustomNavigationBarItem(icon: const FaIcon(FontAwesomeIcons.solidUser)),
        ],
      ),
    );
  }
}