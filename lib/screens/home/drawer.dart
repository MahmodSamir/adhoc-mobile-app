import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String email;
  const CustomDrawer({this.imageUrl = 'https://images.squarespace-cdn.com/content/v1/5489bd9ae4b08b416ef124ea/1551796492448-G53ZGIG9MD8JBDP34A19/placeholder.png',
    this.userName = 'Weaam Mohamed',
    this.email = 'weaam.mohamed87@gmail.com'
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountName: Text(userName, style: TextStyle(color: Colors.black),),
            accountEmail: Text(email, style: TextStyle(color: Colors.black),),
          currentAccountPicture: new CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage(imageUrl ),

          ),),


          _drawerTile(text: 'Home', icon: Icons.home, onTap: (){}),
          _drawerTile(text: 'Timeline', icon: Icons.timeline, onTap: (){}),
          _drawerTile(text: 'Calendar', icon: Icons.edit_calendar, onTap: (){}),
          _drawerTile(text: 'Reports', icon: Icons.report_gmailerrorred_sharp, onTap: (){}),
          _drawerTile(text: 'Catalog', icon: Icons.home, onTap: (){}),
          _drawerTile(text: 'Sales', icon: Icons.sd_card_alert_sharp, onTap: (){}),
          _drawerTile(text: 'Unsynced requests', icon: Icons.sync, onTap: (){}),
          Divider(
            thickness: 1,
          ),
          _drawerTile(text: 'Settings', icon: Icons.settings, onTap: (){}),
          _drawerTile(text: 'Logout', icon: Icons.logout, onTap: (){}),


        ],
      ),
    );
  }
}



Widget _drawerTile({icon, text, onTap}) => Column(
  children: [
    ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap
    ),

  ],
);