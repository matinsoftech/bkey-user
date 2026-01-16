import 'package:bkey_user/app_colors.dart';
import 'package:bkey_user/controllers/onboarding_controller.dart';
import 'package:bkey_user/services/onboarding_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Book your online Bus Ticket",
      "subtitle": "Book your Online Bus Ticket from BKEY for comfort, secure Bus Travel without any scam",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Digital Bus Management System",
      "subtitle": "Book your Online Bus Ticket from BKEY for comfort, secure Bus Travel without any scam",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Effortless & Relable bus Tracking",
      "subtitle": "Book your Online Bus Ticket from BKEY for comfort, secure Bus Travel without any scam",
      "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingController(totalPages: onboardingData.length),
      child: Consumer<OnboardingController>(
        builder: (context, controller, _) {
          // Animate page when current page changes
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_pageController.hasClients) {
              _pageController.animateToPage(
                controller.currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          });

          return Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.65, 0.65, 1.0],
                  colors: [Colors.white, Colors.white, AppColors.primary, AppColors.primary],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingData.length,
                      onPageChanged: (index) {
                        // Only update controller state, don't trigger animation
                        if (index != controller.currentPage) {
                          controller.setCurrentPage(index);
                        }
                      },
                      physics: const NeverScrollableScrollPhysics(), // Disable manual swiping
                      itemBuilder: (context, index) {
                        final data = onboardingData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Container(
                                width: 300,
                                height: 300,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/onboarding_ellipse.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    data["image"]!,
                                    height: 200, // make it smaller to stay inside the ellipse
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              // Card with content
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF9C4),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      data["title"]!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      data["subtitle"]!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    // Next Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (controller.isLastPage) {
                                            await OnboardingManager.setShown();
                                            context.go('/started');
                                          } else {
                                            controller.nextPage();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          controller.isLastPage ? "Get Started" : "Next",
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // Skip Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          await OnboardingManager.setShown();
                                          context.go('/started');
                                        },
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: AppColors.primary,
                                          side: BorderSide.none,
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          "Skip",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // Page Indicator
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: onboardingData.length,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: AppColors.secondary,
                        dotColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
