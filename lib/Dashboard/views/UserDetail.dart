import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class UserDetail extends StatelessWidget {
  final image;
  final name;
  final actorname;
  final housename;
  UserDetail(
      {required this.image,
      required this.name,
      required this.actorname,
      required this.housename});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(image),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(height * 0.05),
            child: Column(
              children: [
                Container(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(name),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Actor Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(actorname),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'House Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(housename),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
