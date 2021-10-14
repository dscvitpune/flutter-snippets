
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email;
  String _password;
  final _formKey1 = GlobalKey<FormState>();





Future<void> verify() async {
  User user = FirebaseAuth.instance.currentUser;
Navigator.pushNamed(context, "/home");
if (!user.emailVerified) {
  await user.sendEmailVerification(
    
  );

  
}

// Get the code from the email:
String code = 'xxxxxxx';

try {
  await FirebaseAuth.instance.checkActionCode(code);
  await FirebaseAuth.instance.applyActionCode(code);
    Navigator.pushNamed(context, "/home");

  // If successful, reload the user:
  FirebaseAuth.instance.currentUser.reload();
} on FirebaseAuthException catch (e) {
  if (e.code == 'invalid-action-code') {
    print('The code is invalid.');
  }
}
}

  bool validateAndSave() {
    final form = _formKey1.currentState;
    if (form.validate()) {
     return true;
    } else {
      return false;
    }
  }

  void validateAndsubmit() async{
    if (validateAndSave()) {
      try {
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        
        
      } catch (e) {
        print(e);
      }
     
      
    } else {
    }
    verify();
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey1,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
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
                      validateAndsubmit();
                      }
                                      ,
                    child: Text('Register',
                    style: TextStyle(
                      fontSize: 20.0
                    ),),
                    color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  Text('Have an account?'),
                   SizedBox(
                      height: 10.0,
                    ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                      }
                                      ,
                    child: Text('Login',
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