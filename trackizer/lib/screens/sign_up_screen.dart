import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackizer/api_client.dart';
import 'package:trackizer/screens/login_screen.dart';
import 'package:trackizer/widgets/expense_custom_txt_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final DjangoApiClient djangoApiClient = DjangoApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SIGN UP',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const Text(
                'Email',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              ExpenseCustomTxtField(
                controller: _emailController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                'Firstname',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              ExpenseCustomTxtField(
                controller: _firstnameController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                'Lastname',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              ExpenseCustomTxtField(
                controller: _lastnameController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                'Username',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              ExpenseCustomTxtField(
                controller: _usernameController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              ExpenseCustomTxtField(
                controller: _pwdController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  djangoApiClient.registerUser(
                    {
                      "username": _usernameController.text,
                      "email": _emailController.text,
                      "first_name": _firstnameController.text,
                      "last_name": _lastnameController.text,
                      "password": _pwdController.text
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 16),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Aleady have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Go to login',
                      style: TextStyle(color: Colors.white),
                    ),
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
