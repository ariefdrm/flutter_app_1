import 'package:flutter/material.dart';

class DetailsUsers extends StatefulWidget {
  const DetailsUsers({super.key});

  @override
  _DetailsUsersState createState() => _DetailsUsersState();
}

class _DetailsUsersState extends State<DetailsUsers> {
  @override
  Widget build(BuildContext context) {
    final dataUsers = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: Text(dataUsers['firstName'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('firstnama ${dataUsers['firstName']}'),
          Text('firstnama ${dataUsers['lastName']}'),
          Text('firstnama ${dataUsers['birthDate']}'),
        ],
      ),
    );
  }
}
