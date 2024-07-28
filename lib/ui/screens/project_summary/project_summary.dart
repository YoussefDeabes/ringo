import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo/_base/widgets/base_stateful_widget.dart';
import 'package:ringo/res/assets_paths.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/widgets/project_summary/productivity_section.dart';
import 'package:ringo/util/lang/app_localization_keys.dart';

class ProjectSummary extends BaseStatefulWidget {
  const ProjectSummary({super.key});

  @override
  BaseState<ProjectSummary> baseCreateState() => _ProjectSummaryState();
}

class _ProjectSummaryState extends BaseState<ProjectSummary> {
  @override
  Widget baseBuild(BuildContext context) {
    return Container(
      color: ConstColors.scaffoldBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                Text(
                  translate(LangKeys.search),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: ConstColors.text),
                ),
                SizedBox(height: height * 0.01),
                TextField(
                  style: const TextStyle(
                      color: ConstColors.text,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  decoration: InputDecoration(
                      hintText: translate(LangKeys.searchProject),
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: ConstColors.secondaryText),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AssPaths.searchNormal,
                        ),
                      )),
                ),
                SizedBox(height: height * 0.03),
                StaggeredGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _getProjectStatusCard("10", AssPaths.inProgress,
                        translate(LangKeys.inProgress), const [
                      Color(0xFF5EACE4),
                      Color(0xFF3A9ADE),
                      Color(0xFF5EACE4)
                    ]),
                    _getProjectStatusCard("24", AssPaths.completed,
                        translate(LangKeys.completed), const [
                      Color(0xFF58B2B4),
                      Color(0xFF3F8B8D),
                      Color(0xFF58B2B4)
                    ]),
                    _getProjectStatusCard("5", AssPaths.cancelled,
                        translate(LangKeys.canceled), const [
                      Color(0xFFE87777),
                      Color(0xFFDD4A4A),
                      Color(0xFFE87777)
                    ]),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: SizedBox(
                      width: width * 0.90,
                      height: height * 0.06,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    ConstColors.scaffoldBackground),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: const BorderSide(
                                            width: 2,
                                            color: ConstColors.app)))),
                            child: Text(
                              translate(LangKeys.viewAllProjects),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: ConstColors.app),
                            )),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.03),
          Expanded(
            child: ProductivitySection(
              title: translate(LangKeys.productivity),
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProjectStatusCard(
      String projectsNumber, String image, String status, List<Color> colors) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: width * 0.28,
        width: width * 0.25,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      projectsNumber,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ConstColors.white),
                    ),
                    SvgPicture.asset(image, width: 20)
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      translate(LangKeys.project),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ConstColors.white),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      status,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ConstColors.white),
                    ),
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
