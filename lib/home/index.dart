import 'package:flutter/material.dart';
import 'firstpage/first.dart';
import 'secondpage/second.dart';
import 'thirdpage/third.dart';
import 'fourthpage/fourth.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

enum TabItem { first, second, third, fourth }

const Map<TabItem, List> tabName = {
  TabItem.first: ['ภาพรวม', 'admin'],
  TabItem.second: ['ตารางงาน อสร', 'schedule'],
  TabItem.third: ['ข่าวอัพเดท', 'newspaper'],
  TabItem.fourth: ['แจ้งเบาะแส', 'notifications'],
};

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _currentTab = TabItem.first;
  final _navigatorKeys = {
    TabItem.first: GlobalKey<NavigatorState>(),
    TabItem.second: GlobalKey<NavigatorState>(),
    TabItem.third: GlobalKey<NavigatorState>(),
    TabItem.fourth: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.first) {
            // select 'main' tab
            _selectTab(TabItem.first);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.first),
          _buildOffstageNavigator(TabItem.second),
          _buildOffstageNavigator(TabItem.third),
          _buildOffstageNavigator(TabItem.fourth),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.detail]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      // TabNavigatorRoutes.root: (context) => ColorsListPage(
      //       color: activeTabColor[tabItem]!,
      //       title: tabName[tabItem]![0],
      //     ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        if (tabItem == TabItem.first) {
          return MaterialPageRoute(
            builder: (context) => const FirstHomePage(),
          );
        } else if (tabItem == TabItem.second) {
          return MaterialPageRoute(
            builder: (context) => const SecondHomePage(),
          );
        } else if (tabItem == TabItem.third) {
          return MaterialPageRoute(
            builder: (context) => const ThirdHomePage(),
          );
        } else if (tabItem == TabItem.fourth) {
          return MaterialPageRoute(
            builder: (context) => const FourthHomePage(),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        }
      },
    );
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  SnakeShape snakeShape = SnakeShape.rectangle;
  Color selectedColor = Colors.green;
  Color unselectedColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      height: 80,
      backgroundColor: const Color(0xfff0fff2),
      behaviour: SnakeBarBehaviour.floating,
      snakeShape: snakeShape,
      padding: const EdgeInsets.all(0),
      snakeViewColor: selectedColor,
      selectedItemColor:
          snakeShape == SnakeShape.indicator ? selectedColor : null,
      unselectedItemColor: unselectedColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      items: [
        _buildItem(TabItem.first),
        _buildItem(TabItem.second),
        _buildItem(TabItem.third),
        _buildItem(TabItem.fourth),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 40,
        child: Image(
          image: AssetImage('images/${tabName[tabItem]?[1]}.png'),
        ),
      ),
      label: tabName[tabItem]?[0],
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Header.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Image.asset(
        'images/LOGO_Planet_KID.png',
        height: 54,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          onPressed: () {
            //
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            //
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
