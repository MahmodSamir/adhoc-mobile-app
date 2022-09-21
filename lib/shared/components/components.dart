import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../styles/theme_config.dart';

Widget customListTile({title, onTap, leading}) =>  Column(
  children: [
    ListTile(

      onTap: onTap,
      title: Text(title),
      leading: leading != null? leading :null,
      trailing: Icon(
        Icons.navigate_next,
        size: 28,),
    ),
    Divider(height: 4, thickness: 1,),
  ],
);

// Widget addImageContainer({onTap, padding = 25.0, iconSize = 35.0}){
//   return  Column(
//     children: [
//       InkWell(
//         onTap: onTap,
//         child: Container(
//             padding: EdgeInsets.all(padding),
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black45,
//                 ),
//                 borderRadius: BorderRadius.all(Radius.circular(5))
//             ),
//             child: Icon(Icons.camera_alt, color: Colors.black54, size: iconSize,)
//         ),
//       ),
//
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text('Add image', style: TextStyle(fontWeight: FontWeight.w500)),
//       ),
//     ],
//   );
// }

Widget addImageContainer({onTap, containerWidth = 80.0, padding = 25.0, iconSize = 35.0}) =>   InkWell(
  onTap: onTap,
  child: Container(
      width: containerWidth,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black45,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
     // child: Icon(Icons.camera_alt, color: Colors.black54, size: iconSize,)
      child: Image.asset('assets/icons/image_add.png', fit: BoxFit.scaleDown,
        color: Colors.grey.shade500,
      ),
  ),
);


Widget customCardListTile({ title, onTap}) =>  Card(
  elevation: 2,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10)),
  ),
  child: Container(
    // padding: EdgeInsets.symmetric(horizontal: 2),
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: ListTile(
      onTap: onTap,

      title: Text(title),
      trailing: Icon(
        // Icons.arrow_forward_ios,
        Icons.navigate_next,
        size: 28,),
    ),
  ),
);

Widget customListTileLeading({text}) => CircleAvatar(backgroundColor: ThemeConfig.darkAccent,
  child: Text(text, style: TextStyle(color: Colors.white),),);

Widget customDateFormField() =>  DateTimeFormField(
  decoration: const InputDecoration(
    //hintStyle: TextStyle(color: Colors.black45),
    errorStyle: TextStyle(color: Colors.redAccent),
    border: OutlineInputBorder(
    ),
    suffixIcon: Icon(Icons.event_note),
    labelText: 'Exp date',
    labelStyle: TextStyle(
      color: Colors.grey,
    ),
  ),
  mode: DateTimeFieldPickerMode.date,
  autovalidateMode: AutovalidateMode.always,
  // validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
  onDateSelected: (DateTime value) {
    print(value);
  },
);

