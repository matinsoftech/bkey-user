import 'package:bkey_user/widget/app_bar.dart';
import 'package:bkey_user/widget/ticket_card.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

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
      {
        'pnrNumber': 'DEF987654321',
        'boardingPoint': 'Shivaji Nagar',
        'boardingAddress': 'Near Railway Station, Shivaji Nagar Bus Stand',
        'boardingContact': '9876543210, 9123456789',
        'dropPoint': 'Gandhi Maidan',
        'dropAddress': 'Gandhi Maidan, Near Station Road',
        'sourceCity': 'PUNE',
        'destinationCity': 'PATNA',
        'departureTime': '9:30 PM',
        'arrivalTime': '8:15 AM',
        'departureDate': 'Mon, 14 Jan',
        'arrivalDate': 'Tue, 15 Jan',
        'operatorName': 'Express Travels',
        'busType': '2X2 (40) NON A/C SEATER',
        'seatCount': 2,
        'seatNumbers': 'B15, B16',
      },
      {
        'pnrNumber': 'GHI456789123',
        'boardingPoint': 'Katraj',
        'boardingAddress': 'Katraj Bus Terminal, Platform 3',
        'boardingContact': '9988776655, 9112233445',
        'dropPoint': 'Danapur',
        'dropAddress': 'Danapur Railway Station, Main Gate',
        'sourceCity': 'PUNE',
        'destinationCity': 'PATNA',
        'departureTime': '10:15 PM',
        'arrivalTime': '9:45 AM',
        'departureDate': 'Tue, 15 Jan',
        'arrivalDate': 'Wed, 16 Jan',
        'operatorName': 'Royal Roadways',
        'busType': '2X1 (32) A/C SLEEPER',
        'seatCount': 1,
        'seatNumbers': 'C08',
      },
      {
        'pnrNumber': 'JKL789123456',
        'boardingPoint': 'Wakad',
        'boardingAddress': 'Wakad IT Park, Main Entrance',
        'boardingContact': '9334455667, 9887766554',
        'dropPoint': 'Rajendra Nagar',
        'dropAddress': 'Rajendra Nagar Terminal, Gate 2',
        'sourceCity': 'PUNE',
        'destinationCity': 'PATNA',
        'departureTime': '7:45 PM',
        'arrivalTime': '5:30 AM',
        'departureDate': 'Wed, 16 Jan',
        'arrivalDate': 'Thu, 17 Jan',
        'operatorName': 'City Express',
        'busType': '2X2 (45) A/C SEATER',
        'seatCount': 3,
        'seatNumbers': 'D20, D21, D22',
      },
      // Add more tickets here when you get API data
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: CustomAppBar(
        title: 'My Tickets',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: ClipOval(child: Image.asset('assets/images/bus_illustration.png', fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
      body: tickets.isEmpty
          ? Center(
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
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return TicketCard(
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
                );
              },
            ),
    );
  }
}
