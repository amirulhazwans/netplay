import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:net_play/drawer/drawer_main.dart';
import 'package:net_play/features/user_auth/presentation/pages/home_page.dart';
import 'package:net_play/features/user_auth/presentation/pages/login_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final double iconSize;

  const CustomAppBar({Key? key, this.appBarHeight = kToolbarHeight, this.iconSize = 24.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                // Handle profile settings
              } else if (value == 'notifications') {
                // Handle notification settings
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'profile',
                child: ListTile(
                  leading: Icon(Icons.account_circle, size: iconSize),
                  title: Text('Profile'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'notifications',
                child: ListTile(
                  leading: Icon(Icons.notifications, size: iconSize),
                  title: Text('Notifications'),
                ),
              ),
              // Add more settings options as needed
            ],
            child: Icon(Icons.settings, size: iconSize),
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              Fluttertoast.showToast(
                msg: "Successfully signed out",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            icon: Icon(Icons.logout, size: iconSize),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
