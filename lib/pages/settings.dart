import 'package:flutter/material.dart';
import 'package:side_bar/bloc/Navigation_bloc/navigation_bloc.dart';

class SettingsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDB599),
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff42EADD),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
