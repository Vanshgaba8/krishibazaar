import 'package:flutter/material.dart';

class RoleSelectionContainer extends StatelessWidget {
  final String roleText;
  final String imagePath;
  final String routeName;

  const RoleSelectionContainer({
    super.key,
    required this.roleText,
    required this.imagePath,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    // Getting the screen height and width using MediaQuery
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to the appropriate page using the route name
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green[100],
          ),
          height: h * 0.25,
          width: w * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 23,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: '  I am '),
                      TextSpan(
                        text: roleText,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: roleText == 'Farmer'
                              ? const Color.fromARGB(255, 8, 99, 11)
                              : Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: w / 4,
                child: Image.asset(imagePath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
