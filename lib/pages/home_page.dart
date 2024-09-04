import 'package:flutter/material.dart';
import 'explore_page.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'lib/images/home.bg.png', 
            fit: BoxFit.cover,
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.only(top: 40.0), 
                child: Text(
                  'TripSphere',
                  style: TextStyle(
                    fontFamily: 'Roboto', 
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(), 
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Bottom text
                    Text(
                      'Plan your luxurious vacation',
                      style: TextStyle(
                        fontFamily: 'Georgia', 
                        fontSize: 28, 
                        fontWeight: FontWeight.normal, 
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Explore button
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8, 
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to ExplorePage when button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ExplorePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, 
                          padding: EdgeInsets.symmetric(vertical: 15),
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        child: Text(
                          'Explore',
                          style: TextStyle(color: Colors.white), 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
