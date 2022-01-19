// ignore_for_file: prefer_const_constructors, avoid_print, prefer_final_fields, use_key_in_widget_constructors, file_names, constant_identifier_names

import 'package:flutter/material.dart';

import 'Drower1.dart';

class MyHeroanimation extends StatefulWidget {
  @override
  _MyHeroanimationState createState() => _MyHeroanimationState();
}

enum AuthMode { SignUp, Login }

class _MyHeroanimationState extends State<MyHeroanimation>
    with SingleTickerProviderStateMixin {
  bool swichVal = true;
  ThemeMode tm = ThemeMode.light;

  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  final _passwordController = TextEditingController();

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  /////////////
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }
  @override
  void dispose() { 
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: tm,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBarFun(),
        drawer: Mydrower(),
         body: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            elevation: 8,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _authMode == AuthMode.SignUp ? 400 : 300,
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "E-Mail"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isEmpty || !val.contains('@')) {
                            return "Invalid email!";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _authData['password'] = val!;
                          print(_authData['password']);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        controller: _passwordController,
                        obscureText: true,
                        validator: (val) {
                          if (val!.isEmpty || val.length <= 5) {
                            return "Password is too short!";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _authData['email'] = val!;
                          print(_authData['email']);
                        },
                      ),

                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        constraints: BoxConstraints(
                          minHeight:_authMode == AuthMode.SignUp?60:0 ,
                          maxHeight: _authMode == AuthMode.SignUp?120:0,),

                        child: FadeTransition(
                          opacity: _animation,
                          child: TextFormField(
                            enabled: _authMode == AuthMode.SignUp,
                            decoration:
                                InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: _authMode == AuthMode.SignUp
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match!';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        child: Text(
                            _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                        onPressed: _submit,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        color: Theme.of(context).primaryColor,
                        textColor:
                            Theme.of(context).primaryTextTheme.button?.color,
                      ),
                      FlatButton(
                        child: Text(
                            '${_authMode == AuthMode.Login ? 'SIGN UP' : 'LOGIN'} INSTEAD'),
                        onPressed: _switchAuthMode,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar AppBarFun() {
    return AppBar(
      actions: [
        Switch(
            value: swichVal,
            onChanged: (val) {
              setState(() {
                swichVal = val;
                tm = swichVal == true ? ThemeMode.light : ThemeMode.dark;
              });
            })
      ],
      title: const Text("HeroAnimation"),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState?.save();
    if (_authMode == AuthMode.Login) {
      // Log user in
    } else {
      // Sign user up
    }
  }
}
