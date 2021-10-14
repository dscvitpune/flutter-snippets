import 'package:email_verification/src/authentication_feature/authentication_service.dart';
import 'package:email_verification/utils/topbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  static const routeName = '/register';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? error;
  String? confirmPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Register"),
        context: context,
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
                          "Register",
                          style: TextStyle(fontSize: 30),
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username cannot be empty!";
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
                            controller: emailController),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            confirmPass = value;
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.password),
                            border: UnderlineInputBorder(),
                          ),
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value != confirmPass) {
                              return "Passwords must match";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon: Icon(Icons.verified),
                            border: UnderlineInputBorder(),
                          ),
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              error = null;
                              AuthenticationService auth =
                                  AuthenticationService(FirebaseAuth.instance);
                              auth.signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context
                              ).then((String e) => error = e);
                              if (error != null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(error!),
                                ));
                              }
                            }
                          },
                          label: const Text("Register"),
                          icon: const Icon(Icons.verified_user_outlined),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            children: <TextSpan>[
                              const TextSpan(
                                text: "Already have an account?",
                              ),
                              TextSpan(
                                text: "Sign In",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.pop(context),
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
