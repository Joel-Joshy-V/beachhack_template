import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  final double percentage; // Accepts percentage value (0-100)

  const ProgressScreen({Key? key, required this.percentage}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barWidth = screenWidth * 0.9; // Set progress bar width

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Threat Detection + Percentage (Single Line)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: widget.percentage),
            duration: Duration(seconds: 2),
            builder: (context, value, child) {
              return Text(
                'Threat Detection ${value.toInt()}%', // Single line format
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(171, 0, 0, 0), // Alert color
                ),
              );
            },
          ),
          SizedBox(height: 10), // Space between text and progress bar
          // Progress Bar
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: widget.percentage / 100),
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Container(
                width: barWidth,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Background color
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 2),
                      width: barWidth * value,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.black54, // Progress bar color
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
