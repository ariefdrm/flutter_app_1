import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('aplikasi keren'),
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            runSpacing: 10,
            spacing: 10,
            children: [
              TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[300],
                  foregroundColor: Colors.white,
                  fixedSize: const Size(160, 100),
                  shape: LinearBorder(),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/mahasiswa-list');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list, size: 40.0),
                    Text('Data Mahasiswa'),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[300],
                  foregroundColor: Colors.white,
                  fixedSize: Size(160, 100),
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.add, size: 40), Text('Tambah Data')],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[300],
                  foregroundColor: Colors.white,
                  fixedSize: Size(160, 100),
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/list-products');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.indeterminate_check_box_sharp, size: 40),
                    Text('list-products'),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[300],
                  foregroundColor: Colors.white,
                  fixedSize: Size(160, 100),
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.add, size: 40), Text('Tambah Data')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
