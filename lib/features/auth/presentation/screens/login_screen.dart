import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/features/auth/cubit/login_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

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
    initializeHWFSize(context);

    return Scaffold(
      backgroundColor: AppColor.white,
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
                backgroundColor: AppColor.red,
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
                  height: hScreen * 0.25,
                  child: Image.asset(
                    'assets/images/Pattern.png', // Replace with your background image path
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(wScreen * 0.06),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: hScreen * 0.05),
                          // Logo
                          Center(
                            child: Container(
                              width: wScreen * 0.30,
                              height: wScreen * 0.30,
                              child: Image.asset(
                                'assets/images/logo_app.png', // Replace with your logo image path
                                width: wScreen * 0.15,
                                height: wScreen * 0.15,
                              ),
                            ),
                          ),
                          SizedBox(height: hScreen * 0.03),
                          Center(
                            child: Text(
                              'Replaced by text',
                              style: TextStyle(
                                fontSize: fontSize(size: 24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: hScreen * 0.01),
                          Center(
                            child: Text(
                              'Placeholder text area',
                              style: TextStyle(
                                fontSize: fontSize(size: 14),
                                color: AppColor.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: hScreen * 0.04),

                          // Tabs: Log In / Sign In
                          DefaultTabController(
                            length: 2,
                            child: TabBar(
                              indicatorColor: AppColor.primaryColor,
                              labelColor: AppColor.black,
                              unselectedLabelColor: AppColor.grey,
                              tabs: const [
                                Tab(text: 'Log In'),
                                Tab(text: 'Sign In'),
                              ],
                            ),
                          ),
                          SizedBox(height: hScreen * 0.03),

                          // Email Field
                          TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  wScreen * 0.02,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: wScreen * 0.04,
                                vertical: hScreen * 0.02,
                              ),
                            ),
                            style: TextStyle(fontSize: fontSize(size: 16)),
                            // initialValue: 'ahmed@gmail.com',
                          ),
                          SizedBox(height: hScreen * 0.02),

                          // Password Field
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: const Icon(Icons.visibility_off),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  wScreen * 0.02,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: wScreen * 0.04,
                                vertical: hScreen * 0.02,
                              ),
                            ),
                            obscureText: true,
                            style: TextStyle(fontSize: fontSize(size: 16)),
                            // initialValue: '******',
                          ),
                          SizedBox(height: hScreen * 0.02),

                          // Remember Me & Forgot Password
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (_) {}),
                              Text(
                                'Remember Me',
                                style: TextStyle(fontSize: fontSize(size: 14)),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: fontSize(size: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: hScreen * 0.03),

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
                                backgroundColor: AppColor.primaryColor,
                                padding: EdgeInsets.symmetric(
                                  vertical: hScreen * 0.02,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    wScreen * 0.075,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: fontSize(size: 18),
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: hScreen * 0.03),

                          // Divider
                          Divider(height: hScreen * 0.05, thickness: 1),

                          SizedBox(height: hScreen * 0.02),

                          // Google Button
                          Container(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/google.png', // Replace with your Google logo image path
                                width: wScreen * 0.06,
                                height: wScreen * 0.06,
                              ),
                              label: Text(
                                'Continue with Google',
                                style: TextStyle(fontSize: fontSize(size: 16)),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.white,
                                foregroundColor: AppColor.black,
                                padding: EdgeInsets.symmetric(
                                  vertical: hScreen * 0.02,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    wScreen * 0.075,
                                  ),
                                  side: BorderSide(color: AppColor.grey300),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: hScreen * 0.02),

                          // Facebook Button
                          Container(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/facebook.png',
                                width: wScreen * 0.06,
                                height: wScreen * 0.06,
                              ),
                              label: Text(
                                'Continue with Facebook',
                                style: TextStyle(fontSize: fontSize(size: 16)),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.white,
                                foregroundColor: AppColor.black,
                                padding: EdgeInsets.symmetric(
                                  vertical: hScreen * 0.02,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    wScreen * 0.075,
                                  ),
                                  side: BorderSide(color: AppColor.grey300),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: hScreen * 0.025),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
