import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class flatButton extends StatelessWidget {
  double marg;
  Widget chld;
  //Function tap;
  double het;
  double wid;
  Color clr;
  AlignmentGeometry? alig;
  flatButton(this.marg, this.wid, this.het, this.alig, this.clr,this.chld, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("tapped"),
      child: Container(
        width: wid,
        height: het,
        //padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.all(marg),
        alignment: alig,
        color: clr,
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Theme.of(context).primaryColor),
        child: Center(child: chld),
      ),
    );
  }
}
