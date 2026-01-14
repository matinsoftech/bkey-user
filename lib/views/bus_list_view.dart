import 'package:bkey_user/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bkey_user/views/bus_detail_screen.dart';

class BusListScreen extends StatefulWidget {
  const BusListScreen({super.key});

  @override
  State<BusListScreen> createState() => _BusListScreenState();
}

class _BusListScreenState extends State<BusListScreen> {
  final List<Map<String, dynamic>> buses = [
    {
      'operatorName': 'Business Class',
      // 'busType': 'A/C Sleeper (2+2)',
      // 'departureTime': '6:00 PM',
      // 'arrivalTime': '3:00 AM',
      'time': '6:00 PM - 3:00 AM',
      'duration': '9h',
      'seatsLeft': 2,
      'price': 2500,
      // 'rating': 4.5,
      'isHighlighted': false,
    },
    {
      'operatorName': 'Economy Class',
      // 'busType': 'A/C Sleeper 2+1',
      // 'departureTime': '8:15 PM',
      // 'arrivalTime': '6:00 AM',
      'time': '6:00 PM - 3:00 AM',
      'duration': '9h 45m',
      'seatsLeft': 2,
      'price': 1500,
      // 'rating': 4.2,
      'isHighlighted': true,
    },
    {
      'operatorName': 'Resource Class',
      // 'busType': 'A/C Sleeper (2+2)',
      // 'departureTime': '8:30 PM',
      // 'arrivalTime': '5:30 AM',
      'time': '6:00 PM - 3:00 AM',
      'duration': '9h',
      'seatsLeft': 2,
      'price': 3200,
      // 'rating': 4.7,
      'isHighlighted': false,
    },
    // {
    //   'operatorName': 'Shri Swaminarayan Travels',
    //   'busType': 'Non A/C Sleeper 2+1',
    //   'departureTime': '7:25 PM',
    //   'arrivalTime': '6:15 AM',
    //   'duration': '10h 50m',
    //   'seatsLeft': 4,
    //   'price': 999,
    //   'rating': 4.8,
    //   'isHighlighted': false,
    // },
    // {
    //   'operatorName': 'Sangitam Travels',
    //   'busType': 'A/C Sleeper (2+2)',
    //   'departureTime': '6:00 PM',
    //   'arrivalTime': '3:00 AM',
    //   'duration': '9h',
    //   'seatsLeft': 15,
    //   'price': 600,
    //   'rating': 4.4,
    //   'isHighlighted': false,
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                const Text(
                  'Select Vehicle Type!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Brt',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/vertical_swap.png',
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    ),
                    Text(
                      'Pokhara',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '12th - Jan - 2023 | Monday',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/amico.png',
                  height: 80,
                  width: double.infinity,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: buses.length,
                itemBuilder: (context, index) {
                  final bus = buses[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildBusCard(bus),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusCard(Map<String, dynamic> bus) {
    final bool isHighlighted = bus['isHighlighted'] ?? false;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusDetailScreen(bus: bus)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isHighlighted ? Colors.orange : Colors.grey.shade300,
            width: isHighlighted ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      bus['operatorName'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '₹ ${bus['price']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 4),
              // Text(bus['busType'], style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: Text(bus['departureTime'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  // ),
                  // Icon(Icons.arrow_forward, size: 16, color: Colors.grey.shade600),
                  // const SizedBox(width: 8),
                  Text(
                    bus['time'],
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    bus['duration'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    '${bus['seatsLeft']} out of 7 Seats left',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          bus['seatsLeft'] <= 5
                              ? Colors.red
                              : AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.airline_seat_recline_normal,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.wifi, size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.local_activity,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.more_horiz,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
