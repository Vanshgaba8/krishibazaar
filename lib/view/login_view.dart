import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishibazaar/res/components/round_button.dart';
import 'package:krishibazaar/screens/authorisation/farmorcust.dart';
import 'package:provider/provider.dart';

import '../screens/Farmer/navbar.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth < 600 ? 400 : 500,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Section
                        Column(
                          children: [
                            const SizedBox(height: 50),
                            Image.asset(
                              'assets/images/krishi_logo.png',
                              height: constraints.maxWidth < 600 ? 200 : 250,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Welcome back User',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5D4037),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Username Field
                        TextFormField(
                          controller: _emailController,
                          focusNode: emailFocusNode,
                          decoration: InputDecoration(
                            labelText: 'Email ID',
                            prefixIcon: const Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.green[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.brown, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 101, 67, 33),
                                fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 101, 67, 33),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                                context, emailFocusNode, passwordFocusNode);
                          },
                        ),
                        const SizedBox(height: 20),
                        ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              focusNode: passwordFocusNode,
                              controller: _passwordController,
                              obscureText: _obscurePassword.value,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                filled: true,
                                fillColor: Colors.green[100],
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.brown, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                floatingLabelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 101, 67, 33),
                                    fontSize: 18),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 101, 67, 33),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    // toggle password visibility
                                    _obscurePassword.value =
                                        !_obscurePassword.value;
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        // Password Field

                        //const SizedBox(height: 10),

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // forgot password logic
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.brown),
                            ),
                          ),
                        ),

                        // Sign In Button
                        RoundButton(
                          title: "Sign In",
                          loading: authViewModel.loading,
                          onPress: () {
                            if (_emailController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  'Please enter Email', context);
                            } else if (_passwordController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  'Please enter password', context);
                            } else if (_passwordController.text.length < 6) {
                              Utils.showErrorMessage(
                                  'Length of password must be greater than 6',
                                  context);
                            } else {
                              Map<String, String> data = {
                                'email': _emailController.text.toString(),
                                'password': _passwordController.text.toString(),
                              };
                              authViewModel.loginApi(data, context);
                            }
                          },
                        ),

                        const SizedBox(height: 10),

                        // Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                // navigate to sign up
                                Navigator.pushNamed(
                                    context, RoutesName.FarmOrCust);
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
