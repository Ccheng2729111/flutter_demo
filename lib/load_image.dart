import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageFormat { png, jpg, gif, webp }

/// 加载图片组件，根据当前是否为网络图片或者当前图片资源是否还在加载中
/// 来返回cacheNetworkImage 可以显示占位图，然后图片显示也有渐变效果，避免图片闪现的问题
/// 可以自定义占位图图片
class LoadImage extends StatelessWidget {
  const LoadImage(this.image,
      {Key? key,
      this.cacheHeight,
      this.cacheWidth,
      this.fit = BoxFit.cover,
      this.format = ImageFormat.png,
      this.height,
      this.width,
      this.holderImage = 'images/2.0x/zeekr_icon_placeholder_square@2x.png'})
      : super(key: key);

  final String image;
  final double? height;
  final double? width;
  final int? cacheWidth;
  final int? cacheHeight;
  final String? holderImage;
  final BoxFit? fit;
  final ImageFormat format;

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty || image.startsWith('https')) {
      final Widget holder = assetImageBuild(holderImage);
      return CachedNetworkImage(
        imageUrl: image,
        placeholder: (_, __) => holder,
        errorWidget: (_, __, dynamic error) => holder,
        height: height,
        width: width,
        fit: fit,
        memCacheHeight: cacheHeight,
        memCacheWidth: cacheWidth,
      );
    } else {
      return assetImageBuild(image);
    }
  }

  Widget assetImageBuild(imageUrl) {
    return Image.asset(imageUrl,
        height: height,
        width: width,
        cacheHeight: cacheHeight,
        cacheWidth: cacheWidth,
        fit: fit,
        excludeFromSemantics: true);
  }
}
