import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/custom_product_card.dart';
import 'package:shimmer/shimmer.dart';

class PopularProductsSectionLoding extends StatelessWidget {
  const PopularProductsSectionLoding({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true, // يجعل القائمة تتكيف مع محتواها
      physics:
          const NeverScrollableScrollPhysics(), // يمنع التمرير الداخلي (التمرير الخارجي فقط)
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,

          child: CustomProductCard(
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
        );
      },
      separatorBuilder: (_, __) =>
          const SizedBox(height: 12), // فاصل بين البطاقات
      itemCount: 10, // عدد العناصر في القائمة
    );
  }
}
