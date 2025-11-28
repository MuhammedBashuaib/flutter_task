import 'package:flutter/material.dart';

import 'package:flutter_tasck_app/shared/utils/sizes.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/home_header.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/exclusive_offers_section.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/latest_products_section.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/popular_products_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Content
          CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              // Header with Location & Search (on top of background)
              const HomeHeader(),

              // White Container with rounded top corners
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(wScreen * 0.08),
                      topRight: Radius.circular(wScreen * 0.08),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Exclusive Offers Banner
                      const ExclusiveOffersSection(),

                      // Spacing
                      SizedBox(height: hScreen * 0.03),

                      // Latest Products Section
                      const LatestProductsSection(),

                      // Spacing
                      SizedBox(height: hScreen * 0.03),

                      // Popular Products Section Header
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: wScreen * 0.04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular Products',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize(size: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: fontSize(size: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Popular Products List
                      const PopularProductsSection(),

                      // Bottom Spacing
                      SizedBox(height: hScreen * 0.02),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
