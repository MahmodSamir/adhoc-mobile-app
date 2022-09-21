import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class addButton extends StatelessWidget {
  Color clr;
  Color icnclr;
  addButton(this.clr, this.icnclr, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      color: clr,
      child: IconButton(
        onPressed: () => print("edelo"),
        icon: const Icon(Icons.add),
        padding: EdgeInsets.all(0),
        color: icnclr,
      ),
    );
  }
}
