import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/features/auth/cubit/login_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // الانتقال لشاشة المنتجات بعد تسجيل الدخول الناجح
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.mainScreen,
              arguments: state.user,
            );
          }

          if (state is LoginFailure) {
            // عرض رسالة الخطأ
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoginLoading,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,

                  child: Image.asset(
                    'assets/images/Pattern.png', // Replace with your background image path
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          // Logo
                          Center(
                            child: Container(
                              width: 120,
                              height: 120,

                              child: Image.asset(
                                'assets/images/logo_app.png', // Replace with your logo image path
                                width: 60,
                                height: 60,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Center(
                            child: Text(
                              'Replaced by text',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Center(
                            child: Text(
                              'Placeholder text area',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Tabs: Log In / Sign In
                          DefaultTabController(
                            length: 2,
                            child: TabBar(
                              indicatorColor: const Color(0xFFec441e),
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              tabs: const [
                                Tab(text: 'Log In'),
                                Tab(text: 'Sign In'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Email Field
                          TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            // initialValue: 'ahmed@gmail.com',
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: const Icon(Icons.visibility_off),
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            // initialValue: '******',
                          ),
                          const SizedBox(height: 16),

                          // Remember Me & Forgot Password
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (_) {}),
                              const Text('Remember Me'),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Color(0xFFec441e)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Login Button
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                //               // استدعاء دالة login من الـ Cubit
                                context.read<LoginCubit>().login(
                                  userName: username.text.trim(),
                                  password: password.text,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFec441e),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Divider
                          const Divider(height: 40, thickness: 1),

                          // Google Button
                          Container(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/google.png', // Replace with your Google logo image path
                                width: 24,
                                height: 24,
                              ),
                              label: const Text('Continue with Google'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Facebook Button
                          Container(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/facebook.png',
                                width: 24,
                                height: 24,
                              ),
                              label: const Text('Continue with Facebook'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Center(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           TextField(
          //             controller: username,
          //             decoration: InputDecoration(
          //               labelText: 'Username',
          //               border: OutlineInputBorder(),
          //             ),
          //           ),
          //           SizedBox(height: 20),
          //           TextField(
          //             controller: password,
          //             obscureText: true,
          //             decoration: InputDecoration(
          //               labelText: 'Password',
          //               border: OutlineInputBorder(),
          //             ),
          //           ),
          //           SizedBox(height: 30),
          //           ElevatedButton(
          //             onPressed: () {
          //               // استدعاء دالة login من الـ Cubit
          //               context.read<LoginCubit>().login(
          //                 userName: username.text.trim(),
          //                 password: password.text,
          //               );
          //             },
          //             child: Text("Login"),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
