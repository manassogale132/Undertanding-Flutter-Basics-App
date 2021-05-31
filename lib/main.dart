// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:developer';

import 'package:form_field_validator/form_field_validator.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> signFormKey = GlobalKey<FormState>();
  bool _securePasswordText = true;

  void validate() {
    if(signFormKey.currentState.validate()){
      print('Validated');
      final ScaffoldMessengerState scaffoldMessenger =
      ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text('Successfully signed-in.')));
    }
    else {
      print('Not Validated');
      final ScaffoldMessengerState scaffoldMessenger =
      ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text('Please enter details again.')));
    }
  }

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Forgot Password?'),
            content: TextField(
              decoration: InputDecoration(hintText: 'Enter emaid id...'),
              controller: customController,
            ),
            actions: [
              MaterialButton(
                elevation: 5.0,
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  //Navigator.of(context).pop(customController.text.toString());
                  Navigator.of(context).pop();
                  final ScaffoldMessengerState scaffoldMessenger =
                      ScaffoldMessenger.of(context);
                  scaffoldMessenger.showSnackBar(const SnackBar(
                      content: Text('Email to reset password sent.')));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login App',
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: signFormKey,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Login here.',
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.2,
                      fontFamily: 'Oswald',
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator(
                    [
                      EmailValidator(errorText: 'Not a valid email id'),
                      RequiredValidator(errorText: 'Required*')
                    ]
                  ),
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email Id',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'Required*'),
                      MinLengthValidator(6, errorText: 'should be atleast 6 chatacters'),
                      MaxLengthValidator(15, errorText: 'should not be greater that 15 characters')
                    ]
                  ),
                  obscureText: _securePasswordText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.password,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          _securePasswordText = !_securePasswordText;
                        });
                      },
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    createAlertDialog(context);
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: ElevatedButton(
                  onPressed: validate,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Text(
                      ' - - - - - - - - ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      ' - - - - - - - - ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                margin: EdgeInsets.only(top: 55.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.white,),
                  label: Text(
                    'Sign In With Google',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void validate() {
    if (signUpFormKey.currentState.validate()) {
      print('Validated');
      final ScaffoldMessengerState scaffoldMessenger =
      ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text('Successfully signed-up.')));
    }
    else {
      print('Not Validated');
      final ScaffoldMessengerState scaffoldMessenger =
      ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text('Please enter details again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login App',
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: signUpFormKey,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'SignUp here.',
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.2,
                      fontFamily: 'Oswald',
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Required*'),
                        MinLengthValidator(6, errorText: 'should be atleast 6 chatacters'),
                        MaxLengthValidator(10, errorText: 'should not be greater that 10 characters')
                      ]
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter username...',
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter email id...',
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email Id',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter password...',
                    prefixIcon: Icon(
                      Icons.password,
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter phone number...',
                    prefixIcon: Icon(
                      Icons.phone_android,
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                margin: EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: validate,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

