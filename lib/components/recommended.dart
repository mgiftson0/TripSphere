import 'package:flutter/material.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    // Example images and subtitles
    final List<Map<String, String>> _recommendations = [
      {'image': 'lib/images/rec1.png', 'subtitle': 'Explore Accra'},
      {'image': 'lib/images/rec3.png', 'subtitle': 'Visit Cape Coast'},
      {'image': 'lib/images/rec1.png', 'subtitle': 'Discover Kumasi'},
      {'image': 'lib/images/rec3.png', 'subtitle': 'Relax in Takoradi'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Recommended',
              style: TextStyle(
                fontSize: 21,
                // fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Images with Subtitles
          Row(
            children: _recommendations.map((rec) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Border radius for images
                      child: Image.asset(
                        rec['image']!,
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      rec['subtitle']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
