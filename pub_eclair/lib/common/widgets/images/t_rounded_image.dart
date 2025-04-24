import 'package:flutter/material.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key, 
    this.width, 
    this.height, 
    required this.image, 
    this.applyImageRadius = true, 
    this.border, 
    this.backgroundColor = TColors.textWhite, 
    this.fit = BoxFit.contain,
    this.padding, 
    this.isNetworkImage = false, 
    this.onPressed, 
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String image;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        clipBehavior: Clip.antiAlias,
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider, fit: fit),
          ),
      ),
    );
  }
}