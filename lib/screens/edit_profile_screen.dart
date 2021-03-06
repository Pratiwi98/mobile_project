import 'package:flutter/material.dart';
import 'package:mobile_project/models/user_model.dart';
import 'package:mobile_project/services/database_service.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bio = '';

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }

_submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      //Update user database
      String _profileImageUrl = '';
      User user = User(
          id: widget.user.id,
          name: _name, 
          profileImageUrl: _profileImageUrl,
          bio: _bio,  
      );
    //Database Update
     DatabaseService.updateUser(user);
     Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Edit Profil",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png'),
                  ),
                  FlatButton(
                    onPressed: () => print("Change Profile Image"),
                    child: Text(
                      "Change Profile Image",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    initialValue: _name,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      labelText: "Name",
                    ),
                    validator: (input) => input.trim().length < 1 ? 'Silahkan Masukkan Nama yang Benar': null,
                    onSaved: (input) => _name = input,
                  ),
                  TextFormField(
                    initialValue: _bio,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.book,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      labelText: "Bio",
                    ),  
                    validator: (input) => input.trim().length > 150 ? 'Silahkan Masukkan Bio Kurang dari 150 Karakter': null,
                    onSaved: (input) => _bio = input,
                  ),
                  Container(
                    margin: EdgeInsets.all(40.0),
                    height: 40.0,
                    width: 250.0,
                    child: FlatButton(
                      onPressed: () {
                        _submit();
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "Simpan Profile",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
