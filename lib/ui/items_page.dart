import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/config/app_assets.dart';
import '../core/config/app_colors.dart';
import 'item_card.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  String selectedTab = "Items";
  final List<String> tabs = ["Items", "Pricing", "Info", "Tasks", "Analytics"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final isTablet = width < 1000;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight:
            isMobile
                ? 80.h
                : isTablet
                ? 90.h
                : 100.h,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(height: 1.h, color: AppColors.grayColor),
        ),
        titleSpacing: 0,

        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12.w : 80.w,
            vertical: 30.h,
          ),
          child: Row(
            children: [
              Image.asset(
                AppAssets.logo,
                height: isMobile ? 30.h : 40.h,
                // height: 40.h,
                fit: BoxFit.contain,
              ),
              if (!isMobile && !isTablet) ...[
                const Spacer(),
                ...tabs.map(
                  (tab) => SizedBox(
                    height: isMobile
                        ? 80.h
                        : isTablet
                        ? 90.h
                        : 100.h,
                    child: _navItem(tab, selected: selectedTab == tab),
                  ),
                ),
                24.horizontalSpace,
              ],
              if (isMobile || isTablet) const Spacer(),
              Image.asset(AppAssets.settings, color: Colors.white, width: 20.w),
              16.horizontalSpace,
              Image.asset(
                AppAssets.notification,
                color: Colors.white,
                width: 20.w,
              ),
              12.horizontalSpace,
              Row(
                children: [
                  Container(
                    width: 2.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: AppColors.grayColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  12.horizontalSpace,
                   CircleAvatar(
                    radius: 18.r,
                    backgroundImage: AssetImage(AppAssets.profile),
                  ),
                  if (!isMobile && !isTablet) ...[
                    8.horizontalSpace,
                    const Text(
                      "John Doe",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    4.horizontalSpace,
                    const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
      drawer:
          (isMobile || isTablet)
              ? Drawer(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1E1E1E), Color(0xFF333333)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(

                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32.r,
                          backgroundImage: const AssetImage(AppAssets.profile),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Doe",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.greenAccent,
                                    size: 14.sp,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Active Now",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "View Profile",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[400],
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: tabs.length,
                      separatorBuilder: (_, __) => Divider(
                        color: Colors.grey[800],
                        height: 1,
                        thickness: 0.5,
                        indent: 16.w,
                        endIndent: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        final tab = tabs[index];
                        final isSelected = tab == selectedTab;
                        final icon = tab == "Items"
                            ? Icons.list
                            : tab == "Pricing"
                            ? Icons.attach_money
                            : tab == "Info"
                            ? Icons.info
                            : tab == "Tasks"
                            ? Icons.task
                            : Icons.analytics;

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.r),
                            onTap: () {
                              setState(() {
                                selectedTab = tab;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryColor.withOpacity(0.15)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    icon,
                                    color: isSelected ? AppColors.primaryColor : Colors.white,
                                    size: 22.sp,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text(
                                      tab,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: isSelected ? AppColors.primaryColor : Colors.white,
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  if (isSelected)
                                    Container(
                                      width: 6.w,
                                      height: 6.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Text(
                      "© 2025 Abdalluh Essam. All rights reserved.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          )
              : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          final padding =
              isMobile
                  ? EdgeInsets.all(16.w)
                  : EdgeInsets.symmetric(horizontal: 80.w, vertical: 16.h);
          final crossAxisCount =
              constraints.maxWidth > 1200
                  ? 5
                  : constraints.maxWidth > 1000
                  ? 3
                  : constraints.maxWidth > 700
                  ? 2
                  : 1;

          return SingleChildScrollView(
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  28.verticalSpace,
                  SizedBox(
                    height: 50.h,
                    child: Row(
                      children: [
                        30.verticalSpace,
                        Text(
                          "Items",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.backgroundIconsColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.r),
                                child: Image.asset(
                                  AppAssets.sliders,
                                  color: Colors.white,
                                  width: 20.w,
                                ),
                              ),
                            ),
                            if (!isMobile) 12.horizontalSpace,
                            if (!isMobile)
                              Container(
                                width: 1.5.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: AppColors.grayColor,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                            if (!isMobile) 12.horizontalSpace,
                            if (!isMobile)
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                label: const Text("Add a New Item"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  fixedSize: Size(175.w, 50.h),

                                  textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  28.verticalSpace,
                  GridView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: isMobile ? 1.1 : 0.75,
                    ),
                    itemBuilder: (context, index) => const ItemCard(),
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _navItem(String label, {bool selected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevent Column from taking full height
          children: [
            Spacer(), // Push
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            Spacer(), // Push the underline to the bottom
            AnimatedContainer(

              alignment: Alignment.bottomCenter,
              duration: const Duration(milliseconds: 400),
              height: 4.h,
              width: selected ? label.length * 8.w : 0,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
