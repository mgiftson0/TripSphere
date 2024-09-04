import 'package:flutter/material.dart';
import 'package:tripsphere/components/popular.dart';
import 'package:tripsphere/components/recommended.dart'; 

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _selectedCategory = 'Location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 14,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Accra, Ghana',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.blue,
                        size: 23,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'TripShere',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF3F8FE),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Find things to do...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildCategoryButtons(),
                ),
              ),
              SizedBox(height: 20),
              Popular(),
              SizedBox(height: 20),
              Recommendation(), 
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        margin: EdgeInsets.only(bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border, color: Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, color: Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Colors.grey),
              label: '',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            // Handle bottom navigation taps here
          },
        ),
      ),
    );
  }

  List<Widget> _buildCategoryButtons() {
    final categories = ['Location', 'Hotels', 'Food', 'Adventure', 'Games'];
    return categories.map((category) {
      final isActive = _selectedCategory == category;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedCategory = category;
            });
          },
          style: ElevatedButton.styleFrom(
            primary: isActive ? Color(0xFFF3F8FE) : Colors.white,
            onPrimary: isActive ? Colors.blue : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(
              color: isActive ? Colors.blue : Colors.grey,
              width: 1,
            ),
          ),
          child: Text(category),
        ),
      );
    }).toList();
  }
}
