import 'dart:convert';

import 'package:api_app/Dashboard/Data/api/api.dart';
import 'package:api_app/Dashboard/views/UserDetail.dart';
import 'package:api_app/Dashboard/views/widgets/reusablerow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
                    //Api function fetch data
                    future: getUserApi(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      } else {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              //OnTap make next screen call with data
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          //call data from api
                                          //User Detail is constructor of next screen
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
                                      // Widget use from reusable row file located in reusablerow
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
