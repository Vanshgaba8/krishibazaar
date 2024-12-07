import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import '../res/components/generic_text_field.dart';
import '../res/components/round_button.dart';
import '../screens/authorisation/login_screen.dart';
import '../screens/Farmer/navbar.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../view_model/auth_view_model.dart';

extension StringExtensions on String {
  bool get isNumericOnly {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}

class SignUpFarmer extends StatefulWidget {
  const SignUpFarmer({super.key});

  @override
  State<SignUpFarmer> createState() => _SignUpFarmerState();
}

class _SignUpFarmerState extends State<SignUpFarmer> {
  final ValueNotifier<bool> _obscureValue = ValueNotifier<bool>(true);

  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // Focus Nodes
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  // File Picker variable
  String? _selectedFile;

  // Dropdown value
  String? _selectedDropdownValue;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();

    _obscureValue.dispose();

    super.dispose();
  }

  Future<void> _pickFile() async {
    // Check and request storage permission
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      // Permission granted, proceed with file picker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'], // Only allow PDF files
      );

      if (result != null) {
        setState(() {
          _selectedFile = result.files.single.path;
        });
        Utils.showSuccessMessage(
            "Selected PDF: ${result.files.single.name} at ${result.files.single.path}",
            context);
      } else {
        setState(() {
          _selectedFile = null;
        });
        Utils.showErrorMessage("No file selected", context);
      }
    } else if (status.isDenied) {
      // Permission denied, show error
      Utils.showErrorMessage("Storage permission denied", context);
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, open app settings
      Utils.showErrorMessage(
          "Storage permission permanently denied. Please enable it in settings.",
          context);
      openAppSettings();
    }
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
                              'Welcome Farmer',
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
                          nextFocusNode: _addressFocusNode,
                          labelText: "Phone No.",
                          prefixIcon: const Icon(Icons.phone),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 15),

                        // Address Field
                        GenericTextField(
                          controller: _addressController,
                          focusNode: _addressFocusNode,
                          labelText: "Address",
                          prefixIcon: const Icon(Icons.location_city),
                        ),
                        const SizedBox(height: 15),

                        // Dropdown for Document Type
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Select Document Type',
                            prefixIcon: const Icon(Icons.file_copy),
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
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: 'Income Certificate',
                                child: Text('Income Certificate')),
                            DropdownMenuItem(
                                value: 'Kisan Credit Card',
                                child: Text('Kisan Credit Card')),
                            DropdownMenuItem(
                                value: 'Aadhar Card',
                                child: Text('Aadhar Card')),
                            DropdownMenuItem(
                                value: 'Land Record',
                                child: Text('Land Record')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedDropdownValue = value;
                            });
                          },
                          value: _selectedDropdownValue,
                        ),
                        const SizedBox(height: 15),

                        // Upload Document Button
                        GestureDetector(
                          onTap: _pickFile,
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFFf29716), width: 2.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_selectedFile == null
                                    ? "Upload document"
                                    : "File selected"),
                                const SizedBox(width: 10),
                                const Icon(Icons.upload_file),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Sign Up Button
                        RoundButton(
                          title: "Sign Up",
                          loading: authViewModel.signUpLoading,
                          onPress: () {
                            if (_emailController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  "Please Enter Email ID", context);
                            } else if (_passwordController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  "Please Enter Password", context);
                            } else if (_confirmPasswordController
                                .text.isEmpty) {
                              Utils.showErrorMessage(
                                  "Please Confirm Password", context);
                            } else if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              Utils.showErrorMessage(
                                  "Passwords do not match", context);
                            } else if (_phoneController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  "Please Enter Phone Number", context);
                            } else if (_addressController.text.isEmpty) {
                              Utils.showErrorMessage(
                                  "Please Enter Address", context);
                            } else if (_selectedDropdownValue == null) {
                              Utils.showErrorMessage(
                                  "Please Select Document Type", context);
                            } else if (_selectedFile == null) {
                              Utils.showErrorMessage(
                                  "Please Upload Document", context);
                            } else if (_passwordController.text.length < 6) {
                              Utils.showErrorMessage(
                                  'Length of password must be greater than 6',
                                  context);
                            } else {
                              // Perform Sign Up Action
                              Map<String, String> data = {
                                "name": _nameController.text,
                                "email": _emailController.text,
                                "password": _passwordController.text,
                                "phone": _phoneController.text,
                                "address": _addressController.text,
                                "role": 'admin',
                              };
                              authViewModel.registerApi(data, context);
                              Utils.errorSnackBar(
                                  'A verification link has been sent to your email. Please verify to continue.',
                                  context);
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        // Redirect to Login Screen
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
