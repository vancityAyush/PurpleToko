import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:purple_toko/constants.dart';
import 'package:purple_toko/main.dart';
import 'package:purple_toko/models/response/login_response.dart';
import 'package:purple_toko/services/networking.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passworrdController = TextEditingController();
  RoundedLoadingButtonController loginButtonController =
      RoundedLoadingButtonController();
  bool isVisible = false;
  UserType _usertype = UserType.user;
  NetworkHelper networkHelper = getIt<NetworkHelper>();

  void login() async {
    loginButtonController.start();
    LoginResponse loginResponse = await networkHelper.login(
        _emailController.text, _passworrdController.text, UserMap[_usertype]!);
    if (loginResponse.error_code == 1) {
      loginButtonController.success();
    } else {
      loginButtonController.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loginResponse.response_string),
        ),
      );
    }
    Future.delayed(Duration(seconds: 1), () => loginButtonController.reset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Image.network(
                    "https://firebase.google.com/downloads/brand-guidelines/PNG/logo-vertical.png",
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            kTextFieldDecoration.copyWith(labelText: 'Email'),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: !isVisible,
                        controller: _passworrdController,
                        decoration: kTextFieldDecoration.copyWith(
                          labelText: 'Password',
                          suffixIcon: InkWell(
                            child: Icon(isVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: RadioListTile<UserType>(
                              title: Text('User'),
                              value: UserType.user,
                              groupValue: _usertype,
                              onChanged: (value) {
                                setState(() {
                                  _usertype = UserType.user;
                                });
                              },
                            ),
                          ),
                          Flexible(
                            child: RadioListTile<UserType>(
                              title: Text('Bussiness'),
                              value: UserType.bussiness,
                              groupValue: _usertype,
                              onChanged: (value) {
                                setState(() {
                                  _usertype = UserType.bussiness;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: const InkWell(
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                RoundedLoadingButton(
                  controller: loginButtonController,
                  onPressed: login,
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account ?',
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
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
