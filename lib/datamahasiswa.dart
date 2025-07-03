import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class Datamahasiswa extends StatefulWidget {
  const Datamahasiswa({super.key});

  @override
  State<Datamahasiswa> createState() => _DatamahasiswaState();
}

class _DatamahasiswaState extends State<Datamahasiswa> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List data = [];

  List listData = [];
  void getData() async {
    EasyLoading.show(status: "loading!");
    var url = "https://belajar-api.unama.ac.id/api/mahasiswa";
    var uri = Uri.parse(url);
    var result = await http.get(uri);
    var response = jsonDecode(result.body);

    setState(() {
      data = response["data"];
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Mahasiswa')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: SizedBox(
              width: 80,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await http
                          .delete(
                            Uri.parse(
                              "http://belajar-api.unama.ac.id/api/mahasiswa/${data[index]['id']}",
                            ),
                          )
                          .then((hasil) {
                            if (hasil.statusCode == 200) {
                              EasyLoading.showSuccess("data berhasil dihapus");
                              getData();
                            } else {
                              EasyLoading.showError(
                                jsonDecode(hasil.body)['message'],
                              );
                            }
                          });
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        arguments: data[index],
                        context,
                        '/edit-mahasiswa',
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                arguments: data[index],
                context,
                "/detail-mahasiswa",
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index]["foto"]),
            ),
            title: Text(data[index]['nama']),
            subtitle: Text(data[index]['program_studi']),
          );
        },
      ),
    );
  }
}
