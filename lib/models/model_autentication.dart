import 'package:flutter/material.dart';

class  ModelAutentication extends ChangeNotifier{
  bool _isLogin = false;

  bool get isLogin {
    return _isLogin;
  }
  //se logar atualiza o stado
  void loginSuccess(){
    _isLogin = true;
    notifyListeners();
  }
}