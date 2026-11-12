import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/promo_banner.dart';
import 'package:real_estate_emtalik/features/home/presentation/bloc/home_bloc.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/page_dots.dart';

/// Connects a [BannerCarousel] to [HomeBloc] (current page lives in the bloc).
class BannerSection extends StatelessWidget {
  const BannerSection({
    super.key,
    required this.banners,
    required this.carousel,
  });

  final List<PromoBanner> banners;
  final HomeCarousel carousel;

  @override
  Widget build(BuildContext context) {
    final page = context.select((HomeBloc bloc) => bloc.state.pageOf(carousel));
    return BannerCarousel(
      banners: banners,
      currentPage: page,
      onPageChanged: (index) => context
          .read<HomeBloc>()
          .add(HomeCarouselPageChanged(carousel, index)),
      onActionTap: (banner) => context.pushPlaceholder(banner.title),
    );
  }
}

/// Full-width 150px banner pager with arrows and page dots.
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    required this.banners,
    required this.currentPage,
    required this.onPageChanged,
    required this.onActionTap,
  });

  final List<PromoBanner> banners;
  final int currentPage;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<PromoBanner> onActionTap;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// delta -1 = previous, +1 = next (wraps around).
  void _goTo(int delta) {
    final count = widget.banners.length;
    if (count < 2) return;
    final target = (widget.currentPage + delta) % count;
    _controller.animateToPage(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            onPageChanged: widget.onPageChanged,
            itemBuilder: (context, index) => _BannerItem(
              banner: widget.banners[index],
              // In RTL the right arrow goes back and the left arrow goes forward.
              onPrevious: () => _goTo(-1),
              onNext: () => _goTo(1),
              onActionTap: () => widget.onActionTap(widget.banners[index]),
            ),
          ),
        ),
        const SizedBox(height: 15),
        PageDots(count: widget.banners.length, index: widget.currentPage),
      ],
    );
  }
}

class _BannerItem extends StatelessWidget {
  const _BannerItem({
    required this.banner,
    required this.onPrevious,
    required this.onNext,
    required this.onActionTap,
  });

  final PromoBanner banner;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        LazyAssetImage(
          assetPath: banner.imageAsset,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 28),
            child: SizedBox(
              width: 255,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    banner.title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bannerTitle,
                  ),
                  const SizedBox(height: 13),
                  Text(
                    banner.subtitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bannerSubtitle,
                  ),
                  const SizedBox(height: 9),
                  Material(
                    color: AppColors.amber,
                    borderRadius: BorderRadius.circular(4),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: onActionTap,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Text(
                          banner.actionLabel,
                          style: AppTextStyles.bannerButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
