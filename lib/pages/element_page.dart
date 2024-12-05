import 'package:flutter/material.dart';

class ElementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Unsur-Unsur Kebugaran Jasmani',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildElementCard(
              title: 'Kekuatan (Strength)',
              description:
                  'Kemampuan otot untuk mengatasi beban atau tahanan. Penting untuk aktivitas yang membutuhkan kekuatan fisik.',
              icon: Icons.fitness_center,
              color: Colors.orangeAccent,
            ),
            SizedBox(height: 16),
            _buildElementCard(
              title: 'Daya Tahan (Endurance)',
              description:
                  'Kemampuan tubuh untuk bekerja dalam waktu lama tanpa merasa lelah.',
              icon: Icons.timer,
              color: Colors.lightGreen,
            ),
            SizedBox(height: 16),
            _buildElementCard(
              title: 'Fleksibilitas (Flexibility)',
              description:
                  'Kemampuan tubuh untuk bergerak dalam rentang gerak yang luas.',
              icon: Icons.self_improvement,
              color: Colors.lightBlueAccent,
            ),
            SizedBox(height: 16),
            _buildElementCard(
              title: 'Kecepatan (Speed)',
              description:
                  'Kemampuan tubuh untuk bergerak dari satu tempat ke tempat lain dalam waktu singkat.',
              icon: Icons.speed,
              color: Colors.pinkAccent,
            ),
            SizedBox(height: 16),
            _buildElementCard(
              title: 'Koordinasi (Coordination)',
              description:
                  'Kemampuan mengintegrasikan gerakan berbagai bagian tubuh secara efisien.',
              icon: Icons.all_inclusive,
              color: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElementCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
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
