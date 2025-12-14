import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';
import 'package:flutter_tasck_app/shared/widgets/custom_cached_network_image.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: hScreen * 0.02,
        left: wScreen * 0.04,
        right: wScreen * 0.04,
      ),
      child: GestureDetector(
        onTap: () {
          // Handle product card tap if needed
          // Navigation.pushNamed(context, '/productDetails', arguments: product);
          Navigator.pushNamed(
            context,
            AppRoutes.productDetails,
            arguments: product,
          );
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(wScreen * 0.03),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(wScreen * 0.0375),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.2),
              //     blurRadius: 5,
              //     offset: Offset(0, hScreen * 0.002),
              //   ),
              // ],
            ),
            child: Row(
              children: [
                Container(
                  width: wScreen * 0.15,
                  height: wScreen * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(wScreen * 0.025),
                  ),
                  child: Center(
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
                ),
                SizedBox(width: wScreen * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(size: 16),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: hScreen * 0.005),
                      Text(
                        product.description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: fontSize(size: 14),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: hScreen * 0.01),
                      Text(
                        '${product.price} RY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(size: 16),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Flexible(
                      //       child: Text(
                      //         '${product.price} RY',
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: fontSize(size: 16),
                      //         ),
                      //         maxLines: 1,
                      //         overflow: TextOverflow.ellipsis,
                      //       ),
                      //     ),
                      //     Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Icon(
                      //           Icons.star,
                      //           color: AppColor.primaryColor,
                      //           size: fontSize(size: 14),
                      //         ),
                      //         SizedBox(width: wScreen * 0.01),
                      //         Text(
                      //           '${product.rating}',
                      //           style: TextStyle(fontSize: fontSize(size: 14)),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(width: wScreen * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.primaryColor,
                          size: fontSize(size: 14),
                        ),
                        SizedBox(width: wScreen * 0.01),
                        Text(
                          '${product.rating}',
                          style: TextStyle(fontSize: fontSize(size: 14)),
                        ),
                      ],
                    ),
                    SizedBox(height: hScreen * 0.02),
                    Container(
                      width: wScreen * 0.06,
                      height: wScreen * 0.06,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColor.white,
                        size: fontSize(size: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
