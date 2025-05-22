import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Datamahasiswa extends StatefulWidget {
  const Datamahasiswa({Key? key}) : super(key: key);

  @override
  _DatamahasiswaState createState() => _DatamahasiswaState();
}

class _DatamahasiswaState extends State<Datamahasiswa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List listData = [];
  void getData() async {
    var url = Uri.parse('http://belajar-api.unama.ac.id/api/mahasiswa');
    var response = await http.get(url);
    var responseJson = jsonDecode(response.body);

    setState(() {
      listData = responseJson['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data mahasiswa'),
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listData[index]['foto']),
            ),
            title: Text('nama: ' + listData[index]['nama']),
            subtitle: Text('nim: ' + listData[index]['nim']),
          );
        },
      ),
    );
  }
}
