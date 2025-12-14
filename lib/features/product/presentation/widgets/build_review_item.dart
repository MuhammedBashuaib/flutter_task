import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';
import 'package:intl/intl.dart';

class BuildReviewItem extends StatelessWidget {
  final Review review;
  final bool isLast;

  const BuildReviewItem({
    super.key,
    required this.review,
    required this.isLast,
  });

  // دالة لتحويل التقييم العددي إلى نجوم
  String _getStarRating(int rating) {
    return '⭐' * rating + '☆' * (5 - rating);
  }

  @override
  Widget build(BuildContext context) {
    // تنسيق التاريخ
    final dateFormatter = DateFormat('MMM dd, yyyy');
    final formattedDate = dateFormatter.format(review.date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. الاسم والتاريخ
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              review.reviewerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize(size: 14),
                color: Colors.black,
              ),
            ),
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: fontSize(size: 12),
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        SizedBox(height: hScreen * 0.005),

        // 2. التقييم بالنجوم
        Text(
          _getStarRating(review.rating),
          style: TextStyle(fontSize: fontSize(size: 14)),
        ),
        SizedBox(height: hScreen * 0.01),

        // 3. التعليق
        Text(
          review.comment,
          style: TextStyle(
            fontSize: fontSize(size: 14),
            color: Colors.grey[800],
            height: 1.4,
          ),
          maxLines: 4, // الحد الأقصى لسطور التعليق
          overflow: TextOverflow.ellipsis,
        ),

        // فاصل بين المراجعات
        // تم إزالة الفاصل هنا لأنه لا توجد مراجعات أخرى معروضة
        if (!isLast)
          Padding(
            padding: EdgeInsets.symmetric(vertical: hScreen * 0.02),
            child: Divider(color: Colors.grey.shade300, height: 1),
          )
        else
          SizedBox(height: hScreen * 0.02), // مسافة في النهاية
      ],
    );
  }
}
