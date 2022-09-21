
import 'package:flutter/material.dart';

import '../../shared/styles/theme_config.dart';
import 'inventory_main_card.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: <Widget>[
            TextButton(
              onPressed: (){
                //todo: save
                print('save');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.black),

              ),
              child: new Text('Save all', style: TextStyle( fontSize: 18, color: ThemeConfig.darkAccent),),
            )
          ],
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: Colors.black,),

          title: Center(child: Text('Inventory', style: TextStyle(color: Colors.black),))
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              InventoryMainCard(),
              InventoryMainCard(),
              InventoryMainCard(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor:  ThemeConfig.darkAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
