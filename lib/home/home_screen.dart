import 'package:bkey_user/theme/app_colors.dart';
import 'package:bkey_user/widget/banner_section.dart';
import 'package:bkey_user/widget/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTimeOption = 'Today';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tickets = [
      {
        'pnrNumber': 'ABC123456789',
        'boardingPoint': 'New Sangavi',
        'boardingAddress': 'Pick up near Sangavi Phata New Sangavi - Pick up near Sangavi Phata',
        'boardingContact': '9595951132, 9028298789',
        'dropPoint': 'DeepNagar',
        'dropAddress': 'DeepNagar, Main Road',
        'sourceCity': 'PUNE',
        'destinationCity': 'PATNA',
        'departureTime': '8:05 PM',
        'arrivalTime': '6:30 AM',
        'departureDate': 'Sun, 13 Jan',
        'arrivalDate': 'Mon, 14 Jan',
        'operatorName': 'Sangitam Travels',
        'busType': '2X1 (30) A/C SLEEPER',
        'seatCount': 1,
        'seatNumbers': 'A12',
      },
    ];
    final List<BannerItem> localBanners = [
      BannerItem(
        assetPath: 'assets/images/banner_1.png',
        title: 'Special Offer',
        description: 'Get 5% off',
        onTap: () {
          print('Banner 1 tapped');
        },
      ),
      BannerItem(
        assetPath: 'assets/images/banner_2.png',
        title: 'New Routes',
        onTap: () {
          print('Banner 2 tapped');
        },
      ),
      BannerItem(
        assetPath: 'assets/images/banner_3.png',
        title: 'Book Now',
        onTap: () {
          print('Banner 3 tapped');
        },
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.65, 0.65, 1.0],
                  colors: [Colors.white, Colors.white, AppColors.primary, AppColors.primary],
                ),
              ),
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipOval(child: Image.asset('assets/images/bus_illustration.png', fit: BoxFit.cover)),
                    ),
                  ),
                  // SizedBox(height: 5),
                  Text(
                    "Hey Kabya!",
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Where are you going?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Image.asset('assets/images/bus.png', height: 90, width: 90),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(color: const Color(0xFFFFF9C4), borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      children: [
                        // Boarding From Field
                        Stack(
                          children: [
                            Column(
                              children: [
                                // Boarding From Field
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Boarding From',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Where are you going Field
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Where are you going?',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 16,
                              top: 36,
                              child: SizedBox(width: 32, height: 32, child: Image.asset('assets/images/swap_icon.png')),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Time Selection Buttons
                        Row(
                          children: [
                            Expanded(child: _buildTimeButton('Today')),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTimeButton('Tomorrow')),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTimeButton('Other')),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Find Buses Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle find buses action
                              // context.push('/bus-list');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Find Buses',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Upcoming Journey",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  if (tickets.isEmpty)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.confirmation_number_outlined, size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text(
                            'No tickets found',
                            style: TextStyle(fontSize: 18, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your booked tickets will appear here',
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    )
                  else
                    Column(
                      children: tickets.map((ticket) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TicketCard(
                            pnrNumber: ticket['pnrNumber'],
                            boardingPoint: ticket['boardingPoint'],
                            boardingAddress: ticket['boardingAddress'],
                            boardingContact: ticket['boardingContact'],
                            dropPoint: ticket['dropPoint'],
                            dropAddress: ticket['dropAddress'],
                            sourceCity: ticket['sourceCity'],
                            destinationCity: ticket['destinationCity'],
                            departureTime: ticket['departureTime'],
                            arrivalTime: ticket['arrivalTime'],
                            departureDate: ticket['departureDate'],
                            arrivalDate: ticket['arrivalDate'],
                            operatorName: ticket['operatorName'],
                            busType: ticket['busType'],
                            seatCount: ticket['seatCount'],
                            seatNumbers: ticket['seatNumbers'],
                          ),
                        );
                      }).toList(),
                    ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Special Offer",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            BannerSection(banners: localBanners),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButton(String text) {
    final isSelected = selectedTimeOption == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeOption = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (text == 'Other') const Icon(Icons.calendar_today, size: 16, color: AppColors.primary),
            if (text == 'Other') const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
