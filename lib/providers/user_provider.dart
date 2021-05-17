import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {

  final String _firebaseToken = 'AIzaSyATbx-h9KECxE5OcHRLVJt6s9IEi2n60_A';

  Future<Map<String, dynamic>> login(String email, String password) async {

    final authData = {
      'email'    : email,
      'password' : password,
      'returnSecureToken' : true
    };

    final resp = await http.post(
      Uri.parse('https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=$_firebaseToken'),
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    return (decodedResp.containsKey('idToken'))
      ? { 'ok': true, 'token': decodedResp['idToken'] }
      : { 'ok': false, 'mensaje': decodedResp['error']['message'] };
  }


  Future<Map<String, dynamic>> register(String email, String password) async {

    final authData = {
      'email'    : email,
      'password' : password,
      'returnSecureToken' : true
    };

    final resp = await http.post(
      Uri.parse('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$_firebaseToken'),
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    return (decodedResp.containsKey('idToken'))
    ? { 'ok': true, 'token': decodedResp['idToken'] }
    : { 'ok': false, 'mensaje': decodedResp['error']['message'] };
  }



}