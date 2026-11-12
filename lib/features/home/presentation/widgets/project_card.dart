import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/project.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/property_meta.dart';

/// Tall 230x309 card used in "اهم المشاريع العقارية" (green border).
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.onTap});

  final Project project;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 309,
      child: Material(
        color: AppColors.background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: const BorderSide(color: AppColors.green),
        ),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 165,
                child: LazyAssetImage(assetPath: project.imageAsset, fit: BoxFit.cover),
              ),
              const Positioned(right: 0, top: 122, child: ProjectBadge()),
              Positioned(
                left: 21,
                right: 20,
                top: 181,
                height: 21,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        project.name,
                        style: AppTextStyles.cardPrice,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.icFavoriteSale,
                      width: 18.23,
                      height: 16,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 21,
                right: 20,
                top: 202,
                height: 21,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    project.description,
                    style: AppTextStyles.cardTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Positioned(
                left: 72,
                right: 20,
                top: 239,
                height: 21,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconTextLine(
                    iconAsset: AppAssets.icLocationProject,
                    iconWidth: 9,
                    iconHeight: 12,
                    text: project.location,
                  ),
                ),
              ),
              Positioned(
                left: 72,
                right: 20,
                top: 268,
                height: 21,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconTextLine(
                    iconAsset: AppAssets.icClock,
                    text: project.postedAgo,
                  ),
                ),
              ),
              const Positioned(left: 12, top: 242, child: PublisherBadge()),
            ],
          ),
        ),
      ),
    );
  }
}
