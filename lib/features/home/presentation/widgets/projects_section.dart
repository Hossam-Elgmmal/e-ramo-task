import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/project.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/horizontal_card_list.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/project_card.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/section_header.dart';

/// "اهم المشاريع العقارية في مصر".
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: AppStrings.projectsTitle,
          onViewAll: () => context.pushPlaceholder(AppStrings.projectsTitle),
        ),
        const SizedBox(height: 25),
        HorizontalCardList(
          height: 309,
          itemCount: projects.length,
          itemBuilder: (context, index) => ProjectCard(
            project: projects[index],
            onTap: () => context.pushPlaceholder(projects[index].name),
          ),
        ),
      ],
    );
  }
}
