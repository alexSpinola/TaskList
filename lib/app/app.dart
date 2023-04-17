import 'package:flutter/material.dart';
import 'package:lista_de_tareas/app/view/splash_page/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    //LIGHT COLORS
    const primary = Color(0xFF40B7AD);
    const secondary = Color(0xFF1A9F9C);
    const backgroundColor = Color(0xFFF5F5F5);
    const textColor = Color(0xFF4A4A4A);
    //DARK COLORS
    const Color primaryDark =  Color(0xFF256B6A);
    const Color textColorDark =  Color(0xFFFFFFFF);
    const Color backgroundColorDark =  Color(0xFF282C34);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Lista de Tareas',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          primary: primary,
          secondary: secondary,
        ),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: textColor,
        ),

        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
          )
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),

      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: primaryDark,
        ),
        scaffoldBackgroundColor: backgroundColorDark,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: textColorDark,
        ),

        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: backgroundColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
            )
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: secondary
        ),

        cardTheme: const CardTheme(
          color: primaryDark,
        )
      ),
      home: Splash(),
    );
  }
}