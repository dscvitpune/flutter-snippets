import 'package:email_verification/src/authentication_feature/authentication_service.dart';
import 'package:email_verification/src/authentication_feature/register.dart';
import 'package:email_verification/utils/topbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
        child: SingleChildScrollView(
          child: Center(
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Login",
                          style: TextStyle(fontSize: 30),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email cannot be empty!";
                            } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return "Please enter a valid email";
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: UnderlineInputBorder(),
                          ),
                          controller: emailController,
                          autofillHints: const [AutofillHints.email],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty!";
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Passwrod",
                            prefixIcon: Icon(Icons.password),
                            border: UnderlineInputBorder(),
                          ),
                          controller: passwordController,
                          autocorrect: false,
                          obscureText: true,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AuthenticationService auth =
                                  AuthenticationService(FirebaseAuth.instance);
                              auth.signIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context);
                            }
                          },
                          label: const Text("Log In"),
                          icon: const Icon(Icons.login),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            children: <TextSpan>[
                              const TextSpan(
                                text: "Don't have an account?",
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.restorablePushNamed(
                                      context, RegistrationPage.routeName),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
