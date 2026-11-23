import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_theme.dart';
import 'package:islami_app/ui/screens/hadeth_details_screen/hadeth_details_screen.dart';
import 'package:islami_app/ui/screens/home_screen.dart';
import 'package:islami_app/ui/screens/intro_screen.dart';
import 'package:islami_app/ui/screens/sura_details/sura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.introRouteName ,
      routes: {
        AppRoutes.introRouteName:(context) =>IntroScreen(),
        AppRoutes.homeRouteName:(context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName:(context) => SuraDetailsScreen(),
        AppRoutes.hadethDetailsRouteName:(context)=>HadethDetailsScreen()

      },
      
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

    );
    
  }
}
