import 'package:flutter/material.dart';
import 'package:bkey_user/app_colors.dart';
import 'confirm_screen.dart';

class BusDetailScreen extends StatefulWidget {
  final Map<String, dynamic> bus;

  const BusDetailScreen({super.key, required this.bus});

  @override
  State<BusDetailScreen> createState() => _BusDetailScreenState();
}

class _BusDetailScreenState extends State<BusDetailScreen> {
  int? selectedSeatIndex;
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
          Icon(Icons.filter_list, color: Colors.white),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          _header(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  _busCard(),
                  const SizedBox(height: 16),
                  _seatLegend(),
                  const SizedBox(height: 20),
                  _seatLayout(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _confirmButton(),
                  ),
                  // _confirmButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          Text(
            'Select your seat!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Brt',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.swap_horiz, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Pokhara',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '12th - Jan - 2023 | Monday',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // ---------------- BUS CARD ----------------
  Widget _busCard() {
    final bus = widget.bus;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9C4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bus['operatorName'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(bus['time']),
                Text('${bus['seatsLeft']} Seats left'),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '₹ ${bus['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Select Seat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- SEAT LEGEND ----------------
  Widget _seatLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _LegendItem(color: Color.fromARGB(255, 66, 176, 70), text: 'Booked'),
        _LegendItem(
          color: Color.fromARGB(255, 194, 194, 194),
          text: 'Available',
        ),
        _LegendItem(
          color: Color.fromARGB(255, 244, 211, 111),
          text: 'Your Seat',
        ),
      ],
    );
  }

  // ---------------- SEAT LAYOUT ----------------
  Widget _seatLayout() {
    return Expanded(
      child: GridView.builder(
        itemCount: 7,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          bool isBooked = index == 1 || index == 2;
          bool isSelected = selectedSeatIndex == index;

          Color color;
          if (isBooked) {
            color = Colors.green;
          } else if (isSelected) {
            color = const Color.fromARGB(255, 244, 211, 111);
          } else {
            color = Colors.grey.shade300;
          }

          return GestureDetector(
            onTap:
                isBooked
                    ? null
                    : () {
                      setState(() {
                        selectedSeatIndex = index;
                      });
                    },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
          // if (index == 1 || index == 2) {
          //   color = Colors.green; // booked
          // } else if (index == 5) {
          //   color = const Color.fromARGB(255, 244, 211, 111); // your seat
          // } else {
          //   color = Colors.grey.shade300; // available
          // }

          // return Container(
          //   decoration: BoxDecoration(
          //     color: color,
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          // );
        },
      ),
    );
  }

  Widget _confirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed:
            selectedSeatIndex == null
                ? null
                : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmScreen(),
                    ),
                  );
                },
        child: const Text(
          "Confirm",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ---------------- LEGEND WIDGET ----------------
class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
