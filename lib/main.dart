import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_json/models/data_model.dart';
import 'package:latihan_json/repo/repo.dart';

import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataModel?> listData = [];
  Repo repo = Repo();

  getData() async {
    listData = await repo.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LATIHAN JSON SERIALIAZBLE"),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.error != null) {
                return Icon(Icons.error);
              } else {
                return ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: ((context, index) => ListTile(
                          title: Text(listData[index]!.email.toString()),
                          subtitle:
                              Text(listData[index]!.first_name.toString()),
                        )));
              }
            }));
  }
}
