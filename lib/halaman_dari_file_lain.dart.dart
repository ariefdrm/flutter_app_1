import 'package:flutter/material.dart';

class HalamanDariFileLainDart extends StatefulWidget {
  const HalamanDariFileLainDart({Key? key}) : super(key: key);

  @override
  _HalamanDariFileLainDartState createState() =>
      _HalamanDariFileLainDartState();
}

class _HalamanDariFileLainDartState extends State<HalamanDariFileLainDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('aplikasi pertama'))),
      body: Center(child: Text('test text')),
    );
  }
}
