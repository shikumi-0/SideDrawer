import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:side_bar/bloc/Navigation_bloc/navigation_bloc.dart';
import 'package:side_bar/pages/dashboard.dart';
import 'package:side_bar/pages/home_page.dart';
import 'package:side_bar/pages/notifications.dart';
import 'package:side_bar/pages/search.dart';
import 'package:side_bar/pages/settings.dart';
import 'package:side_bar/widget/drawer_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  StreamController<bool> sideBarIsOpenStreamController;
  Stream<bool> sideBarIsOpenStream;
  StreamSink<bool> sideBarIsOpenSink;
  final _animationDuration = const Duration(microseconds: 500);
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    sideBarIsOpenStreamController = PublishSubject<bool>();
    sideBarIsOpenStream = sideBarIsOpenStreamController.stream;
    sideBarIsOpenSink = sideBarIsOpenStreamController.sink;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    sideBarIsOpenStreamController.close();
    sideBarIsOpenSink.close();
    super.dispose();
  }

  onIconPressed() {
    final animationStatus = _animationController.status;
    final animationCompleted = animationStatus == AnimationStatus.completed;
    if (animationCompleted) {
      sideBarIsOpenSink.add(false);
      _animationController.reverse();
    } else {
      sideBarIsOpenSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
      initialData: false,
      builder: (context, sideBArOpenAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: sideBArOpenAsync.data ? 0 : -screenWidth,
          right: sideBArOpenAsync.data ? 0 : screenWidth - 40,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xff00203F),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Shikumi",
                        style:
                            TextStyle(fontSize: 40, color: Color(0xffADEFD1)),
                      ),
                      Text(
                        "Shivang.mishra007@gmail.com",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffADEFD1)),
                      ),
                      Divider(
                        color: Color(0xffADEFD1),
                        height: 64,
                        thickness: 0.5,
                        indent: 26,
                        endIndent: 26,
                      ),
                      DrawerItem(
                        icon: Icons.home,
                        title: 'HomePage',
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      DrawerItem(
                        icon: Icons.dashboard_outlined,
                        title: 'Dashboard',
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.DashboardPageClickedEvent);
                        },
                      ),
                      DrawerItem(
                        icon: Icons.search,
                        title: 'Search',
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.SearchPageClickedEvent);
                        },
                      ),
                      DrawerItem(
                        icon: Icons.notifications,
                        title: 'Notifications',
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(
                              NavigationEvents.NotificationsPageClickedEvent);
                        },
                      ),
                      Divider(
                        color: Color(0xffADEFD1),
                        height: 64,
                        thickness: 0.5,
                        indent: 26,
                        endIndent: 26,
                      ),
                      DrawerItem(
                        icon: Icons.settings,
                        title: 'Settings',
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.SettingsPageClickedEvent);
                        },
                      ),
                      DrawerItem(
                        icon: Icons.logout,
                        title: 'Logout',
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomDrawerClipper(),
                    child: Container(
                      height: 110,
                      width: 35,
                      color: Color(0xff00203F),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController,
                        icon: AnimatedIcons.menu_arrow,
                        size: 30,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      stream: sideBarIsOpenStream,
    );
  }
}

class CustomDrawerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    Path path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
