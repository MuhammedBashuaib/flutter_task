import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: fontSize(size: 12),
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: hScreen * 0.005),
                      Text(
                        'Al Mukalla - Fuwah - Al...',
                        style: TextStyle(
                          fontSize: fontSize(size: 14),
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: wScreen * 0.02),
                Icon(
                  Icons.location_on,
                  color: Colors.orange[700],
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
