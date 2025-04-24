import 'package:flutter/material.dart';

class Biodata extends StatelessWidget {
  const Biodata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('BIODATA'))),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 200,
              color: Colors.black54,
              child: Center(
                child: Text(
                  'Arief darmawan',
                  style: TextStyle(fontSize: 25, color: Colors.white70),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          '8020230033',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      color: const Color.fromARGB(255, 151, 47, 151),
                      child: Center(
                        child: Text('Prodi', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 225,
                  height: 400,
                  color: const Color.fromARGB(255, 169, 226, 78),
                  child: Center(
                    child: Text('test baris', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
