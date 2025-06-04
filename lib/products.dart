import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List listData = [];
  void getData() async {
    var url = 'https://dummyjson.com/products';
    var response = await http.get(Uri.parse(url));
    var responseJson = jsonDecode(response.body);

    setState(() {
      listData = responseJson['products'];
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
              backgroundImage: NetworkImage(listData[index]['thumbnail']),
            ),
            title: Text('title: ' + listData[index]['title']),
            subtitle: Column(
              children: [
                Text('description: ' + listData[index]['description']),
                ElevatedButton(onPressed: () {}, child: Text('beli barang')),
              ],
            ),
          );
        },
      ),
    );
  }
}
