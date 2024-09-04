import 'package:flutter/material.dart';
import 'package:tripsphere/pages/details_page.dart'; 
class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  // Track whether to show all images or just the first two
  bool _showAll = false;

  // Example images list
  final List<Map<String, dynamic>> _images = [
    {
      'image': 'lib/images/pop3.png',
      'title': 'Beautiful Place 1',
      'rating': 4.5,
      'reviews': 299,
      'description': 'This is a beautiful place to visit. Lots of scenic views and activities to enjoy.',
    },
    {
      'image': 'lib/images/pop.png',
      'title': 'Beautiful Place 2',
      'rating': 4.7,
      'reviews': 150,
      'description': 'A serene environment perfect for relaxation and unwinding.',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showAll = !_showAll;
                  });
                },
                child: Text(
                  _showAll ? 'See Less' : 'See All',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Images
          Wrap(
            spacing: 8, 
            runSpacing: 8, 
            children: _buildImages(context),
          ),
        ],
      ),
    );
  }

  // Build the images widgets
  List<Widget> _buildImages(BuildContext context) {
    // Show only two images initially, show all if _showAll is true
    final imagesToShow = _showAll ? _images : _images.take(2).toList();

    return imagesToShow.map((imageData) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                image: imageData['image'],
                title: imageData['title'],
                rating: imageData['rating'],
                reviews: imageData['reviews'],
                description: imageData['description'],
              ),
            ),
          );
        },
        child: imageData['image'].contains('pop1.png')
            ? Image.asset(
                imageData['image'],
                width: 200,
                height: 290,
                fit: BoxFit.cover,
              )
            : Image.asset(
                imageData['image'],
                width: (MediaQuery.of(context).size.width - 48) / 2, 
                fit: BoxFit.cover,
              ),
      );
    }).toList();
  }
}
