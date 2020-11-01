import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_bar/pages/home_page.dart';
import 'bloc/Navigation_bloc/navigation_bloc.dart';
import 'file:///C:/Users/shikumi/AndroidStudioProjects/side_bar/lib/widget/side_bar.dart';

void main() {
  runApp(MaterialApp(
    home: XSideBar(),
  ));
}

class XSideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage()),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
