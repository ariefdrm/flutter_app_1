import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List listData = [];
  void getData() async {
    EasyLoading.show();
    var url = Uri.parse('https://dummyjson.com/users');
    var response = await http.get(url);
    var responseJson = jsonDecode(response.body);

    setState(() {
      listData = responseJson['users'];
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Users'),
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail-users',
                arguments: listData[index],
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listData[index]['image']),
            ),
            title: Text('nama: ${listData[index]['firstName']}'),
            subtitle: Text('lastname: ${listData[index]['lastName']}'),
          );
        },
      ),
    );
  }
}
