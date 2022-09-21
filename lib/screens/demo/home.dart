import 'dart:convert';

import 'package:adhoc/screens/login.dart';
import 'package:adhoc/widgets/addButton.dart';
import 'package:adhoc/widgets/cardTile.dart';
import 'package:adhoc/widgets/drawerTile.dart';
import 'package:adhoc/widgets/flatButton.dart';
import 'package:adhoc/widgets/imageCard.dart';
import 'package:adhoc/widgets/imageCards.dart';
import 'package:adhoc/widgets/listTile.dart';
import 'package:adhoc/widgets/theme_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState(); //comes first for initState();
    fetch();
  }

  fetch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('key');
    //var token = await getToken();
    var res = await Dio().get(
      "https://system.adhoc.et3.co/api/users/",
      options: Options(
        headers: {
          "Authorization": "token $token",
        },
      ),
    );
    if (res.statusCode == 200) {
      return res.data;
      }
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('key');
  }

  Widget build(BuildContext context) {
    var respWidth = MediaQuery.of(context).size.width;
    var respHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetch(),
          builder: (ctx, dynamic snapShot){
            if(snapShot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
          }else{
            return ListView.builder(
              itemBuilder: (_,index){
                return ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.pink,),
                  title: Text(snapShot.data[index]['username'].toString()),
                  //subtitle: Text("${snapShot[index]['id']}"),
                );
              },
              itemCount: 2,
              );
          }
          },
        ),
      )

    );
  }
}
