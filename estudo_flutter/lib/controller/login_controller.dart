import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginController extends InheritedWidget{
//  final Widget child;
//  LoginController(this.child): super(child: child);

  final BehaviorSubject<String> _streamController = BehaviorSubject.seeded("");
  Sink<String> get emailInput => _streamController.sink;
  Stream<String> get emailStream => _streamController.stream;

  static LoginController of(BuildContext context){
    return context.inheritFromWidgetOfExactType(LoginController) as LoginController;
  }


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }

}