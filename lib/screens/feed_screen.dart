import 'package:flutter/material.dart';
//import 'package:mobile_project/services/auth_service.dart';

class FeedScreen extends StatefulWidget {
  static final String id = 'feed_screen';

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // child: FlatButton(
        //   onPressed: () => AuthService.logout(context),
        //   child: Text(
        //     "LOGOUT",
        //     style: TextStyle(color: Colors.white),
        //     ),
        // ),
      ),
    );
  }
}