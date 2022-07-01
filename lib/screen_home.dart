// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, unnecessary_null_comparison, prefer_const_constructors, library_prefixes, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Customers Information',
        ),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<User>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: ListTile(
                        tileColor: Colors.amberAccent,
                        minVerticalPadding: 10,
                        title: Text(
                          items[index].username.toString(),
                        ),
                        subtitle: Text(
                          items[index].email.toString(),
                        ),
                        trailing: Text(
                            'The Nationalty Is: ${items[index].nationalty.toString()} '),
                        leading: Text(
                          items[index].rank.toString(),
                        ),
                      ));
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<User>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/sample.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => User.fromJson(e)).toList();
  }
}
