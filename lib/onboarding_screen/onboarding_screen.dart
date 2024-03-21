import 'package:flutter/material.dart';
import 'package:net_play/features/user_auth/presentation/pages/login_page.dart';
import 'package:net_play/widgets/onboarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:net_play/widgets/onboarding_card.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  static final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _onBoardingPages = [
    OnboardingCard(
      image: "assets/images/onboarding/picture 1.png",
      title: 'Welcome to Netplay',
      description:
      'Hello and welcome to NetPlay, your ultimate destination for badminton reservations! 🏸',
      buttonText: 'Next',
      onPressed: (BuildContext context) {
        _pageController.animateToPage(
          1,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    ),
    OnboardingCard(
      image: "assets/images/onboarding/picture 2.png",
      title: 'Exploring Various Courts',
      description:
      'Connects you to a vast network of registered badminton courts, giving you the freedom to choose where and when you want to play.',
      buttonText: 'Next',
      onPressed: (BuildContext context) {
        _pageController.animateToPage(
          2,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    ),
    OnboardingCard(
      image: "assets/images/onboarding/picture 3.png",
      title: 'Compete to Achieve Goals',
      description:
      'Simply input the scores, save them for future reference, and track your progress to deserve a tournament',
      buttonText: 'Next',
      onPressed: (BuildContext context) {
        _pageController.animateToPage(
          3,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    ),
    OnboardingCard(
      image: "assets/images/onboarding/picture 4.png",
      title: 'Ready to Hit the Court?',
      description: 'Just press a start button to begin the game',
      buttonText: 'Start',
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _onBoardingPages,
              ),
            ),
            SizedBox(
              height: 20, // Adjust this value according to your needs
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _onBoardingPages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotColor: Theme.of(context).colorScheme.secondary,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
