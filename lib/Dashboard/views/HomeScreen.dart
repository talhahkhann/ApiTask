import 'dart:convert';

import 'package:api_app/Dashboard/views/UserDetail.dart';
import 'package:api_app/Dashboard/views/widgets/reusablerow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var data;
Future<void> getUserApi() async {
  final response =
      await http.get(Uri.parse('https://hp-api.onrender.com/api/characters'));
  if (response.statusCode == 200) {
    data = jsonDecode(response.body.toString());
  } else {}
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "List of Users from Api",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: getUserApi(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      } else {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserDetail(
                                                image: data[index]['image'],
                                                name: data[index]['name'],
                                                actorname: data[index]['actor'],
                                                housename: data[index]['house'],
                                              )));
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      ReusableRow(
                                          value: data[index]['name'].toString(),
                                          Placeholder: "Name"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ReusableRow(
                                          value:
                                              data[index]['species'].toString(),
                                          Placeholder: "Species"),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
