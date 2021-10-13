import 'package:financeiro_pi/core/repositories/lista_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

/*   Future<String> _authUser(LoginData data) {
    // ignore: avoid_print
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Usuário não existente';
      }
      if (users[data.name] != data.password) {
        return 'Senha incorreta';
      }
      return "Meu pau";
    });
  } */

  Future<String> _recoverPassword(String name) {
    // ignore: avoid_print
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Usuário não existente';
      }
      return 'Erro desconhecido #0007';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      hideForgotPasswordButton: true,
      theme: LoginTheme(primaryColor: const Color(0xFF1A202E)),
      title: 'Financeiro',
      logo: 'assets/imagens/download.png',
/*       onLogin: _authUser,
      onSignup: _authUser,
 */
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      onLogin: (LoginData) {},
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      onSignup: (LoginData) {},
    );
  }
}
