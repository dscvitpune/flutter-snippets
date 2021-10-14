import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
     return true;
    } else {
      return false;
    }
  }


  void validateAndsubmit() async{
    if (validateAndSave()) {
      try {
        UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        
      } catch (e) {
        print(e);
      }
     
      
    } else {
    }
  
    Navigator.pushNamed(context, "/home");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => (val.isEmpty) ? '*Required Filled' : null,
                      onSaved: (val) => _email = val,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 15.0
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (val) => (val.isEmpty) ? '*Required Filled' : (val.length < 6) ? 'Password too short':null,
                      onSaved: (val) => _password = val,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 15.0
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    onPressed: () {
                      validateAndSave();
                      }
                                      ,
                    child: Text('Login',
                    style: TextStyle(
                      fontSize: 20.0
                    ),),
                    color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  Text('Don\'t have an account?'),
                   SizedBox(
                      height: 10.0,
                    ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                      }
                                      ,
                    child: Text('Register',
                    style: TextStyle(
                      fontSize: 20.0
                    ),),
                    color: Colors.blue,
                    ),

                ],

              ),
            )
          )
        ),
      ),
    );
  }
}