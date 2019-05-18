import 'package:flutter/material.dart';
import 'package:estudo_flutter/util/user_firebase.dart';
import 'package:estudo_flutter/ui/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  GlobalKey<ScaffoldState> _scaffoldKey;
  SharedPreferences prefs;

  LoginController(GlobalKey<ScaffoldState> scaffoldKey){
    _scaffoldKey = scaffoldKey;
    _getSharedPreferences();
  } 

  _getSharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
  }

  login(BuildContext context, String email, String password) {
    if (_isValidForm(email, password)) {
      UserFirebase().signWithCredentials(email, password).catchError((error) {
        _showSnackBar(error.toString());
      }).then((result) {
        if (result != null) {
          prefs.setBool("isLogged", true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      });
    }
  }

  signUp(BuildContext context, String email, String password) {
    if (_isValidForm(email, password)) {
      UserFirebase()
          .signUp(email: email, password: password)
          .catchError((error) {
        _showSnackBar(error.toString());
      }).then((result) {
        if (result != null) {
          prefs.setBool("isLogged", true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      });
    }
  }

  resetPassword(BuildContext context, String email) {
    if (email.isEmpty) {
      _showSnackBar("Please, fill the e-mail field.");
    } else {
      UserFirebase().resetPassword(email: email);
      _showSnackBar("Check your e-mail to reset password.");
    }
  }

  bool _isValidForm(String email, String password) {
    if (email.isEmpty) {
      _showSnackBar("Please, fill the e-mail field.");
      return false;
    } else if (password.isEmpty) {
      _showSnackBar("Please, fill the password field.");
      return false;
    }
    return true;
  }

  _showSnackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue[800]),
      ),
      duration: Duration(seconds: 3),
    ));
  }
}
