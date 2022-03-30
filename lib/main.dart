import 'package:flutter/material.dart';
import 'login/index.dart';
import 'home/index.dart';
import 'forgotpwd/index.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'อสร.',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
        fontFamily: 'Kanit',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/forgotpwd': (context) => const ForgotpwdPage(),
      },
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

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key, this.position}) : super(key: key);
  final int? position;

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(0);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.rectangle;

  Color selectedColor = Colors.green;
  Color unselectedColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      key: widget.key,
      height: 80,
      backgroundColor: const Color(0xfff0fff2),
      behaviour: snakeBarStyle,
      snakeShape: snakeShape,
      padding: padding,
      snakeViewColor: selectedColor,
      selectedItemColor:
          snakeShape == SnakeShape.indicator ? selectedColor : null,
      unselectedItemColor: unselectedColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: widget.position ?? _selectedItemPosition,
      // onTap: (index) => navigate(index, context),
      onTap: (index) => setState(() => navigate(index, context)),
      items: const [
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 40,
              child: Image(
                image: AssetImage('images/admin.png'),
              ),
            ),
            label: 'ภาพรวม'),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 40,
              child: Image(
                image: AssetImage('images/schedule.png'),
              ),
            ),
            label: 'ตารางงาน อสร'),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 40,
              child: Image(
                image: AssetImage('images/newspaper.png'),
              ),
            ),
            label: 'ข่าวอัพเดท'),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 40,
              child: Image(
                image: AssetImage('images/notifications.png'),
              ),
            ),
            label: 'แจ้งเบาะแส'),
      ],
      selectedLabelStyle: const TextStyle(fontSize: 15),
      unselectedLabelStyle: const TextStyle(fontSize: 15),
    );
  }
}

navigate(int index, context) {
  if (index == 0) {
    Navigator.pushNamed(context, '/home');
  } else {
    Navigator.pushNamed(context, '/home2');
  }
}
