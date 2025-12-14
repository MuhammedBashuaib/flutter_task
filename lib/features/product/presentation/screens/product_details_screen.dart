import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/build_price_and_quantity_section.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/build_reviews_content.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/custom_floating_action_button.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/over_view_section.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/segmented_button_taps.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

// 1. تحويل إلى StatefulWidget لإدارة حالة التبويب النشط
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // 2. حالة لتخزين التبويب النشط (0: About, 1: Reviews)
  int _currentTabIndex = 0;

  // 3. دالة لتحديث الحالة عند الضغط على أزرار التبديل
  void _onTabChanged(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    // 💡 ودجت المحتوى النشط الذي سيتم عرضه (يتغير ارتفاعه ديناميكياً)
    Widget activeTabContent;
    if (_currentTabIndex == 0) {
      activeTabContent = _buildAboutContent(context, widget.product);
    } else {
      activeTabContent = _buildReviewsContent(widget.product);
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(product: widget.product),

      body: SizedBox(
        child: SingleChildScrollView(
          // زيادة الـ padding السفلي لترك مساحة لـ FloatingActionButton
          padding: EdgeInsets.only(bottom: hScreen * 0.2),
          child: Column(
            children: [
              // App Bar
              CustomAppBar(product: widget.product),
              SizedBox(height: hScreen * 0.03),

              // Overview Section
              OverviewSection(product: widget.product),
              SizedBox(height: hScreen * 0.03),

              // Segmented Tabs
              SegmentedButtonTabs(onTabChanged: _onTabChanged),

              SizedBox(height: hScreen * 0.02),

              // 🔑 المحتوى النشط (يتمدد ويتقلص بشكل طبيعي)
              activeTabContent,

              // 💡 تم تقليل هذه المسافة لتكون مناسبة بين المحتوى وقسم السعر/الكمية
              SizedBox(height: hScreen * 0.05),

              // باقي الأقسام الثابتة أسفل التبديل (Price & Quantity)
              _buildPriceAndQuantitySection(widget.product),
              SizedBox(height: hScreen * 0.03),

              // Total Price & Add to Cart
              SizedBox(height: hScreen * 0.03), // تقليل المسافة النهائية
            ],
          ),
        ),
      ),
    );
  }

  // ودجت خاص لبناء محتوى "About"
  Widget _buildAboutContent(BuildContext context, ProductModel product) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
      child: Text(
        product.description,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: fontSize(size: 14),
          height: 1.5, // تحسين قراءة النص
        ),
      ),
    );
  }

  // ودجت خاص لبناء محتوى "Reviews" (المراجعات)
  Widget _buildReviewsContent(ProductModel product) {
    return BuildReviewsContent(product: product);
  }

  // ودجت خاص لبناء قسم السعر والكمية
  Widget _buildPriceAndQuantitySection(ProductModel product) {
    return BuildPriceAndQuantitySection(product: product);
  }
}
