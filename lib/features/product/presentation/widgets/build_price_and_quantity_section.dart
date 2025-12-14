import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class BuildPriceAndQuantitySection extends StatelessWidget {
  const BuildPriceAndQuantitySection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unit Price',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: fontSize(size: 12),
                ),
              ),
              SizedBox(height: hScreen * 0.005),
              Text(
                '${product.price} RY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize(size: 18),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Minimum Order',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: fontSize(size: 12),
                ),
              ),
              SizedBox(height: hScreen * 0.005),
              Row(
                children: [
                  Container(
                    width: wScreen * 0.08,
                    height: wScreen * 0.08,
                    decoration: const BoxDecoration(
                      color: Color(0xfffff5f5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '---',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: fontSize(size: 12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: wScreen * 0.02),
                  Text(
                    '2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize(size: 14),
                    ),
                  ),
                  SizedBox(width: wScreen * 0.02),
                  Container(
                    width: wScreen * 0.08,
                    height: wScreen * 0.08,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize(size: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
