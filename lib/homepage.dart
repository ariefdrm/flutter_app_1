import 'package:flutter/material.dart';
import 'package:project_flutter/datamahasiswa.dart';
import 'package:project_flutter/main_menu.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/mahasiswa-list': (context) => const Datamahasiswa()},
      home: MainMenu(),
    );
  }
}
