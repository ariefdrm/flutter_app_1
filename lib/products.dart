import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List listData = [];
  void getData() async {
    // var url2 = Uri.http("https://dummyjson.com/products");
    // var response2 = await http.get(url2);
    // var result2 = jsonDecode(response2.body);
    // print(result2.toString());

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
