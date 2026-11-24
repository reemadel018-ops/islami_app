import 'package:material_ui/material_ui.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_routes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  PageViewModel _page({
    required String image,
    required String title,
    String body = '',
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Image.asset(image, fit: BoxFit.contain),
      decoration: const PageDecoration(
        pageColor: AppColors.black,
        imageFlex: 6,
        bodyFlex: 2,
        imageAlignment: Alignment.center,
        bodyAlignment: Alignment.topCenter,
        titleTextStyle: TextStyle(
          color: AppColors.gold,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(color: AppColors.gold, fontSize: 20),
        titlePadding: EdgeInsets.only(top: 16, bottom: 16),
        imagePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        contentMargin: EdgeInsets.symmetric(horizontal: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const buttonStyle = TextStyle(
      color: AppColors.gold,
      fontWeight: FontWeight.bold,
      fontSize: 16
    );

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/intro_logo.png',
            
              width: width * 0.66,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: IntroductionScreen(
                globalBackgroundColor: AppColors.black,
                safeAreaList: const [false, false, false, false],
                pages: [
                  _page(
                    image: 'assets/images/welcome.png',
                    title: 'Welcome To Islami App',
                  ),
                  _page(
                    image: 'assets/images/mosque_fram.png',
                    title: 'Welcome To Islami',
                    body: 'We Are Very Excited To Have You in Our Community',
                  ),
                  _page(
                    image: 'assets/images/quran.png',
                    title: 'Reading the Quran',
                    body: 'Read, and your Lord is the Most Generous',
                  ),
                  _page(
                    image: 'assets/images/Frame.png',
                    title: 'Bearish',
                    body: 'Praise the name of your Lord, the Most High',
                  ),
                  _page(
                    image: 'assets/images/mic.png',
                    title: 'Holy Quran Radio',
                    body:
                        'You can listen to the Holy Quran Radio through the application for free and easily',
                  ),
                ],
                showBackButton: true,
                showSkipButton: false,
                back: const Text('Back', style: buttonStyle),
                next: const Text('Next', style: buttonStyle),
                done: const Text('Finish', style: buttonStyle),
                onDone: () => Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.homeRouteName,
                ),
                dotsDecorator: const DotsDecorator(
                  color: AppColors.gray,
                  activeColor: AppColors.gold,
                  size: Size(7, 7),
                  activeSize: Size(20, 7),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}