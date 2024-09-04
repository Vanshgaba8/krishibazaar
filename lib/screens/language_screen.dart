import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(
              0xFFFFF8D8), // Set the background color to match the rest of the app
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40), // Top padding
                const Text(
                  'Select a language',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5D4037), // Dark brown color for text
                  ),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  alignment: WrapAlignment.center,
                  children: [
                    buildLanguageButton(context, 'ह', 'हिंदी', Colors.orange),
                    buildLanguageButton(context, 'ব', 'বাংলা', Colors.teal),
                    buildLanguageButton(context, 'తె', 'తెలుగు', Colors.amber),
                    buildLanguageButton(context, 'म', 'मराठी', Colors.purple),
                    buildLanguageButton(context, 'த', 'தமிழ்', Colors.blue),
                    buildLanguageButton(
                        context, 'اردو', 'اردو', Colors.deepPurple),
                    buildLanguageButton(context, 'ગુ', 'ગુજરાતી', Colors.red),
                    buildLanguageButton(context, 'ಕ', 'ಕನ್ನಡ', Colors.cyan),
                    buildLanguageButton(context, 'മ', 'മലയാളം', Colors.green),
                    buildLanguageButton(context, 'ਪੰ', 'ਪੰਜਾਬੀ', Colors.red),
                    buildLanguageButton(context, 'EN', 'English',
                        const Color(0xFF1E3A8A)), // Added English option
                  ],
                ),
                const SizedBox(height: 40), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLanguageButton(
      BuildContext context, String langSymbol, String langName, Color color) {
    return GestureDetector(
      onTap: () {
        // Handle language selection
        print('$langName selected');

        // Navigate back to the Login screen
        Navigator.pop(context);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: color.withOpacity(0.2),
            child: Text(
              langSymbol,
              style: TextStyle(
                  fontSize: 24, color: color, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            langName,
            style: const TextStyle(
                fontSize: 16, color: Color(0xFF5D4037)), // Dark brown for text
          ),
        ],
      ),
    );
  }
}
