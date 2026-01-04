import 'package:bkey_user/app_colors.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String pnrNumber;
  final String boardingPoint;
  final String boardingAddress;
  final String boardingContact;
  final String dropPoint;
  final String dropAddress;
  final String sourceCity;
  final String destinationCity;
  final String departureTime;
  final String arrivalTime;
  final String departureDate;
  final String arrivalDate;
  final String operatorName;
  final String busType;
  final int seatCount;
  final String? seatNumbers;

  const TicketCard({
    super.key,
    required this.pnrNumber,
    required this.boardingPoint,
    required this.boardingAddress,
    required this.boardingContact,
    required this.dropPoint,
    required this.dropAddress,
    required this.sourceCity,
    required this.destinationCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureDate,
    required this.arrivalDate,
    required this.operatorName,
    required this.busType,
    required this.seatCount,
    this.seatNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PNR Header
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 8),
              child: Text(
                'PNR/Ticket No: $pnrNumber',
                style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
      
            Divider(height: 1, color: Colors.grey.shade200),
      
            // Content
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
              child: Column(
                children: [
                  // Boarding and Drop Points with Cities
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Boarding and Drop info
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Boarding Point
                            _buildPointSection(
                              imagePath: 'assets/images/arrow_right.png',
                              title: 'Boarding Point',
                              time: departureTime,
                              details: boardingPoint,
                              address: boardingAddress,
                              contact: boardingContact,
                            ),
      
                            const SizedBox(height: 16),
      
                            // Drop Point
                            _buildPointSection(
                              imagePath: 'assets/images/arrow_left.png',
                              title: 'Drop Point',
                              time: arrivalTime,
                              details: dropPoint,
                              address: dropAddress,
                            ),
                          ],
                        ),
                      ),
      
                      const SizedBox(width: 16),
      
                      // Vertical divider
                      Container(height: 170, width: 1, color: Colors.grey.shade300),
      
                      const SizedBox(width: 16),
                      // Right side - Cities and Times
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
      
                          children: [
                            // Source City
                            Text(
                              sourceCity.toUpperCase(),
                              style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              departureTime,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                            // const SizedBox(height: 2),
                            Text(departureDate, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
      
                            const SizedBox(height: 10),
      
                            Text(
                              'TO',
                              style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w600),
                            ),
      
                            const SizedBox(height: 10),
      
                            // Destination City
                            Text(
                              destinationCity.toUpperCase(),
                              style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              arrivalTime,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                            // const SizedBox(height: 2),
                            Text(arrivalDate, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade200),
      
            // Bus Details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.directions_bus, color: Colors.black87, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          operatorName,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          busType.toUpperCase(),
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$seatCount ${seatCount > 1 ? 'Seats' : 'Seat'}',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointSection({
    required String imagePath,
    required String title,
    required String time,
    required String details,
    required String address,
    String? contact,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 16, height: 16, color: Colors.black),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                '$time, $details',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black87, height: 1.3),
              ),
              const SizedBox(height: 2),
              Text(address, style: TextStyle(color: Colors.grey.shade700, fontSize: 11, height: 1.3)),
              if (contact != null) ...[
                const SizedBox(height: 2),
                Text(contact, style: TextStyle(color: Colors.grey.shade700, fontSize: 11)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
