import 'package:flutter/material.dart';
import 'dart:async';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _firstName;
  String _lastName;
  String _dateOfBirth = 'Select Date Of Birth.';
  String _email;
  String _password;

  void _submit() {}

  Future _selectDOB() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));

    if (picked != null)
      setState(() {
        _dateOfBirth = "${picked.day} / ${picked.month} / ${picked.year}";
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Not a valid first name.' : null,
                    onSaved: (val) => _firstName = val,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Not a valid last name.' : null,
                    onSaved: (val) => _email = val,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 8.0),
                    child: GestureDetector(
                      child: Text(_dateOfBirth),
                      onTap: _selectDOB,
                    ),
                  ),
                  TextFormField(
                    validator: (val) =>
                        !val.contains('@') ? 'Not a valid email.' : null,
                    onSaved: (val) => _email = val,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Not a valid password.' : null,
                    onSaved: (val) => _password = val,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  RaisedButton(
                    child: Text('Next'),
                    textColor: Colors.white,
                    color: Colors.blue[500],
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
