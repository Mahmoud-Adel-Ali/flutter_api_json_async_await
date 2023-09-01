// import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:http/http.dart';

//to start any Application ,you should write the code
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ApiJsonAsyncAwait(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ApiJsonAsyncAwait extends StatefulWidget {
  const ApiJsonAsyncAwait({super.key});

  @override
  State<ApiJsonAsyncAwait> createState() => _ApiJsonAsyncAwaitState();
}

class _ApiJsonAsyncAwaitState extends State<ApiJsonAsyncAwait> {
  String name = "///////////";
  Map details = {"timezone": "Egypt..."};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api & Json & Async & Await"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 192, 71, 62),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //Json.body = Map
          try {
            Response response = await get(
                Uri.parse("http://worldtimeapi.org/api/timezone/Africa/Cairo"));

            setState(() {
              details = jsonDecode(response.body);
            });
          } catch (e) {}
          // print(details);
        },
        backgroundColor: const Color.fromARGB(255, 192, 71, 62),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quntre",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              details["timezone"],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
