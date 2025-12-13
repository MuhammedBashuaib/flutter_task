import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/custom_product_cart_horiz.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';
import 'package:shimmer/shimmer.dart';

class LatestProductsSectionLoding extends StatelessWidget {
  const LatestProductsSectionLoding({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          width: wScreen * 0.40,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,

            child: CustomProductCartHoriz(
              // key: ValueKey('h-${product.id}'),
              product: ProductModel(
                id: 1,
                title: "title",
                description: "description",
                category: "category",
                price: 0,
                discountPercentage: 0,
                rating: 9,
                stock: 0,
                tags: [],
                brand: "brand",
                sku: "",
                weight: 0,
                dimensions: null,
                warrantyInformation: "warrantyInformation",
                shippingInformation: "shippingInformation",
                availabilityStatus: "availabilityStatus",
                reviews: [],
                returnPolicy: "",
                minimumOrderQuantity: 0,
                meta: null,
                images: [],
                thumbnail: "thumbnail",
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 12),
    );
  }
}
