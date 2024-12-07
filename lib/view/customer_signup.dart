import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:krishibazaar/utils/routes/routes_name.dart';

import 'package:provider/provider.dart';
import '../res/components/generic_text_field.dart';
import '../res/components/round_button.dart';
import '../screens/authorisation/login_screen.dart';
import '../screens/Farmer/navbar.dart';
import '../utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../view_model/auth_view_model.dart';

extension StringExtensions on String {
  bool get isNumericOnly {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}

class SignUpCustomer extends StatefulWidget {
  const SignUpCustomer({super.key});

  @override
  State<SignUpCustomer> createState() => _SignUpCustomerState();
}

class _SignUpCustomerState extends State<SignUpCustomer> {
  final ValueNotifier<bool> _obscureValue = ValueNotifier<bool>(true);

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Focus Nodes
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  // File Picker variable

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneFocusNode.dispose();

    _obscureValue.dispose();

    super.dispose();
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
                            const SizedBox(height: 20),
                            Image.asset(
                              'assets/images/krishi_logo.png',
                              height: constraints.maxWidth < 600 ? 200 : 250,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Welcome Customer',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5D4037),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        GenericTextField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          nextFocusNode: _emailFocusNode,
                          labelText: "Name",
                          prefixIcon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 15),
                        // Email Field
                        GenericTextField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          nextFocusNode: _passwordFocusNode,
                          labelText: "Email ID",
                          prefixIcon: const Icon(Icons.mail),
                        ),
                        const SizedBox(height: 15),

                        // Password Field
                        ValueListenableBuilder<bool>(
                          valueListenable: _obscureValue,
                          builder: (context, obscure, child) {
                            return TextField(
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              obscureText: obscure,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                filled: true,
                                fillColor: Colors.green[100],
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.brown, width: 2),
                                  borderRadius: BorderRadius.circular(10),
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
                                  icon: Icon(obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    _obscureValue.value = !obscure;
                                  },
                                ),
                              ),
                              onSubmitted: (value) {
                                Utils.fieldFocusChange(
                                    context,
                                    _passwordFocusNode,
                                    _confirmPasswordFocusNode);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 15),

                        // Confirm Password Field
                        ValueListenableBuilder<bool>(
                          valueListenable: _obscureValue,
                          builder: (context, obscure, child) {
                            return TextField(
                              controller: _confirmPasswordController,
                              focusNode: _confirmPasswordFocusNode,
                              obscureText: obscure,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: const Icon(Icons.lock),
                                filled: true,
                                fillColor: Colors.green[100],
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.brown, width: 2),
                                  borderRadius: BorderRadius.circular(10),
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
                                  icon: Icon(obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    _obscureValue.value = !obscure;
                                  },
                                ),
                              ),
                              onSubmitted: (value) {
                                Utils.fieldFocusChange(context,
                                    _confirmPasswordFocusNode, _phoneFocusNode);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        // Phone Number Field
                        GenericTextField(
                          controller: _phoneController,
                          focusNode: _phoneFocusNode,
                          labelText: "Phone No.",
                          prefixIcon: const Icon(Icons.phone),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 15),

                        // Address Field

                        // Sign Up Button
                        RoundButton(
                          title: 'Sign Up',
                          loading: authViewModel.signUpLoading,
                          onPress: () async {
                            if (_emailController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  'Email is required', context);
                            } else if (_passwordController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  'Password is required', context);
                            } else if (_confirmPasswordController
                                .text.isEmpty) {
                              Utils.showErrorMessage(
                                  'Confirm password is required', context);
                            } else if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              Utils.showErrorMessage(
                                  'Passwords do not match', context);
                            } else if (_phoneController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  'Phone number is required', context);
                            } else if (_passwordController.text.length < 6) {
                              Utils.showErrorMessage(
                                  'Length of password must be greater than 6',
                                  context);
                            } else {
                              Map<String, String> data = {
                                "name": _nameController.text,
                                "email": _emailController.text,
                                "password": _passwordController.text,
                                "phone": _phoneController.text,
                                "role": 'user',
                              };
                              authViewModel.registerApi(data, context);
                              Utils.errorSnackBar(
                                  'A verification link has been sent to your email. Please verify to continue.',
                                  context);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.login);
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
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
