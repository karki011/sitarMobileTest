import 'package:com/models/user.dart';
import 'package:com/services/database.dart';
import 'package:com/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:com/shared/constant.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  String _currentName;
  int _currentStrength;
  String _currentSugar;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); //accessing the user we received

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Upate your setting',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration.copyWith(hintText: 'name'),
                  validator: (val) => val.isEmpty ? 'Please enter your name...' : null,
                  onChanged: (val) {
                    setState(() {
                      _currentName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //dropdown for sugar
                DropdownButtonFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'sugar'),
                  value: _currentSugar ?? userData.sugar,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _currentSugar = val;
                    });
                  },
                ),
                //slider for strength
                Slider(
                  activeColor: Colors.brown[_currentStrength ?? userData.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                  min: 100,
                  max: 900,
                  value: (_currentStrength ?? userData.strength).toDouble(),
                  divisions: 8,
                  onChanged: (val) {
                    setState(() {
                      _currentStrength = val.round();
                    });
                  },
                ),
                RaisedButton(
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink[400],
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                          _currentSugar ?? userData.sugar,
                          _currentName ?? userData.name,
                          _currentStrength ?? userData.strength);
                      // shut the botton sheet
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
