import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_flutter/datamahasiswa.dart';
import 'package:project_flutter/details_users.dart';
import 'package:project_flutter/edit_mahasiswa.dart';
import 'package:project_flutter/main_menu.dart';
import 'package:project_flutter/products.dart';
import 'package:project_flutter/tambah_data_mahasiswa.dart';
import 'package:project_flutter/users.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/mahasiswa-list': (context) => const Datamahasiswa(),
        '/tambah-data-mahasiswa': (context) => const TambahDataMahasiswa(),
        '/list-products': (context) => const Products(),
        '/users': (context) => const Users(),
        '/detail-users': (context) => const DetailsUsers(),
        '/edit-mahasiswa': (context) => const EditMahasiswa(),
      },
      builder: EasyLoading.init(),
      home: MainMenu(),
    );
  }
}
