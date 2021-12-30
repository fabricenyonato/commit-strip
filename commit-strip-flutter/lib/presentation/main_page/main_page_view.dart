import 'package:commit_strip/utils.dart';
import 'package:flutter/material.dart';
import 'package:commit_strip/presentation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPageView extends StatelessWidget {
  final MainPageData data;
  final Widget child;
  final void Function(NavItemId) onNavTap;

  const MainPageView({
    Key? key,
    required this.data,
    required this.child,
    required this.onNavTap,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = locale(context);

    final navItems = [
      NavItemData(
        id: NavItemId.home,
        icon: FontAwesomeIcons.home,
        label: t.home,
      ),
      NavItemData(
        id: NavItemId.favorites,
        icon: FontAwesomeIcons.star,
        label: t.favorites,
      ),
    ];

    final currentIndex = navItems
      .indexWhere((item) => item.id == data.currentNavId);

    final navBar = BottomNavigationBar(
      currentIndex: -1 == currentIndex ? 0 : currentIndex,
      unselectedFontSize: 14,
      onTap: (index) =>
        onNavTap(navItems[index].id),
      items: [
        for (var item in navItems)
          BottomNavigationBarItem(
            icon: FaIcon(item.icon),
            label: item.label,
          ),
      ]
    );

    return Scaffold(
      body: child,
      bottomNavigationBar: navBar,
    );
  }
}
