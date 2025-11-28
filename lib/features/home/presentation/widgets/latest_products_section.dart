import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class LatestProductsSection extends StatelessWidget {
  const LatestProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Products',
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
        SizedBox(height: hScreen * 0.02),
        SizedBox(
          height: hScreen * 0.24,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: wScreen * 0.02),
                child: Container(
                  width: wScreen * 0.4,
                  padding: EdgeInsets.all(wScreen * 0.03),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(wScreen * 0.0375),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, hScreen * 0.002),
                      ),
                    ],
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
                          child: Icon(
                            Icons.local_drink,
                            size: fontSize(size: 35),
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(height: hScreen * 0.008),
                      Text(
                        'Replaced by text',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(size: 13),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: hScreen * 0.003),
                      Text(
                        'Placeholder Text Box',
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
                              '3.000 RY',
                              style: TextStyle(
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
                                color: Colors.orange,
                                size: fontSize(size: 12),
                              ),
                              SizedBox(width: wScreen * 0.01),
                              Text(
                                '4.5',
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
                            color: Colors.orange[100],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.orange[700],
                            size: fontSize(size: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
