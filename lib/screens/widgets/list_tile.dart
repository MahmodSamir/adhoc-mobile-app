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
