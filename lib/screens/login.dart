import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'home/home_screen.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScrean extends StatelessWidget {
  const LoginScrean({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    // ignore: avoid_print
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return 'Meu Pau';
    });
  }

  Future<String> _recoverPassword(String name) {
    // ignore: avoid_print
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'Meu Pau';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      /* theme: , */
      title: 'Financeiro',
      logo: 'assets/imagens/download.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
