import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/core/theme/app_colors.dart';

class AppThemeDatas {
  const AppThemeDatas._();

  static ThemeData darkTheme(BuildContext context) =>
      lightTheme(context).copyWith(
        brightness: Brightness.dark,
      );

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,

        //* fonts and texts
        fontFamily: 'Roboto',

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),

//* appbar
        appBarTheme: const AppBarTheme(
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),

//* colors
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primary,
        primaryColorLight: AppColors.primary,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primary,
              secondary: AppColors.primary,
              onPrimary: AppColors.primary,
            ),

        //* inputs
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffb5b7ca),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          constraints: const BoxConstraints(minHeight: 48, maxHeight: 52),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF00001A).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF00001A).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF00001A).withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        //* buttons
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fixedSize: const Size(double.maxFinite, 48),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            side: BorderSide(color: const Color(0xFF000026).withOpacity(.15)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            disabledBackgroundColor: const Color(0xFFC8C8C8),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(color: const Color(0xFF000026).withOpacity(.15)),
            fixedSize: const Size(double.maxFinite, 48),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            disabledBackgroundColor: const Color(0xFFC8C8C8),
          ),
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          elevation: 0,
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          sizeConstraints: BoxConstraints(minHeight: 56, minWidth: 56),
        ),
      );
}
