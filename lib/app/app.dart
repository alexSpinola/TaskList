import 'package:flutter/material.dart';
import 'package:lista_de_tareas/app/view/splash_page/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    //Colors:
    const primary = Color(0xFF40B7AD);
    const secondary = Color(0xFF1A9F9C);
    //const secondary = Color(0xFF086c64);
    const backgroundColor = Color(0xFFF5F5F5);
    const textColor = Color(0xFF4A4A4A);

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
          backgroundColor: Colors.transparent
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      home: Splash(),
    );
  }
}