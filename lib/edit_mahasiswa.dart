import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class EditMahasiswa extends StatefulWidget {
  const EditMahasiswa({super.key});

  @override
  State<EditMahasiswa> createState() => _EditMahasiswaState();
}

class _EditMahasiswaState extends State<EditMahasiswa> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _programStudiController = TextEditingController(
    text: 'SI',
  );
  final TextEditingController _tanggalLahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataMhs = ModalRoute.of(context)!.settings.arguments as Map;

    _namaController.text = dataMhs['nama'];
    _nimController.text = dataMhs['nim'];
    _tanggalLahirController.text = dataMhs['tanggal_lahir'];
    _programStudiController.text = dataMhs['program_studi'];

    return Scaffold(
      appBar: AppBar(title: Text('Edit data mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nimController,
                decoration: InputDecoration(labelText: 'Nim'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nim tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(labelText: 'Program Studi'),
                items: const [
                  DropdownMenuItem(
                    value: 'SI',
                    child: Text('Sistem Informasi'),
                  ),
                  DropdownMenuItem(value: 'SK', child: Text('Sistem Komputer')),
                  DropdownMenuItem(
                    value: 'TI',
                    child: Text('Teknik Informatika'),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    _programStudiController.text = value.toString();
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _tanggalLahirController,
                decoration: InputDecoration(labelText: 'Tanggal lahir'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tanggal lahir tidak boleh kosong';
                  }
                  return null;
                },
                onTap: () async {
                  var pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2030),
                  );

                  if (pickedDate != null) {
                    _tanggalLahirController.text = DateFormat(
                      'yyyy-MM-dd',
                    ).format(pickedDate);
                  }
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    EasyLoading.show();

                    var url = Uri.parse(
                      'https://belajar-api.unama.ac.id/api/mahasiswa/${dataMhs['id']}',
                    );

                    var data = {
                      'nama': _namaController.text,
                      'nim': _nimController.text,
                      'tanggal_lahir': _tanggalLahirController.text,
                      'program_studi': _programStudiController.text,
                    };

                    var response = await http.put(
                      url,
                      body: data,
                      headers: {'Accepts': 'application/json'},
                    );

                    EasyLoading.dismiss();

                    if (response.statusCode == 200) {
                      EasyLoading.showSuccess('Data berhasil diupdate');
                      // Navigator.of(context).pushNamed('/mahasiswa-list');
                      // Navigator.pop(context);
                    } else {
                      var responseJson = jsonDecode(response.body);
                      EasyLoading.showError(
                        'Oops ... ${responseJson['message']}',
                      );
                    }
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
