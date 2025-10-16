import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';
  const AboutScreen({Key? key}) : super(key: key);

  // A helper widget to create styled list items for the topics
  Widget _buildTopicItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          // Expanded ensures the text wraps nicely if it's too long
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the current theme's text styles for consistent design
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      // Use ListView to prevent overflow on smaller devices
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        children: [
          const SizedBox(height: 20),
          // A nice visual icon at the top
          const Center(
            child: Icon(
              Icons.flutter_dash_rounded,
              size: 80,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),

          // Main heading
          Text(
            'About This App',
            style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // App description text
          Text(
            'It demonstrates how to structure code into screens, widgets, and models using modern Flutter practices.',
            style: textTheme.titleMedium?.copyWith(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 30),

          // Section title for the topics list
          Text(
            'Key Concepts Covered',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Using the helper to build a clean list of topics
          _buildTopicItem(context, 'MaterialApp & Theming'),
          _buildTopicItem(context, 'Stateful & Stateless Widgets'),
          _buildTopicItem(context, 'Basic Layout Widgets (Column, Row, etc.)'),
          _buildTopicItem(context, 'Implicit & Explicit Animations'),
          _buildTopicItem(context, 'Dart OOP & Project Structuring'),
        ],
      ),
    );
  }
}