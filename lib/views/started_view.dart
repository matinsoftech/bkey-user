import 'package:bkey_user/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Decorative ellipses in top right
          // Positioned(
          //   top: -150,
          //   right: -190,
          //   child: Container(
          //     width: 400,
          //     height: 400,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(200),
          //       color: AppColors.primary.withOpacity(0.3),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: -100,
          //   right: -120,
          //   child: Container(
          //     width: 340,
          //     height: 340,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(170),
          //       color: AppColors.primary.withOpacity(0.15),
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Column(
              children: [
                // const Spacer(flex: 1),
                // SizedBox(height: 120),
                // Image.asset('assets/images/bkey-get.png', height: 240, fit: BoxFit.contain, width: double.infinity),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/bkey-get.png', height:260, fit: BoxFit.cover,),
                ),
                Image.asset('assets/images/bus_illustration.png', height: 240, fit: BoxFit.cover, width: double.infinity),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/sign-up');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Sign in link
                InkWell(
                  onTap: () {
                    context.push('/login');
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Already have an account',
                          style: TextStyle(color: AppColors.primary, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
