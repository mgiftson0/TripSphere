import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final double rating;
  final int reviews;
  final String description;

  const DetailsPage({
    required this.image,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 450,  // Increased height for the image
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.blue),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text('$rating ($reviews Reviews)'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle show map action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.map, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Show Map', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildExpandableDescription(description),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                'Facilities',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 100,  // Adjust height as needed
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _facilityCard(Icons.wifi, 'WiFi'),
                  _facilityCard(Icons.fastfood, 'Dinner'),
                  _facilityCard(Icons.bathtub, 'Bath'),
                  _facilityCard(Icons.pool, 'Pool'),
                  _facilityCard(Icons.games, 'Games'),
                  _facilityCard(Icons.hiking, 'Hiking'),
                  _facilityCard(Icons.directions_bike, 'Riding'),
                  // _facilityCard(Icons.sports_skateboarding, 'Skating'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '\$100',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),    
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle booking action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF196EEE),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Increased width
                      elevation: 5, // Add box shadow
                    ),
                    child: Row(
                      children: [
                        Text('Book Now', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_right_alt_rounded, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _facilityCard(IconData icon, String label) {
    return Container(
      width: 80, // Adjust width as needed
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFD0E7FF)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildExpandableDescription(String description) {
    final descriptionText = Text(
      description,
      style: TextStyle(fontSize: 16),
    );

    if (description.length <= 100) {
      return descriptionText;
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          descriptionText,
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              // Handle 'Read More' action
            },
            child: Text(
              'Read More',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      );
    }
  }
}
