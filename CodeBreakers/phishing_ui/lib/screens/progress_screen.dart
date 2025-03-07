import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double _progress = 0.0;

  void _startAnimation() {
    setState(() {
      _progress = (_progress == 1.0) ? 0.0 : 1.0; // Toggle animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Progress Bar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Percentage Text
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: _progress * 100),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                return Text(
                  '${value.toInt()}%', // Animated percentage
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 20),

            // Progress Bar Animation
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: _progress),
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Container(
                  width: 300,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: 300 * value,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 30),

            // Button to Start Animation
            ElevatedButton(
              onPressed: _startAnimation,
              child: Text('Start Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
