import 'package:flutter/material.dart';
import 'package:mobile_project/models/user_model.dart';

class EditProfilScreen extends StatefulWidget {

  final User user;

  EditProfilScreen({this.user});

  @override
  _EditProfilScreenState createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Edit Profil")),
    );
  }
}