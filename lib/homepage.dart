import 'package:flutter/material.dart';
import 'package:project_flutter/datamahasiswa.dart';
import 'package:project_flutter/main_menu.dart';
import 'package:project_flutter/products.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/mahasiswa-list': (context) => const Datamahasiswa(),
        '/list-products': (context) => const Products(),
      },
      home: MainMenu(),
    );
  }
}
