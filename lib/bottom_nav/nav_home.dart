import 'package:flutter/material.dart';
import 'package:net_play/Profile/profile_main.dart';
import 'package:net_play/appbar/app_bar.dart';
import 'package:net_play/bottom_nav/nav_bar.dart';
import 'package:net_play/bottom_nav/nav_model.dart';
import 'package:net_play/drawer/drawer_main.dart';
import 'package:net_play/reservation/reservation.dart';
import 'package:net_play/score/score_main.dart';
import 'package:net_play/coach/coach_main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];
  bool isLoggedIn = true; // Initially, assume the user is logged in

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(
        page: const TabPage(tab: 1),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 2),
        navKey: searchNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 3),
        navKey: notificationNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 4),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: isLoggedIn ? CustomAppBar() : null,
        drawer: CustomDrawer(),
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
            key: page.navKey,
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(builder: (context) => page.page)
              ];
            },
          ))
              .toList(),
        ), // Hide FAB if not logged in
        bottomNavigationBar: isLoggedIn
            ? SizedBox(
          height: 80, // Adjust the height here
          child: NavBar(
            pageIndex: selectedTab,
            onTap: (index) {
              if (index == selectedTab) {
                items[index].navKey.currentState
                    ?.popUntil((route) => route.isFirst);
              } else {
                setState(() {
                  selectedTab = index;
                });
              }
            },
          ),
        )
            : null, // Hide bottom navigation bar if not logged in
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case 1:
        return BadmintonReservation();
      case 2:
        return MyApp();
      case 3:
        return Coach();
      case 4:
        return profile();
      default:
        return Scaffold(

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tab $tab'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Page(tab: tab),
                      ),
                    );
                  },
                  child: const Text('Go to page'),
                )
              ],
            ),
          ),
        );
    }
  }
}

class Page extends StatelessWidget {
  final int tab;

  const Page({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text('Tab $tab')),
    );
  }
}
