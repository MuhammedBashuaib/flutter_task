import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/build_overview_item.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class OverviewSection extends StatelessWidget {
  final ProductModel product;
  const OverviewSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize(size: 16),
            ),
          ),
          SizedBox(height: hScreen * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOverviewItem(Icons.store, "Brand", product.brand),
              _buildOverviewItem(
                Icons.update,
                "Return Policy",
                product.returnPolicy,
              ),
              _buildOverviewItem(
                Icons.inventory,
                "Stock",
                product.stock.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewItem(IconData icon, String des, String label) {
    return BuildOverviewItem(icon: icon, des: des, label: label);
  }
}
