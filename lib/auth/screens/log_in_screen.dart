import 'package:boostify_test_app/auth/auth/auth_bloc.dart';
import 'package:boostify_test_app/auth/auth/auth_event.dart';
import 'package:boostify_test_app/auth/auth/auth_state.dart';
import 'package:boostify_test_app/auth/widget/b_nav_bar.dart';
import 'package:boostify_test_app/auth/widget/custom_text_field.dart';
import 'package:boostify_test_app/auth/widget/social_login_button_for_apple.dart';
import 'package:boostify_test_app/auth/widget/social_login_button_for_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRememberMeChecked = false;
  bool _passwordHasError = false;
  String? _passwordErrorMessage;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: const Color(0xFF003366),
                  width: w,
                  height: h * 0.55,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 343,
                        height: 200,
                        child: Image.asset(
                          "assets/log_in_screen_logo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: w,
                padding: const EdgeInsets.all(16.0),
                height: 466,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailure) {
                      setState(() {
                        _passwordHasError = true;
                        _passwordErrorMessage = 'Invalid password. Try again.';
                      });
                    } else if (state is AuthSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationScreen(),
                        ),
                      );
                    }
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: _emailController,
                          labelText: 'Email or Phone number',
                          hintText: 'Input your registered email or phone',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          hintText: 'Input your password account',
                          obscureText: true,
                          hasError: _passwordHasError,
                          errorMessage: _passwordErrorMessage,
                          onVisibilityToggle: () {
                            // Clear error message when toggling visibility
                            setState(() {
                              _passwordHasError = false;
                              _passwordErrorMessage = null;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _isRememberMeChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isRememberMeChecked = value ?? false;
                                    });
                                  },
                                  activeColor: Colors.blue, // Background color when checked
                                  checkColor: Colors.white, // Tick color
                                ),
                                const Text('Remember me'),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle forgot password
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 48),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            minimumSize: Size(w, 50),
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  LoginRequested(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: buildSocialLoginButtonForGoogle(
                                assetPath: 'assets/google_icon.webp',
                                text: 'Google',
                                onPressed: () {
                                  // Handle Google login
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: SocialLoginButtonForApple(
                                icon: FontAwesomeIcons.apple,
                                text: 'Apple',
                                onPressed: () {
                                  // Handle Apple login
                                },
                                iconColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // Handle "Create Account" tap
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: "New to udrive? ",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Create Account",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
