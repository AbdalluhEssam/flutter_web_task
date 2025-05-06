
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'core/config/app_colors.dart';
import 'core/config/screenutil_init_wrapper.dart';
import 'ui/items_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInitWrapper(
      child: MaterialApp(
        title: 'Flutter Web UI Task - Abdallah Essam',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme.apply(
              bodyColor: AppColors.textColor,
              displayColor: AppColors.textColor,
            ),

          ),

        ),
        home: const ItemsPage(),
      ),
    );
  }
}
