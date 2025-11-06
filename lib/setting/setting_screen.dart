import 'package:bkey_user/theme/app_colors.dart';
import 'package:bkey_user/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Account'),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/bus_illustration.png'), // Add your image
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Juliana Carter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('juliana@example.com', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Share referral code',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.edit, color: AppColors.primary),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // General Section
            _buildSectionTitle('General'),
            _buildSettingsCard([
              _buildSettingItem(Icons.person_outline, 'Personal Info', imagePath: 'assets/images/profile.png'),
              _buildSettingItem(Icons.confirmation_number_outlined, 'My Ticket', imagePath: 'assets/images/ticket.png'),
              _buildSettingItem(
                Icons.account_balance_wallet_outlined,
                'My Wallet',
                imagePath: 'assets/images/wallet.png',
                onTap: () {
                  context.push('/wallet');
                },
              ),
              _buildSettingItem(Icons.card_giftcard_outlined, 'Refer & Earn', imagePath: 'assets/images/refer.png'),
              _buildSettingItem(Icons.language, 'Language'),
              _buildSettingItem(Icons.help_outline, 'FAQ'),
              _buildSettingItem(Icons.dark_mode_outlined, 'Dark Mode', imagePath: 'assets/images/dark_mode.png'),
              _buildSettingItem(
                Icons.notifications_outlined,
                'Notification',
                showDivider: false,
                imagePath: 'assets/images/notification.png',
              ),
            ]),

            const SizedBox(height: 24),

            // About Section
            _buildSectionTitle('About'),
            _buildSettingsCard([
              _buildSettingItem(Icons.privacy_tip_outlined, 'Privacy Policy', imagePath: 'assets/images/privacy.png'),
              _buildSettingItem(Icons.description_outlined, 'Terms & Conditions', imagePath: 'assets/images/terms.png'),
              _buildSettingItem(Icons.support_agent_outlined, 'Live Support', imagePath: 'assets/images/support.png'),
              _buildSettingItem(Icons.star_outline, 'Rate & Review', imagePath: 'assets/images/rate.png'),
              _buildSettingItem(Icons.mail_outline_rounded, 'Contact Us', showDivider: false),
            ]),

            const SizedBox(height: 24),

            // Account Actions
            _buildSettingsCard([
              _buildSettingItem(Icons.logout, 'Log Out', isLogout: true,onTap: () {
                context.go('/started');
              }),
              _buildSettingItem(Icons.delete_outline, 'Delete Account', isDelete: true, showDivider: false),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5)],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingItem(
    IconData icon,
    String title, {
    bool isLogout = false,
    bool isDelete = false,
    bool showDivider = true,
    String? imagePath,
    VoidCallback? onTap,
  }) {
    Color textColor = Colors.black;
    Color iconColor = AppColors.primary;

    return Column(
      children: [
        ListTile(
          leading: imagePath != null
              ? Image.asset(imagePath, width: 24, height: 24, color: iconColor)
              : Icon(icon, color: iconColor),
          title: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios, size: 20, color: iconColor),
          onTap: onTap,
        ),
        if (showDivider)
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: const Divider(height: 1, thickness: 0.3)),
      ],
    );
  }
}
