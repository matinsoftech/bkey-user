import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSection extends StatefulWidget {
  final List<BannerItem> banners;

  const BannerSection({super.key, required this.banners});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.banners.length,
      itemBuilder: (context, index, realIndex) {
        final banner = widget.banners[index];
        return _buildBannerCard(banner);
      },
      options: CarouselOptions(
        height: 160,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
    );
  }

  Widget _buildBannerCard(BannerItem banner) {
    return GestureDetector(
      onTap: () {
        // Handle banner tap
        if (banner.onTap != null) {
          banner.onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: banner.imageUrl != null
              ? Image.network(
                  banner.imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderBanner();
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildPlaceholderBanner();
                  },
                )
              : Image.asset(
                  banner.assetPath!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderBanner();
                  },
                ),
        ),
      ),
    );
  }

Widget _buildPlaceholderBanner() {
    return Container(
      width: double.infinity,
      color: Colors.white, // pure white background
      child: const Center(child: Icon(Icons.image_outlined, size: 48, color: Colors.grey)),
    );
  }

}

class BannerItem {
  final String? imageUrl; // For API images
  final String? assetPath; // For local assets
  final String? title;
  final String? description;
  final VoidCallback? onTap;

  BannerItem({this.imageUrl, this.assetPath, this.title, this.description, this.onTap})
    : assert(imageUrl != null || assetPath != null, 'Either imageUrl or assetPath must be provided');
}
