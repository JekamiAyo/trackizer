import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackizer/api_client.dart';
import 'package:trackizer/screens/sign_up_screen.dart';
import 'package:trackizer/widgets/expense_custom_txt_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final DjangoApiClient djangoApiClient = DjangoApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
                'LOG IN',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const Text(
                'Username',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
              ExpenseCustomTxtField(
                controller: _usernameController,
                keyboardType: TextInputType.number,
                // labelText: 'Enter Username',
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
                // labelText: 'Enter Password',
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  djangoApiClient.loginUser(
                      _usernameController.text, _pwdController.text);
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
                      'Login',
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
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignUpScreen());
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
                      'Go to Sign Up',
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
