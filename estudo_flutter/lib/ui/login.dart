import 'package:estudo_flutter/ui/home.dart';
import 'package:estudo_flutter/widget/custom_raisedbutton.dart';
import 'package:estudo_flutter/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _login(BuildContext context) {
    if (emailController.text.isEmpty) {
      _showSnackBar("Please, fill the e-mail field.");
    } else if (passwordController.text.isEmpty) {
      _showSnackBar("Please, fill the password field.");
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.transparent.withOpacity(0.3), BlendMode.dstATop),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[100], Colors.blue],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    controller: emailController,
                    textLabel: "E-mail",
                    textColor: Colors.white,
                    color: Colors.white,
                    cursorColor: Colors.white,
                    borderSideColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: CustomTextField(
                    controller: passwordController,
                    textLabel: "Password",
                    textColor: Colors.white,
                    color: Colors.white,
                    cursorColor: Colors.white,
                    borderSideColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: CustomRaisedButton(
                    clicked: () {
                      _login(context);
                    },
                    text: "Login",
                    buttonColor: Colors.blue[800],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
