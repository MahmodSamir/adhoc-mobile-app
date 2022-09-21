
import 'package:date_field/date_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/theme_config.dart';
import '../inventory/custom_form_field.dart';
import '../inventory/inventory_main_card.dart';
import '../widgets/card_tile.dart';
import '../widgets/main_image_card.dart';
import '../widgets/list_tile.dart';
import '../widgets/timeline_card.dart';
import 'appbar.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var respWidth = MediaQuery.of(context).size.width;
    var respHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      // todo: use user's image if it exists
      drawer: const CustomDrawer(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              SizedBox(height: 10,),
              InventoryMainCard(),
              customListTile(title: 'custom list tile', onTap: (){}),
              customListTile( title: 'custom list tile with image ', onTap: (){},
               leading: customListTileLeading(text: '2')),
              //todo:
              TimelineCard(onTap: (){
              }),

              MainImageCard(),
              MainImageCard(imageUrl: 'https://www.oberlo.com/media/1603969901-productphotog-1.jpg?fit=max&fm=webp&w=1824',),
              customCardListTile(onTap: (){}, title: 'custom list tile2'),
              customListTile(title: 'custom list tile 1', onTap: (){}),
              addImageContainer(onTap: (){}),
              //cameraImage(onTap: (){}, ),

              SizedBox(height: 20,),









            ],
          ),
        ),
      ),
    );
  }
}


