import 'package:e_commerce_project/screens/navigation_screen.dart';
import 'package:e_commerce_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

 // TODO : Implement login and signup

enum AuthMode { logIn, signUp }

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  final Map<String?, String?> _authData = {'email': '', 'password': ''};

  final _passwordController = TextEditingController();

  AuthMode _authMode = AuthMode.logIn;

  var _isLoading = true;


  void _submit() {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.logIn) {
      // Log user in
    } else {
      // Sign user up
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.logIn) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.logIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + mediaQueryData.viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_authMode == AuthMode.logIn)
                  SizedBox(
                      height: mediaQueryData.size.height * 0.4,
                      child: Image.asset(
                        'assets/images/veg.jpg',
                        fit: BoxFit.cover,
                      )),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'Email',
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Email is not valid';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),
                        CustomTextField(
                          label: 'Password',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password must be of 8 characters';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          onSaved: (value) {
                            _authData['password'] = value;
                          },
                        ),
                        if (_authMode == AuthMode.signUp)
                          CustomTextField(
                            label: 'Confirm Password',
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Password does not match';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                      ],
                    )),
                const SizedBox(height: 30),
                Column(
                  verticalDirection: _authMode == AuthMode.logIn
                      ? VerticalDirection.down
                      : VerticalDirection.up,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: _authMode == AuthMode.signUp
                          ? _switchAuthMode
                          : () {
                              Navigator.of(context).pushReplacementNamed(NavigationScreen.routeName);
                            },
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 15))),
                      child: Text(_authMode == AuthMode.logIn
                          ? 'LOG IN'
                          : 'LOG IN INSTEAD'),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: _authMode == AuthMode.signUp
                          ? () {}
                          : _switchAuthMode,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orange[800]),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 15))),
                      child: const Text('SIGN UP'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
