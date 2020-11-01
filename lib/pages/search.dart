import 'package:flutter/material.dart';
import 'package:side_bar/bloc/Navigation_bloc/navigation_bloc.dart';

class SearchPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC7D3D4),
      body: Center(
        child: Text(
          'Search',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff603F83),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
