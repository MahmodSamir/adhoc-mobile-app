
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/theme_config.dart';
import 'custom_form_field.dart';

class InventoryMainCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      //height: 140,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(5),
        ),
        boxShadow: [ // so here your custom shadow goes:
          BoxShadow(
            color: Colors.black.withAlpha(30), // the color of a shadow, you can adjust it
            spreadRadius: 3, //also play with this two values to achieve your ideal result
            blurRadius: 5,
            offset: Offset(0, -7), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 addImageContainer(containerWidth: 120.0, onTap: (){}),
                 Spacer(),
                 IconButton(
                     onPressed: (){
                       //todo: delete -- show popup to confirm deletion
                     },
                     icon: Icon(Icons.cancel_outlined, color: Colors.red.shade700,
                   size: 30,
                 ))
               ],
             ),
              _sizedBoxDivider(),
              _sizedBoxDivider(),
              Row(

                children: [
                  Expanded(child: CustomTextFormField(onSaved: (_){},validator: (){},title: 'Shelf quantity ')),
                  SizedBox(width: 15,),
                  Expanded(child: CustomTextFormField(onSaved: (_){},validator: (){},title: 'Shelf price '))
                ],
              ),
              _sizedBoxDivider(),

              Row(

                children: [
                  Expanded(child: CustomTextFormField(onSaved: (_){},validator: (){},title: 'Store quality ')),
                  SizedBox(width: 15,),
                  Expanded
                    (child: customDateFormField(),),
                ],
              ),
              _sizedBoxDivider(),
              _dottedContainer(title: 'Additional notes', subTitle: 'Type your notes here..', onTap: (){}),


            ],
          ),
        ),
      ),
    );
  }
}

Widget _sizedBoxDivider() => SizedBox(
  height: 10,
);

Widget _dottedContainer({title, subTitle, onTap }){
  return InkWell(
    onTap: (){
    },
    child: DottedBorder(
      color: ThemeConfig.lightAccent,
      dashPattern: [5, 4],
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title,style: TextStyle(fontSize: 16),),
            Text(subTitle, style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    ),
  );
}