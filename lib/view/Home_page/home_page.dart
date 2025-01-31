import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> quotes = [
    {
      'text': 'Stay positive, work hard, and make it happen!',
      'image': 'https://i.pinimg.com/originals/13/c0/cd/13c0cd7734a6add2a533d71efafe12e5.png',
    },
    {
      'text': 'The Power of Self-Care.',
      'image': 'https://cdn.shopify.com/s/files/1/0558/2782/4687/t/3/assets/img_2118-1696509578372_1400x.jpg?v=1696509579',
    },
    {
      'text': 'Calm is super power.',
      'image': 'https://media.istockphoto.com/id/1354599849/vector/positive-message-on-a-light-green-abstract-illustration-background-calm-is-a-super-power.jpg?s=1024x1024&w=is&k=20&c=4yC6yWj0OCC3b-o_xM-v2uh_0Xx44Wy7nxWvyUMlttg=',
    },
     {
      'text': 'Stay positive, work hard, and make it happen!',
      'image': 'https://i.pinimg.com/originals/13/c0/cd/13c0cd7734a6add2a533d71efafe12e5.png',
    },
    {
      'text': 'The Power of Self-Care.',
      'image': 'https://cdn.shopify.com/s/files/1/0558/2782/4687/t/3/assets/img_2118-1696509578372_1400x.jpg?v=1696509579',
    },
    {
      'text': 'Calm is super power.',
      'image': 'https://media.istockphoto.com/id/1354599849/vector/positive-message-on-a-light-green-abstract-illustration-background-calm-is-a-super-power.jpg?s=1024x1024&w=is&k=20&c=4yC6yWj0OCC3b-o_xM-v2uh_0Xx44Wy7nxWvyUMlttg=',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            affirmation_card(), //daily affirmation section
            SizedBox(height: 20),
            Text(
              'How are you feeling today?', //mood traker section
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMoodButton('😊', 'Happy'),
                _buildMoodButton('😐', 'Neutral'),
                _buildMoodButton('😔', 'Sad'),
              ],
            ),
            SizedBox(height: 20),
            //feed section
            Text(
              'Motivational Feed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.network(quotes[index]["image"].toString()),
                            height: 200,
                            width: double.infinity,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.vertical(
                            //       top: Radius.circular(10.0)),
                            //   image: DecorationImage(image: AssetImage(quotes[index]["image"].toString()))
                            // ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              quotes[index]["text"].toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.thumb_up_alt_outlined,
                                    color: Colors.grey),
                                label: Text('Like',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.comment_outlined,
                                    color: Colors.grey),
                                label: Text('Comment',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ],
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

  Widget _buildMoodButton(String emoji, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(
            emoji,
            style: TextStyle(fontSize: 24),
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildFeedItem(String text) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class affirmation_card extends StatelessWidget {
  const affirmation_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.tealAccent],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily Affirmation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '"You are capable of amazing things!"',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
