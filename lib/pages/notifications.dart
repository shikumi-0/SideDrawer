import 'package:flutter/material.dart';
import 'package:side_bar/bloc/Navigation_bloc/navigation_bloc.dart';

class NotificationsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101820),
      body: Center(
        child: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xffFEE715),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
