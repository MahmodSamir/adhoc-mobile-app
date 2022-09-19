import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class drawerTile extends StatelessWidget {
  String text;
  IconData icn;
  drawerTile(this.text, this.icn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icn),
          title: Text(text),
          onTap: () => print("list Tapped"),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 100,
            color: Colors.grey[300],
          ),
        )
      ],
    );
  }
}
