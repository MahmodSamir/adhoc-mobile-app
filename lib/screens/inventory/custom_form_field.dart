import 'package:flutter/material.dart';

import '../../shared/styles/theme_config.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final Function onSaved;
  final Function validator;

  CustomTextFormField({this.title = 'title', required this.onSaved, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(

        child: TextFormField(
          onSaved: (_)=> onSaved,
          validator: (v)=> validator(v),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(

            labelText: title,
            labelStyle: TextStyle(
              color: Colors.grey,
            ),


            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: ThemeConfig.lightAccent,
                width: 1.5

              ),
            ),


            contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                //gapPadding: 10.0,
                borderRadius: BorderRadius.circular(5.0),

              ),


          ),
        ),
    );
  }
}