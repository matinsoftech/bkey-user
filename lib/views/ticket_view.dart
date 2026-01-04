import 'package:bkey_user/widget/app_bar.dart';
import 'package:bkey_user/widget/ticket_card.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tickets = [
      {
        'pnrNumber': 'BKY778899100',
        'boardingPoint': 'Bargachhi',
        'boardingAddress': 'Bkey Travels Office, Near Bargachhi Chowk, Biratnagar',
        'boardingContact': '9801234567, 021-515151',
        'dropPoint': 'Kalanki',
        'dropAddress': 'Kalanki Bus Stop, Kathmandu',
        'sourceCity': 'BIRATNAGAR',
        'destinationCity': 'KATHMANDU',
        'departureTime': '7:30 PM',
        'arrivalTime': '6:00 AM',
        'departureDate': 'Sun, 13 Jan',
        'arrivalDate': 'Mon, 14 Jan',
        'operatorName': 'Bkey Travels',
        'busType': '2X1 (30) LUXURY AC SLEEPER',
        'seatCount': 1,
        'seatNumbers': 'A5',
      },
      {
        'pnrNumber': 'BKY112233445',
        'boardingPoint': 'Gongabu Bus Park',
        'boardingAddress': 'New Bus Park, Counter No. 24, Kathmandu',
        'boardingContact': '9851012345, 9841234567',
        'dropPoint': 'Prithvi Chowk',
        'dropAddress': 'Bkey Station, Prithvi Chowk, Pokhara',
        'sourceCity': 'KATHMANDU',
        'destinationCity': 'POKHARA',
        'departureTime': '8:00 AM',
        'arrivalTime': '2:30 PM',
        'departureDate': 'Mon, 14 Jan',
        'arrivalDate': 'Mon, 14 Jan',
        'operatorName': 'Bkey Travels',
        'busType': '2X2 (40) DELUXE SEATER',
        'seatCount': 2,
        'seatNumbers': 'B10, B11',
      },
      {
        'pnrNumber': 'BKY556677889',
        'boardingPoint': 'Bhanu Chowk',
        'boardingAddress': 'Bkey Travels Counter, Bhanu Chowk, Dharan',
        'boardingContact': '9812345678, 025-525252',
        'dropPoint': 'Koteshwor',
        'dropAddress': 'Koteshwor Chowk, Kathmandu',
        'sourceCity': 'DHARAN',
        'destinationCity': 'KATHMANDU',
        'departureTime': '6:45 PM',
        'arrivalTime': '5:15 AM',
        'departureDate': 'Tue, 15 Jan',
        'arrivalDate': 'Wed, 16 Jan',
        'operatorName': 'Bkey Travels',
        'busType': '2X1 (32) SUPER DELUXE AC',
        'seatCount': 1,
        'seatNumbers': 'C1',
      },
      {
        'pnrNumber': 'BKY990011223',
        'boardingPoint': 'Itahari Chowk',
        'boardingAddress': 'Main Highway Junction, Bkey Travels Stand, Itahari',
        'boardingContact': '9867543210, 9800001111',
        'dropPoint': 'Bus Park',
        'dropAddress': 'Kakarvitta Main Bus Park',
        'sourceCity': 'ITAHARI',
        'destinationCity': 'KAKARVITTA',
        'departureTime': '10:00 AM',
        'arrivalTime': '1:00 PM',
        'departureDate': 'Wed, 16 Jan',
        'arrivalDate': 'Wed, 16 Jan',
        'operatorName': 'Bkey Travels',
        'busType': '2X2 (45) NON A/C HIACE',
        'seatCount': 1,
        'seatNumbers': 'H12',
      },
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
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey, width: 1)),
              child: ClipOval(child: Image.asset('assets/images/bus_illustration.png', fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
      body:
          tickets.isEmpty
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
