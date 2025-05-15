import 'package:flutter/material.dart';

class AppbarTemplate extends StatelessWidget {
  final String appbarTitle;
  const AppbarTemplate({required this.appbarTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appbarTitle),
      backgroundColor: Colors.blue[200],
      foregroundColor: Colors.black,
    );
  }
}
