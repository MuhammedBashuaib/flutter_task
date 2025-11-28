import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    return Column(
      children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: hScreen * 0.02,
            left: wScreen * 0.04,
            right: wScreen * 0.04,
          ),
          child: Container(
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
            child: Row(
              children: [
                Container(
                  width: wScreen * 0.15,
                  height: wScreen * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(wScreen * 0.025),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.local_drink,
                      size: fontSize(size: 30),
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(width: wScreen * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Replaced by text',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(size: 16),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: hScreen * 0.005),
                      Text(
                        'Placeholder Text Box',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: fontSize(size: 14),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: hScreen * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              '3.000 RY',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize(size: 16),
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
                                size: fontSize(size: 14),
                              ),
                              SizedBox(width: wScreen * 0.01),
                              Text(
                                '4.7',
                                style: TextStyle(fontSize: fontSize(size: 14)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: wScreen * 0.02),
                Container(
                  width: wScreen * 0.06,
                  height: wScreen * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.orange[700],
                    size: fontSize(size: 14),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
