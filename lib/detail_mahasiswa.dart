import 'package:flutter/material.dart';

class DetailMahasiswa extends StatefulWidget {
  const DetailMahasiswa({Key? key}) : super(key: key);

  @override
  _DetailMahasiswaState createState() => _DetailMahasiswaState();
}

class _DetailMahasiswaState extends State<DetailMahasiswa> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Mahasiswa')),
      body: Column(
        children: [
          Image(image: NetworkImage(data['foto'])),
          Text(data['nama']),
          Text(data['nim']),
          Text(data['tanggal_lahir']),
          Text(data['program_studi']),
        ],
      ),
    );
  }
}
