import 'package:adhoc/widgets/addButton.dart';
import 'package:adhoc/widgets/cardTile.dart';
import 'package:adhoc/widgets/drawerTile.dart';
import 'package:adhoc/widgets/flatButton.dart';
import 'package:adhoc/widgets/imageCard.dart';
import 'package:adhoc/widgets/imageCards.dart';
import 'package:adhoc/widgets/listTile.dart';
import 'package:adhoc/widgets/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var respWidth = MediaQuery.of(context).size.width;
    var respHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeConfig.lightBG,
      appBar: AppBar(backgroundColor: ThemeConfig.lightPrimary,),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: ThemeConfig.lightPrimary,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ThemeConfig.lightAccent,
                  ),
                  title: Text("name"),
                  subtitle: Text("company"),
                )),
            drawerTile("text", Icons.timeline),
            drawerTile("text", Icons.timeline),
            drawerTile("text", Icons.timeline),
            drawerTile("text", Icons.timeline),
            drawerTile("text", Icons.timeline),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            flatButton(
                5,
                respWidth * .20,
                respHeight * .05,
                Alignment.topLeft,
                ThemeConfig.darkAccent,
                const Text(
                  "1st",
                  style: TextStyle(color: Colors.white),
                )),
            flatButton(
                5,
                respWidth * .08,
                respHeight * .04,
                Alignment.bottomRight,
                Colors.white,
                const Icon(
                  Icons.track_changes_outlined,
                  color: Colors.blue,
                )),
            listTile("text", Image.network("https://www.worldometers.info/img/flags/al-flag.gif",height: respHeight *.04,width: respWidth*.08,)),
            listTile("text2", CircleAvatar(backgroundColor: Colors.blue,)),
            imageCard("صورة الثلاجة قبل التنسيق"),
            imageCard("After"),
            cardTile(),
          ],
        ),
      ),
    );
  }
}
