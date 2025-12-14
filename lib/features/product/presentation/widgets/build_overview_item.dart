import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class BuildOverviewItem extends StatelessWidget {
  final IconData icon;
  final String des;
  final String label;
  const BuildOverviewItem({
    super.key,
    required this.icon,
    required this.des,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[600], size: wScreen * 0.06),
        SizedBox(height: hScreen * 0.005),
        Text(
          des,
          style: TextStyle(
            fontSize: fontSize(size: 12),
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: hScreen * 0.005),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize(size: 12),
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
