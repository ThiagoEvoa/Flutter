import 'package:estudo_flutter/controller/login_controller.dart';
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
                    inputType: TextInputType.emailAddress,
                    textLabel: "E-mail",
                    textColor: Colors.white,
                    color: Colors.white,
                    cursorColor: Colors.white,
                    borderSideColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    controller: passwordController,
                    inputType: TextInputType.number,
                    password: true,
                    textLabel: "Password",
                    textColor: Colors.white,
                    color: Colors.white,
                    cursorColor: Colors.white,
                    borderSideColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        LoginController(_scaffoldKey).resetPassword(context, emailController.text);
                      },
                      child: Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: CustomRaisedButton(
                    clicked: () {
                      LoginController(_scaffoldKey).login(context, emailController.text, passwordController.text);
                    },
                    text: "Login",
                    buttonColor: Colors.blue[800],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      LoginController(_scaffoldKey).signUp(context, emailController.text, passwordController.text);
                    },
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
