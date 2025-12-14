import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/custom_floating_action_button.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/over_view_section.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(product: product),

      body: SizedBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: hScreen * 0.2),
          child: Column(
            children: [
              // App Bar
              CustomAppBar(product: product),
              SizedBox(height: hScreen * 0.03),

              // Overview Section
              OverviewSection(product: product),
              SizedBox(height: hScreen * 0.03),

              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: AppColor.primaryColor,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[600],
                      tabs: [
                        Tab(
                          child: Text(
                            'About',
                            style: TextStyle(fontSize: fontSize(size: 14)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Reviews',
                            style: TextStyle(fontSize: fontSize(size: 14)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: hScreen * 0.02),
                  ],
                ),
              ),
              SizedBox(height: hScreen * 0.02),

              // About Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
                child: Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: fontSize(size: 14),
                  ),
                ),
              ),
              SizedBox(height: hScreen * 0.03),

              // Price & Quantity
              Padding(
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
                              decoration: BoxDecoration(
                                color: const Color(0xfffff5f5),
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
              ),
              SizedBox(height: hScreen * 0.03),

              // Total Price & Add to Cart
              SizedBox(height: hScreen * 0.12),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.all(wScreen * 0.04),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(wScreen * 0.05),
      //     ),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       _buildBottomNavItem(Icons.home, 'Home', false),
      //       _buildBottomNavItem(Icons.list_alt, 'Orders', false),
      //       _buildBottomNavItem(Icons.shopping_cart, 'Cart', true),
      //       _buildBottomNavItem(Icons.person, 'Account', false),
      //     ],
      //   ),
      // ),
    );
  }

  // Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Icon(
  //         icon,
  //         color: isSelected ? AppColor.primaryColor : Colors.grey[600],
  //         size: wScreen * 0.06,
  //       ),
  //       SizedBox(height: hScreen * 0.005),
  //       Text(
  //         label,
  //         style: TextStyle(
  //           fontSize: fontSize(size: 12),
  //           color: isSelected ? AppColor.primaryColor : Colors.grey[600],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
