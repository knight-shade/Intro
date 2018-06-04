import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'login.dart';
import 'signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => Login(),
        '/Signup': (BuildContext context) => Signup()
      },
      home: new MyHomePage(title: 'Onboarding'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Onboarding'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            CarouselSlider(
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Placeholder(),
                    );
                  },
                );
              }).toList(),
              height: 400.0,
              autoPlay: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Login');
              },
              child: Text('Login'),
              textColor: Colors.white,
              color: Color(0xFFF15093),
            ),
            Padding(padding: EdgeInsets.only(top: 24.0)),
            Text(
              'New Member?',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Signup');
                },
                child: Text(
                  'Register for an account.',
                  style: TextStyle(color: Color(0xFFF15093), fontSize: 18.0),
                ))
          ],
        ));
  }
}
