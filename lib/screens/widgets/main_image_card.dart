
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components/components.dart';



class MainImageCard extends StatefulWidget {
  String text;
  String imageUrl;
  MainImageCard({this.text = 'text',
    this.imageUrl = "none"});

  @override
  State<MainImageCard> createState() => _MainImageCardState();
}

class _MainImageCardState extends State<MainImageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 3,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: widget.imageUrl == 'none'? Image.asset('assets/images/placeholder.png') :Image.network(
                    widget.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit:  BoxFit.cover,
                  ),
                 // child: Image.asset('assets/images/placeholder.png', fit: BoxFit.scaleDown),
                  //child:Center(child:  Text('No image.', style: TextStyle(fontSize: 16),),
                ),
              ),

            ],
          ),


          Divider(height: 0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Row(
              children: [
                addImageContainer(onTap: (){}, containerWidth: 50.0, padding: 10.0, iconSize: 25.0),
                Spacer(),
                Container(
                  //width: 120,
                  //width: MediaQuery.of(context).size.width * 0.6,
                  child: Text('صورة المنتج قبل التنسيق',
                      style: TextStyle(fontSize: 15,),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
