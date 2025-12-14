import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';
import 'package:flutter_tasck_app/shared/widgets/custom_cached_network_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hScreen * 0.47,
      decoration: BoxDecoration(
        color: const Color(0xFFffffef),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(wScreen * 0.08),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: wScreen * 0.03),
        child: Column(
          children: [
            SizedBox(height: hScreen * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: fontSize(size: 18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
            SizedBox(height: hScreen * 0.03),

            // Product Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.category,
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: fontSize(size: 14),
                        ),
                      ),
                      SizedBox(height: hScreen * 0.005),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: fontSize(size: 24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: hScreen * 0.01),
                      Column(
                        children: [
                          Text(
                            'UNIT PRICE',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: fontSize(size: 12),
                            ),
                          ),
                          SizedBox(height: hScreen * 0.002),
                          Text(
                            '${product.price} RY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize(size: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: hScreen * 0.01),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rating',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: fontSize(size: 12),
                            ),
                          ),
                          SizedBox(height: hScreen * 0.002),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: wScreen * 0.04,
                              ),
                              SizedBox(width: wScreen * 0.01),

                              Text(
                                product.rating.toString(),
                                style: TextStyle(fontSize: fontSize(size: 14)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: wScreen * 0.5,
                  height: wScreen * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(wScreen * 0.04),
                  ),
                  child: CustomCachedNetworkImage(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                    // imageUrl:
                    //     "https://drive.google.com/file/d/1UDrTYum6Z8FCOTYsIIs7Pl0-JlRFc5s5/view?usp=drive_open",
                    imageUrl: product.images.isNotEmpty
                        ? product.images[0]
                        : 'https://via.placeholder.com/150',
                    isFit: false,
                    isDetails: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
