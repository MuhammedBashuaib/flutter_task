import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Account Screen",
          style: TextStyle(
            fontSize: fontSize(size: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
