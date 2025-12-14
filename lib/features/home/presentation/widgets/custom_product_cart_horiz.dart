import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';
import 'package:flutter_tasck_app/shared/widgets/custom_cached_network_image.dart';

class CustomProductCartHoriz extends StatelessWidget {
  const CustomProductCartHoriz({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: wScreen * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.productDetails,
            arguments: product,
          );
        },
        child: Card(
          elevation: 4,
          child: Container(
            width: wScreen * 0.4,
            padding: EdgeInsets.all(wScreen * 0.03),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(wScreen * 0.0375),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.3),
              //     blurRadius: 5,
              //     // offset: Offset(0, hScreen * 0.002),
              //   ),
              // ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: hScreen * 0.08,
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
                SizedBox(height: hScreen * 0.008),
                Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize(size: 13),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: hScreen * 0.003),
                Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: fontSize(size: 11),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: hScreen * 0.008),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '${product.price} RY',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(size: 13),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.primaryColor,
                          size: fontSize(size: 12),
                        ),
                        SizedBox(width: wScreen * 0.01),
                        Text(
                          '${product.rating}',
                          style: TextStyle(fontSize: fontSize(size: 11)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: hScreen * 0.008),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: wScreen * 0.06,
                    height: wScreen * 0.06,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,

                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColor.white,
                      size: fontSize(size: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
