import 'package:flutter/material.dart';

class Datamahasiswa extends StatefulWidget {
  const Datamahasiswa({Key? key}) : super(key: key);

  @override
  _DatamahasiswaState createState() => _DatamahasiswaState();
}

class _DatamahasiswaState extends State<Datamahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data mahasiswa'),
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.black,
      ),
      body: Container(child: Text("hello, from mahasiswa")),
    );
  }
}
