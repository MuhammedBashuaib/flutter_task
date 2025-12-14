import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
// يجب عليك التأكد من أن هذا المسار صحيح لمودل المنتج
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/product/presentation/widgets/build_review_item.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';
// لا نحتاج لاستدعاء intl هنا إذا كان مستخدماً فقط في BuildReviewItem

// 1. تحويل إلى StatefulWidget
class BuildReviewsContent extends StatefulWidget {
  const BuildReviewsContent({super.key, required this.product});
  final ProductModel product;

  @override
  State<BuildReviewsContent> createState() => _BuildReviewsContentState();
}

class _BuildReviewsContentState extends State<BuildReviewsContent> {
  // 2. حالة لتتبع عدد المراجعات المعروضة حالياً
  // نبدأ بعرض مراجعة واحدة فقط بشكل افتراضي
  int _reviewsToShow = 1;

  // دالة لحساب متوسط التقييم (بقي كما هو)
  double _calculateAverageRating(List<Review> reviews) {
    if (reviews.isEmpty) return 0.0;
    final totalRating = reviews.fold(0, (sum, item) => sum + item.rating);
    return totalRating / reviews.length;
  }

  // دالة لتحويل التقييم العددي إلى نجوم (بقي كما هو)
  String _getStarRating(int rating) {
    return '⭐' * rating + '☆' * (5 - rating);
  }

  // 3. دالة لعرض جميع المراجعات
  void _showAllReviews() {
    setState(() {
      // تحديث الحالة لعرض جميع المراجعات المتاحة
      _reviewsToShow = widget.product.reviews.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    final reviews = widget.product.reviews;
    final averageRating = _calculateAverageRating(reviews);
    final reviewsCount = reviews.length;

    // تحديد العدد الفعلي الذي سيتم عرضه: إما العدد الكلي أو _reviewsToShow
    // نضمن عدم تجاوز العدد الكلي حتى لو كان _reviewsToShow كبيراً
    final displayCount = (_reviewsToShow <= reviewsCount)
        ? _reviewsToShow
        : reviewsCount;

    // لتحديد ما إذا كان يجب عرض زر "استعراض المزيد"
    final shouldShowViewAllButton = reviewsCount > displayCount;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. ملخص التقييم الكلي
          Text(
            'Customer Reviews ($reviewsCount)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize(size: 16),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                // عرض متوسط التقييم
                averageRating.toStringAsFixed(1),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize(size: 24),
                  color: Colors.black,
                ),
              ),
              Text(
                ' / 5',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: fontSize(size: 16),
                ),
              ),
              SizedBox(width: wScreen * 0.03),
              Text(
                _getStarRating(averageRating.round()),
                style: TextStyle(fontSize: fontSize(size: 18)),
              ),
            ],
          ),
          SizedBox(height: hScreen * 0.03), // مسافة بعد الملخص
          // 2. قائمة المراجعات الفعلية
          reviews.isEmpty
              ? Center(
                  child: Text(
                    'No reviews yet for this product.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: displayCount, // 🔑 يستخدم displayCount الآن
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    // تحديد ما إذا كانت هذه هي آخر مراجعة معروضة حالياً
                    final isLastReview = index == displayCount - 1;

                    return BuildReviewItem(
                      review: review,
                      isLast: isLastReview,
                    );
                  },
                ),

          // 3. زر "View All Reviews" (إذا كان يجب عرضه)
          if (shouldShowViewAllButton) // 🔑 يظهر فقط إذا كان هناك مراجعات لم يتم عرضها بعد
            Padding(
              padding: EdgeInsets.only(top: hScreen * 0.01),
              child: TextButton(
                onPressed: _showAllReviews, // 🔑 عند الضغط، يتم عرض الكل
                child: Text(
                  'View All $reviewsCount Reviews >',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize(size: 14),
                  ),
                ),
              ),
            ),
          SizedBox(height: hScreen * 0.02), // مسافة في النهاية
        ],
      ),
    );
  }
}
