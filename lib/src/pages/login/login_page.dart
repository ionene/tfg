import 'package:flutter/material.dart';
import 'package:tfg_ione/preferences/main_preferences.dart';

import 'package:tfg_ione/src/widgets/myAppBar.dart';
import 'package:tfg_ione/src/widgets/myButton.dart';

import 'package:tfg_ione/providers/user_provider.dart';

import 'package:tfg_ione/src/models/user_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserProvider userProvider = new UserProvider();

  UserModel user = new UserModel();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Login',
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: _loginForm(context),
      ),
    );
  }

  Column _loginForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _emailTextField(),
                _passwordTextField(),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _loginButton(context),
            _registerButton(context),
          ],
        ),
      ],
    );
  }

  Container _emailTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: _validateEmail,
        decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico'),
        onChanged: (value) => user.email = value,
      ),
    );
  }

  Container _passwordTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        obscureText: true,
        validator: _validatePassword,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
          labelText: 'Contraseña',
        ),
        onChanged: (value) => user.password = value,
      ),
    );
  }

  Container _loginButton(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => _login(context),
        child: MyButton(
          text: 'Iniciar Sesión',
          size: 0.4,
          icon: Icons.login,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Container _registerButton(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => _register(context),
        child: MyButton(
          text: 'Registrarse',
          size: 0.4,
          icon: Icons.account_circle,
          color: Colors.indigo,
        ),
      ),
    );
  }

  void _register(BuildContext context) async {
    if (!_formKey.currentState.validate()) return;

    Map resp = await userProvider.register(user.email, user.password);

    (resp['ok'])
        ? Navigator.pushReplacementNamed(context, 'home')
        : _showError(
            context, 'Error al registrarse', 'Ha ocurrido un error inesperado');
  }

  void _login(BuildContext context) async {
    final _prefs = MainPreferences();

    if (!_formKey.currentState.validate()) return;

    Map resp = await userProvider.login(user.email, user.password);

    if (resp['ok']) _prefs.initialPage = 'home';

    (resp['ok'])
        ? Navigator.pushReplacementNamed(context, 'home')
        : _showError(context, 'Error validación',
            'El usuario o contraseña no es correcto');
  }

  String _validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = new RegExp(pattern);

    return (!regex.hasMatch(value) || value == null)
        ? 'Introduce un correo válido'
        : null;
  }

  String _validatePassword(String value) {
    return (value.length < 6 || value == null)
        ? 'La contraseña tiene que tener al menos 6 carácteres'
        : null;
  }

  _showError(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              IconButton(
                icon: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
