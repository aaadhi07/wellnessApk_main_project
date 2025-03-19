import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Map<String, dynamic>> _resources = [
    {
      'icon': Icons.self_improvement,
      'title': 'Meditation Videos',
      'videos': [
        'Mindfulness Meditation',
        'Deep Breathing Exercise',
        'Guided Meditation for Sleep',
        'Morning Yoga Meditation',
        'Stress Relief Meditation'
      ],
    },
    {
      'icon': Icons.fitness_center,
      'title': 'Fitness Classes',
      'videos': [
        'Home Workout Routine',
        'Cardio for Beginners',
        'Strength Training Basics',
        'Full Body Stretch',
        'Pilates for Core Strength'
      ],
    },
    {
      'icon': Icons.nature,
      'title': 'Nature Therapy',
      'videos': [
        'Forest Bathing Guide',
        'Ocean Sounds Relaxation',
        'Bird Songs Therapy',
        'Mountain Scenery Meditation',
        'Walking in Nature Benefits'
      ],
    },
    {
      'icon': Icons.spa,
      'title': 'Relaxation Techniques',
      'videos': [
        'Progressive Muscle Relaxation',
        'Aromatherapy for Sleep',
        'Calm Breathing Exercise',
        'Self-Massage Techniques',
        'Visualization for Stress Relief'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Discover Your Wellness Journey',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _resources.length,
                itemBuilder: (context, index) {
                  final resource = _resources[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoListScreen(
                            title: resource['title'],
                            videos: resource['videos'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            resource['icon'],
                            size: 50,
                            color: Colors.teal,
                          ),
                          SizedBox(height: 10),
                          Text(
                            resource['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoListScreen extends StatelessWidget {
  final String title;
  final List<String> videos;

  VideoListScreen({required this.title, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(videos[index]),
              leading:
                  Icon(Icons.play_circle_fill, color: Colors.teal, size: 40),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Playing: ${videos[index]}'),
                    backgroundColor: Colors.teal,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
