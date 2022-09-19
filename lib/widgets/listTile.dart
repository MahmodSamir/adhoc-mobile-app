import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class listTile extends StatelessWidget {
  String text;
  Widget lead;
  listTile(this.text, this.lead, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: lead,
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => print("list Tapped"),
    ));
  }
}

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class listTile extends StatelessWidget {
  String text;
  listTile(this.text,{super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children:[ 
        ListTile(
        leading: CircleAvatar(backgroundColor: Colors.black,),
        title: Text(text),
        trailing: Icon(Icons.arrow_forward_sharp),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 1,
            color: Theme.of(context).dividerColor,
            width: size.width - 70,
          ),
        ),
      ]
    );
  }
}
*/