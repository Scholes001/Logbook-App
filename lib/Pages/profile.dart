import 'package:flutter/material.dart';
import 'package:logbook_app/Pages/organization profile.dart';
class Profile extends StatefulWidget {
  final VoidCallback onBackToHome;

  const Profile({super.key, required this.onBackToHome});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF2FF),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Back arrow + centered title
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: widget.onBackToHome,
                      child: const Icon(Icons.arrow_back, size: 24),
                    ),
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Avatar + greeting (centered)
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // TODO: handle picture upload later
                      },
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Hello, Scholes! 👋',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'IT Student',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Info card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF2FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF3B82F6), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.badge, size: 18, color: Color(0xFF3B82F6)),
                        SizedBox(width: 8),
                        Text(
                          'Student Information',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildInfoRow(Icons.person_outline, 'Full Name', 'Paul Scholes'),
                    Divider(height: 24, color: const Color(0xFF3B82F6).withOpacity(0.4)),
                    _buildInfoRow(Icons.email_outlined, 'Student Email', 'paulsch@futa.edu'),
                    Divider(height: 24, color: const Color(0xFF3B82F6).withOpacity(0.4)),
                    _buildInfoRow(Icons.account_tree_outlined, 'Department', 'Information Technology'),
                    Divider(height: 24, color: const Color(0xFF3B82F6).withOpacity(0.4)),
                    _buildInfoRow(Icons.badge_outlined, 'Matric Number', 'IFT/29/2390'),
                    Divider(height: 24, color: const Color(0xFF3B82F6).withOpacity(0.4)),

                    GestureDetector(
                      onTap: () {
                        // CHANGED: navigate to Organization Profile
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrganizationProfile(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.account_balance_outlined, size: 18, color: Color(0xFF3B82F6)),
                              SizedBox(width: 8),
                              Text(
                                'Organization Profile',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.chevron_right, size: 20, color: Colors.black),
                        ],
                      ),
                    ),
                    Divider(height: 24, color: const Color(0xFF3B82F6).withOpacity(0.4)),

                    Row(
                      children: const [
                        Icon(Icons.account_circle_outlined, size: 18, color: Color(0xFF3B82F6)),
                        SizedBox(width: 8),
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    GestureDetector(
                      onTap: () {
                        // TODO: navigate to Edit Profile
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.person_outline, size: 18, color: Color(0xFF3B82F6)),
                              SizedBox(width: 8),
                              Text(
                                'Edit Profile',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const Icon(Icons.chevron_right, size: 20, color: Colors.black),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    Divider(height: 1, color: const Color(0xFF3B82F6).withOpacity(0.4)),
                    const SizedBox(height: 16),

                    GestureDetector(
                      onTap: () {
                        // TODO: handle logout
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.logout, size: 18, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                'LOG OUT',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.chevron_right, size: 20, color: Colors.red),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF3B82F6)),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
            ),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}