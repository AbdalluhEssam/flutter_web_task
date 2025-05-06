import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_task/core/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/config/app_assets.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double spacing = isMobile ? 12 : 14;
    final double titleFontSize = isMobile ? 16.sp : 18.sp;
    final double subtitleFontSize = isMobile ? 11.sp : 12.sp;
    final double statusFontSize = isMobile ? 12.sp : 13.sp;
    final images = [AppAssets.image1, AppAssets.image2, AppAssets.image3];
    final image = images[Random().nextInt(images.length)];

    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 260.w,

      decoration: BoxDecoration(
        color: AppColors.backgroundCardColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Image.asset(image, height: 180.h, alignment: Alignment.topCenter,),
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.3, 0.4, 0.55, 0.8, 1],
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    AppColors.backgroundCardColor.withOpacity(0.2),
                    AppColors.backgroundCardColor,
                    Color(0xFF171717),
                    Color(0xFF171717),
                  ],
                ),
              ),
            ),
          ),

          // Top Right Menu Icon
          Positioned(
            top: 8.h,
            right: 8.w,
            child: IconButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Colors.black.withOpacity(0.6),
                ),
                shape: WidgetStateProperty.all(const CircleBorder()),
              ),
              icon: Image.asset(
                AppAssets.more,
                color: Colors.white,
                width: 20.w,
              ),
            ),
          ),

          // Content
          Positioned(
            left: 12.w,
            right: 12.w,
            bottom: 26.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  margin: EdgeInsetsDirectional.only(bottom: spacing),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBgColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: AppColors.primaryBgColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Pending Approval",
                        style: TextStyle(fontSize: statusFontSize, color: Colors.white),
                      ),
                      6.horizontalSpace,
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),

                    18.verticalSpace,

                // Title
                Text(
                  "Item title",
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),

                8.verticalSpace,

                // Date Info
                Row(
                  children: [
                    Image.asset(AppAssets.calendar, width: 16.w),
                    6.horizontalSpace,
                    Text(
                      "5 Nights (Jan 16 - Jan 20, 2024)",
                      style: TextStyle(fontSize: subtitleFontSize, color: Colors.grey),
                    ),
                  ],
                ),

                SizedBox(height: spacing),

                // Divider
                Container(height: 0.5.h, color: AppColors.grayColor),

                SizedBox(height: spacing),

                // Avatars and task count
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 16.r,
                          backgroundImage: const AssetImage(AppAssets.profile),
                        ),
                        Positioned(
                          left: 14.w,
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundImage: const AssetImage(
                              AppAssets.profile,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 28.w,
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundColor: AppColors.backgroundCardColor,
                            child: Text(
                              "+6",
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: AppColors.textGoldColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "4 unfinished tasks",
                      style: TextStyle(fontSize: subtitleFontSize, color: Colors.grey),
                    ),
                  ],
                ),
                4.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
