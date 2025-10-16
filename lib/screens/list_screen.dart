import 'package:flutter/material.dart';
import '../models/item.dart';

class ListScreen extends StatelessWidget {
  static const String routeName = '/list';

  const ListScreen({Key? key}) : super(key: key);

  // Helper widget for building the styled grid items
  Widget _buildGridItem(BuildContext context, Item topic) {
    // A list of gradients to cycle through for variety
    final gradients = [
      [Colors.blue.shade400, Colors.blue.shade800],
      [Colors.teal.shade400, Colors.teal.shade700],
      [Colors.indigo.shade400, Colors.indigo.shade700],
      [Colors.purple.shade400, Colors.purple.shade700],
    ];

    // Pick a gradient based on the item's ID
    final itemGradient = gradients[topic.id % gradients.length];

    return GestureDetector(
      onTap: () => _showDetails(context, topic),
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias, // Ensures the gradient respects the border radius
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: itemGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.article_outlined, // A nice icon for each item
                color: Colors.white,
                size: 32,
              ),
              const Spacer(), // Pushes the text to the bottom
              Text(
                topic.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                topic.subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.9),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated method for showing the beautifully designed bottom sheet
  void _showDetails(BuildContext context, Item topic) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to be taller
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Takes up only necessary space
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The "drag handle" at the top
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              topic.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              topic.details,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                height: 1.5, // Improved line spacing for readability
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sample data generation
    final topics = List.generate(
      12,
          (i) => Item(
        id: i,
        title: 'Topic ${i + 1}',
        subtitle: 'Brief subtitle for topic ${i + 1}',
        details: 'This is the longer explanation and includes detailed study notes for Topic ${i + 1}. We are expanding this text to better demonstrate how the bottom sheet handles a larger amount of content.',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Topics'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0), // Increased padding
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1, // Changed to 1 for a square look
            crossAxisSpacing: 16, // Increased spacing
            mainAxisSpacing: 16, // Increased spacing
          ),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            return _buildGridItem(context, topics[index]);
          },
        ),
      ),
    );
  }
}