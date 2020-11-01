import 'package:flutter/material.dart';
import 'package:side_bar/bloc/Navigation_bloc/navigation_bloc.dart';

class DashboardPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6ED17),
      body: Center(
        child: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff606060),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
