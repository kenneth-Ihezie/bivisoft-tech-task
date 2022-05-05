import 'dart:io';

import 'package:bivisoft/Api/Api.dart';
import 'package:bivisoft/model/http_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _textControllerUserName = TextEditingController();
  var _textControllerPassword = TextEditingController();
  var result = "";



  @override
  void dispose() {
    _textControllerUserName.dispose();
    _textControllerPassword.dispose();
    result = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginUI"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),
            Text(result),
            Padding(padding: EdgeInsets.only(top: 16.0)),
            TextField(
              controller: _textControllerUserName,
              onChanged: (String text) {
                setState(() {});
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Example@gmail.com",
                  prefixIcon: Icon(
                    Icons.email,
                  )),
            ),
            TextField(
              controller: _textControllerPassword,
              onChanged: (String text) {
                setState(() {});
              },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16.0)),
            _widgetButton(_textControllerUserName.text, _textControllerPassword.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    textColor: Colors.blue,
                    color: Colors.white,
                    onPressed: null,
                    child: Text("Forgot Password?"))
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }


  Widget _widgetButton(String email, String password) {
    return RaisedButton(
        color: Colors.blue,
        onPressed: _trackButtonState() ? () => _getUserStatus(email, password) : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Login")],
          ),
        ));
  }

   _getUserStatus(String email, String password) async {
    try{
      final connection = await InternetAddress.lookup('google.com');
      if (connection.isNotEmpty && connection[0].rawAddress.isNotEmpty) {
        var api = Api();
        var response = await api.getUserStatus(email, password);
        if(response!.status == "success"){
          setState(() {
            print(response.status);
            _navigateHomeScreen();
            result = "";
          });
        } else if(response.status == "failed"){
          setState(() {
            result = "Failed to login";
          });
        }
      }
    }  on SocketException catch (_) {
      setState(() {
        result = "No Internet Connection";
      });
    }
  }

  //to navigate to the home screen
  _navigateHomeScreen() {
    Navigator.of(context).pushNamed('/homeScreen');
    setState(() {
      userName = _textControllerUserName.text;
    });
  }

  //track the state of the login button
  bool _trackButtonState() {
    bool check = false;
    setState(() {
      if (_textControllerUserName.text.length > 0 &&
          _textControllerPassword.text.length > 0) {
        check = true;
      }
    });
    return check;
  }
}
