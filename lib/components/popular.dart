import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  // Track whether to show all images or just the first two
  bool _showAll = false;

  // Example images list
  final List<String> _images = [
    'lib/images/pop.png',
    'lib/images/pop1.png',
    'lib/images/pop.png',
    'lib/images/pop1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                fontWeight: FontWeight.bold,
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
          children: _buildImages(),
        ),
      ],
    );
  }

  // Build the images widgets
  List<Widget> _buildImages() {
    // Show only two images initially, show all if _showAll is true
    final imagesToShow = _showAll ? _images : _images.take(2).toList();

    return imagesToShow.map((image) {
      return Image.asset(
        image,
        width: (MediaQuery.of(context).size.width - 48) / 2, // Adjusting for spacing
        fit: BoxFit.cover,
      );
    }).toList();
  }
}
