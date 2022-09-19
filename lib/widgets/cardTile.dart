import 'package:adhoc/widgets/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class cardTile extends StatefulWidget {
  const cardTile({super.key});

  @override
  State<cardTile> createState() => _cardTileState();
}

class _cardTileState extends State<cardTile> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat.jm().format(now);
    return Container(
      height: 100,
      child: InkWell(
        onTap: () => print("tile"),
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(backgroundColor: ThemeConfig.darkAccent,),
                title: Text("name"),
                subtitle: Text("company"),
                trailing: Text(formatter),
              ),
              Text("No activites."),
            ],
          ),
        ),
      ),
    );
  }
}