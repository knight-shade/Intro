import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
    }

    _performLogin();
  }

  void _performLogin() {
    final snackbar = SnackBar(
      content: Text('Email $_email, password: $_password.'),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
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
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0),
            ),
            RaisedButton(
              child: Text('LOGIN'),
              textColor: Colors.white,
              color: Colors.blue[500],
              onPressed: _submit,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
            GestureDetector(
                child: Text(
              'Forgot Password?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue[500],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
