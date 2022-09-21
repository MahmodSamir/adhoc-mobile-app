import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/theme_config.dart';

class TimelineCard extends StatelessWidget {
  String userName;
  String companyName;
  String time;
  String workingHours;
  Function onTap;
  TimelineCard({this.userName = "Weaam Mohamed",
    this.companyName = "Adhoc company",
    this.time = '03:40 pm', this.workingHours = '00:07:26', required this.onTap });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap,
      child: Card(
        child: Column(
          children: [
            ListTile(
              //todo: if user has profile image show it instead of first letter
              leading: customListTileLeading(text: userName[0]),
              title: Row(
                children: [
                  Text(userName),
                  Spacer(),
                  Text(time, style: TextStyle(fontSize: 12 ),),
                  SizedBox(width: 5,),
                  Text(workingHours, style:TextStyle(color:ThemeConfig.darkAccent, fontSize: 12 ), ),
                  SizedBox(width: 3,),
                  Icon(Icons.location_on_outlined, color: ThemeConfig.darkAccent, size: 20,)

                ],
              ),
              subtitle: Text(companyName, style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,),
              child: Text("No activites.", style: TextStyle(color: Colors.grey, fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }
}
