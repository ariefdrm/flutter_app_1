import 'package:flutter/material.dart';

class DetailsUsers extends StatefulWidget {
  const DetailsUsers({Key? key}) : super(key: key);

  @override
  State<DetailsUsers> createState() => _DetailsUsersState();
}

class _DetailsUsersState extends State<DetailsUsers> {
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    final args = route?.settings.arguments;

    if (args == null || args is! Map) {
      return const Scaffold(body: Center(child: Text('No user data provided')));
    }

    final dataUsers = args;

    return Scaffold(
      appBar: AppBar(title: Text(dataUsers['firstName'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.network(dataUsers['image'], height: 200)),
          Text('firstnama ${dataUsers['firstName']}'),
          Text('firstnama ${dataUsers['lastName']}'),
          Text('firstnama ${dataUsers['birthDate']}'),
        ],
      ),
    );
  }
}
