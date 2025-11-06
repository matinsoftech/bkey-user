import 'package:bkey_user/theme/app_colors.dart';
import 'package:bkey_user/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // This will be replaced with API call in future
  List<NotificationItem> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  // Replace this with actual API call
  Future<void> _loadNotifications() async {
    // Simulate API call
    // await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      notifications = _getDummyNotifications();
    });
  }

  // Dummy data - replace with API response
  List<NotificationItem> _getDummyNotifications() {
    return [
      NotificationItem(
        id: '1',
        title: 'Daily check-in ready',
        message: 'Take a moment to log how you feel and set an intention',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
        isRead: false,
        type: NotificationType.checkIn,
      ),
      NotificationItem(
        id: '2',
        title: 'Today discount',
        message: 'Hot discount for today user in our ticket pricing',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
        isRead: false,
        type: NotificationType.discount,
      ),
      NotificationItem(
        id: '3',
        title: 'Today discount',
        message: 'Hot discount for today user in our ticket pricing',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
        isRead: false,
        type: NotificationType.discount,
      ),
      NotificationItem(
        id: '4',
        title: 'Daily check-in ready',
        message: 'Take a moment to log how you feel and set an intention',
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 11, minutes: 16)),
        isRead: true,
        type: NotificationType.checkIn,
      ),
      NotificationItem(
        id: '5',
        title: 'Today discount',
        message: 'Hot discount for today user in our ticket pricing',
        timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 11, minutes: 5)),
        isRead: true,
        type: NotificationType.discount,
      ),
      NotificationItem(
        id: '6',
        title: 'Today discount',
        message: 'Hot discount for today user in our ticket pricing',
        timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 14)),
        isRead: true,
        type: NotificationType.discount,
      ),
    ];
  }

  Map<String, List<NotificationItem>> _groupNotificationsByDate() {
    final Map<String, List<NotificationItem>> grouped = {'Today': [], 'Earlier': []};

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    for (var notification in notifications) {
      final notificationDate = DateTime(
        notification.timestamp.year,
        notification.timestamp.month,
        notification.timestamp.day,
      );

      if (notificationDate.isAtSameMomentAs(today)) {
        grouped['Today']!.add(notification);
      } else {
        grouped['Earlier']!.add(notification);
      }
    }

    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final groupedNotifications = _groupNotificationsByDate();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const CustomAppBar(title: 'Notifications'),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: _loadNotifications,
              child: ListView(
                padding: const EdgeInsets.only(top: 16),
                children: [
                  // Today Section
                  if (groupedNotifications['Today']!.isNotEmpty) ...[
                    _buildSectionHeader('Today'),
                    ...groupedNotifications['Today']!.map((notification) => _buildNotificationCard(notification)),
                  ],

                  // Earlier Section
                  if (groupedNotifications['Earlier']!.isNotEmpty) ...[
                    _buildSectionHeader('Earlier'),
                    ...groupedNotifications['Earlier']!.map((notification) => _buildNotificationCard(notification)),
                  ],

                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // _handleNotificationTap(notification);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar/Icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                ),

                const SizedBox(width: 12),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification.message,
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.4),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _getTimeAgo(notification.timestamp),
                        style: TextStyle(fontSize: 12, color: Colors.green.shade600, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Text('We\'ll notify you when something arrives', style: TextStyle(fontSize: 14, color: Colors.grey.shade500)),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday at ${DateFormat('h:mm a').format(timestamp.toLocal())}';
    } else {
      return DateFormat('EEE at h:mm a').format(timestamp.toLocal());
    }
  }
}

// Models for API integration
enum NotificationType { checkIn, discount, booking, general }

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  bool isRead;
  final NotificationType type;
  final Map<String, dynamic>? metadata;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
    required this.type,
    this.metadata,
  });

  // Factory constructor for API response
  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
      isRead: json['isRead'] ?? false,
      type: _parseNotificationType(json['type']),
      metadata: json['metadata'],
    );
  }

  static NotificationType _parseNotificationType(String? type) {
    switch (type?.toLowerCase()) {
      case 'checkin':
        return NotificationType.checkIn;
      case 'discount':
        return NotificationType.discount;
      case 'booking':
        return NotificationType.booking;
      default:
        return NotificationType.general;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'type': type.toString().split('.').last,
      'metadata': metadata,
    };
  }
}
