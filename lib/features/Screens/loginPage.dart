import 'package:coffe_app/bottomnBar.dart';
import 'package:coffe_app/core/utils/textStyle.dart';
import 'package:coffe_app/core/widgits/custom_bottom.dart';
import 'package:coffe_app/features/Screens/signUpPage.dart';
import 'package:coffe_app/features/auth/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();//
}

class _LoginPageState extends State<LoginPage> {
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
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Logo + Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/loginPageLogo.png', height: 60),
                      const SizedBox(width: 12),
                      Text(
                        'Login',
                        style: AppStyles.heading(context).copyWith(
                          fontSize: 40,
                          fontFamily: 'Borel',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  /// Email
                  TextFormField(
                    controller: _emailController,
                    style: AppStyles.bodyText(context),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: AppStyles.bodyText(context),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: AppStyles.bodyText(context),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: AppStyles.bodyText(context),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  /// BlocConsumer for login
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => MainLayout()),
                        );
                      } else if (state is LoginFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(

                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const CircularProgressIndicator();
                      }
                      return CustomBottom(
                        text: 'Login',
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                LoginSubmitted(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),

                                
                              );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  /// Sign up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: AppStyles.bodyText(context)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => SignUpPage()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: AppStyles.bodyText(context).copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
