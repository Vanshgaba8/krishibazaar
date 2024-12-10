import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:krishibazaar/view_model/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    // Fetch profile data when the widget is initialized
    Provider.of<ProfileViewModel>(context, listen: false)
        .fetchUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      body: profileViewModel.loading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          : profileViewModel.userProfile == null
              ? const Center(
                  child: Text(
                    'No profile data available',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.green.shade100,
                              child: const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildInfoBox(
                            icon: Icons.person,
                            title: 'Name',
                            value: profileViewModel.userProfile!.user?.name ??
                                'N/A',
                          ),
                          const SizedBox(height: 10),
                          _buildInfoBox(
                            icon: Icons.email,
                            title: 'Email',
                            value: profileViewModel.userProfile!.user?.email ??
                                'N/A',
                          ),
                          const SizedBox(height: 10),
                          _buildInfoBox(
                            icon: Icons.phone,
                            title: 'Phone',
                            value: profileViewModel.userProfile!.user?.phone ??
                                'N/A',
                          ),
                          const SizedBox(height: 10),
                          _buildInfoBox(
                            icon: Icons.location_city,
                            title: 'Address',
                            value:
                                profileViewModel.userProfile!.user?.address ??
                                    'N/A',
                          ),
                          const SizedBox(height: 10),
                          _buildInfoBox(
                            icon: Icons.badge,
                            title: 'Role',
                            value: profileViewModel.userProfile!.user?.role ??
                                'N/A',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }

  Widget _buildInfoBox(
      {required IconData icon, required String title, required String value}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green.shade200),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
