import 'package:flutter/material.dart';

class TambahDataMahasiswa extends StatefulWidget {
  const TambahDataMahasiswa({super.key});

  @override
  State<TambahDataMahasiswa> createState() => _TambahDataMahasiswaState();
}

class _TambahDataMahasiswaState extends State<TambahDataMahasiswa> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tambah data mahasiswa')),
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
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    String nama = _namaController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Hallo, Nama saya $nama')),
                    );
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
