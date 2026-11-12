import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';

/// Instant in-app local image loader and precacher.
/// Dedicated strictly to local asset images (no internet/network image code).
class LazyImageSequencer {
  LazyImageSequencer._();
  static final LazyImageSequencer instance = LazyImageSequencer._();

  final Set<String> _loadedAssets = {};

  bool isLoaded(String assetPath) => _loadedAssets.contains(assetPath);

  /// Loads local in-app asset images instantly.
  void requestLoad(
    String assetPath,
    BuildContext context,
    VoidCallback onReady,
  ) {
    if (!_loadedAssets.contains(assetPath)) {
      _loadedAssets.add(assetPath);
      if (context.mounted) {
        precacheImage(AssetImage(assetPath), context).catchError((_) {});
      }
    }
    onReady();
  }

  void cancel(VoidCallback onReady) {}
}

/// A clean widget that renders local in-app asset images instantly with optional clipping.
class LazyAssetImage extends StatefulWidget {
  const LazyAssetImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.errorWidget,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? errorWidget;

  @override
  State<LazyAssetImage> createState() => _LazyAssetImageState();
}

class _LazyAssetImageState extends State<LazyAssetImage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      LazyImageSequencer.instance.requestLoad(
        widget.assetPath,
        context,
        () {},
      );
    });
  }

  @override
  void didUpdateWidget(covariant LazyAssetImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        LazyImageSequencer.instance.requestLoad(
          widget.assetPath,
          context,
          () {},
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      widget.assetPath,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorBuilder: (_, __, ___) =>
          widget.errorWidget ??
          Container(
            width: widget.width,
            height: widget.height,
            color: AppColors.surface,
            child: const Icon(
              Icons.broken_image_outlined,
              color: AppColors.lightGray,
            ),
          ),
    );

    if (widget.borderRadius != null) {
      image = ClipRRect(
        borderRadius: widget.borderRadius!,
        child: image,
      );
    }

    return image;
  }
}
