import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class imageCards extends StatefulWidget {
  const imageCards({super.key});

  @override
  State<imageCards> createState() => _imageCardsState();
}

class _imageCardsState extends State<imageCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 50,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Card(
                child: Center(child: Text("before")),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              height: 50,
              width: 150,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Card(child: Icon(Icons.add)),
              height: 50,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
