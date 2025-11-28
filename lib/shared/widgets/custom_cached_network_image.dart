import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.color,
    this.isPerson = false,
    this.isDetails = false,
    this.isFit = false,
  });

  final String imageUrl;
  final bool isPerson;
  final double height;
  final double width;
  final Color color;
  final bool isDetails;
  final bool isFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        padding: EdgeInsets.symmetric(
          vertical: isDetails ? hScreen * .02 : 0,
          horizontal: isDetails ? wScreen * .03 : 0,
        ),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(isDetails ? wScreen * .02 : 0),
          image: DecorationImage(
            image: imageProvider,
            fit: isFit ? BoxFit.cover : null,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        // color: Theme.of(context).primaryColorDark,
        color: Colors.white,
        height: height,
        width: width,
        child: Center(
          child: isPerson
              ? Icon(Icons.person_outline, size: hScreen * .05)
              : Icon(Icons.image_outlined, size: hScreen * .05),
        ),
      ),
    );
  }
}
