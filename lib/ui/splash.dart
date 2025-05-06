import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_task/core/config/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/config/app_colors.dart';
import 'items_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate initialization (e.g., Firebase setup or other async tasks)
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Simulate a delay or wait for initialization
    await Future.delayed(const Duration(seconds: 3)); // Adjust as needed
    // Navigate to ItemsPage
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ItemsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo or image
            Spacer(),
            Image.asset(AppAssets.logo,height: 100.sp), // Replace with your logo asset
            SizedBox(height: 50.h),

            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),

            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Text(
                "© 2025 Abdalluh Essam. All rights reserved.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }
}