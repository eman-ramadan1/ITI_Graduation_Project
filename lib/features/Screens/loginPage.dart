import 'package:coffe_app/core/utils/appColor.dart';
import 'package:coffe_app/core/utils/textStyle.dart';
import 'package:coffe_app/core/widgits/custom_bottom.dart';
import 'package:coffe_app/features/Screens/signUpPage.dart';
import 'package:coffe_app/features/auth/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: BlocConsumer<LoginBloc, LoginState>(
                //
                listener: (context, state) {
                  if (state is LoginLoadingState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logging in...')),
                    );
                  } else if (state is LoginSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Welcome ${state.email}')),
                    );
                  } else if (state is LoginFailureState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          SizedBox(width: 60),
                          Image.asset('assets/loginPageLogo.png'),

                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              'login',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                                fontFamily: 'Borel',
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      CustomBottom(
                        text: 'Login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                              LoginSubmitted(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?', style: AppStyles.bodyText),
                          TextButton(
                            onPressed: () {
                              // Navigate to Sign Up page
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => SignUpPage(),////
                              ));
                            },
                            child: Text('Sign Up', style: AppStyles.bodyText),
                          ),
                        ],
                      ),

                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}













                      // Login Button
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: AppColors.primary,
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 40, vertical: 12),
                      //   ),
                      //   onPressed: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       context.read<LoginBloc>().add(
                      //             LoginSubmitted(
                      //               email: _emailController.text.trim(),
                      //               password: _passwordController.text.trim(),
                      //             ),
                      //           );
                      //     }
                      //   },
                      //   child: const Text(
                      //     'Login',
                      //     style: TextStyle(fontSize: 16, color: Colors.white),
                      //   ),
                      // ),