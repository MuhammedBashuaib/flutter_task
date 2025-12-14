import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + wScreen * 0.04,
          left: wScreen * 0.04,
          right: wScreen * 0.04,
          bottom: wScreen * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: wScreen * 0.1,
                        height: wScreen * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(wScreen * 0.02),
                          color: AppColor.white.withOpacity(0.5),
                          // shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 5,
                              offset: Offset(0, hScreen * 0.002),
                            ),
                          ],
                        ),

                        child: Icon(
                          Icons.location_on,
                          color: AppColor.white,
                          size: fontSize(size: 24),
                        ),
                      ),
                      SizedBox(width: wScreen * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: fontSize(size: 12),
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(width: wScreen * 0.01),
                              Icon(
                                Icons.arrow_drop_down,
                                color: AppColor.white,
                                size: hScreen * 0.02,
                              ),
                            ],
                          ),
                          SizedBox(height: hScreen * 0.005),
                          Text(
                            'Al Mukalla - Fuwah - Al...',
                            style: TextStyle(
                              fontSize: fontSize(size: 14),
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: wScreen * 0.02),
                Icon(
                  Icons.notifications_active_outlined,
                  color: AppColor.white,
                  size: fontSize(size: 20),
                ),
              ],
            ),
            SizedBox(height: hScreen * 0.02),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: wScreen * 0.03,
                vertical: hScreen * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(wScreen * 0.075),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: fontSize(size: 20),
                  ),
                  SizedBox(width: wScreen * 0.02),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: fontSize(size: 14)),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: fontSize(size: 14),
                          color: Colors.grey[600],
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.grey[600],
                    size: fontSize(size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
