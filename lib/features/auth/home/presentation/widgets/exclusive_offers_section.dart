import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class ExclusiveOffersSection extends StatelessWidget {
  const ExclusiveOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
      padding: EdgeInsets.all(wScreen * 0.04),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(wScreen * 0.05),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Placeholder Text Area for Description',
                  style: TextStyle(
                    fontSize: fontSize(size: 16),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: hScreen * 0.01),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    padding: EdgeInsets.symmetric(
                      horizontal: wScreen * 0.05,
                      vertical: hScreen * 0.01,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(wScreen * 0.05),
                    ),
                  ),
                  child: Text(
                    'Reserve Now',
                    style: TextStyle(
                      fontSize: fontSize(size: 12),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: wScreen * 0.02),
          Container(
            width: wScreen * 0.2,
            height: hScreen * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(wScreen * 0.0375),
            ),
            child: Center(
              child: Icon(
                Icons.local_drink,
                size: fontSize(size: 40),
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
