import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'list_screen.dart';
import 'about.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Flutter App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Add the image here
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
                child: Image.asset(
                  'assets/1.jpg', // Replace with your image path
                  height: 350, // Adjust height as needed
                  fit: BoxFit.cover, // Ensures the image fills the space nicely
                ),
              ),
              const SizedBox(height: 20), // Spacing below the image

              SizedBox(
                height: 80,
                child: Marquee(
                  text: '   Welcome to Study Flutter App!   ',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  velocity: 50.0,
                  pauseAfterRound: const Duration(seconds: 1),
                  blankSpace: 20.0,
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                icon: const Icon(Icons.list),
                label: const Text('View All Topics'),
                onPressed: () {
                  Navigator.pushNamed(context, ListScreen.routeName);
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                icon: const Icon(Icons.info_outline),
                label: const Text('About App'),
                onPressed: () {
                  Navigator.pushNamed(context, AboutScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}