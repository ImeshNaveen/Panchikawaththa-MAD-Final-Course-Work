import 'package:flutter/material.dart';
import 'ReviewForm.dart'; 

void main() {
  runApp(MaterialApp(home: ReviewsPage(), debugShowCheckedModeBanner: false));
}

class ReviewsPage extends StatelessWidget {
  final List<Map<String, String>> reviews = [
    {
      "name": "Kate Doe",
      "date": "June 5, 2019",
      "review":
          "A1 seller, I waited for over a month before I could review this great little DVD player...",
      "stars": "5"
    },
    {
      "name": "Kate Doe",
      "date": "June 5, 2019",
      "review": "Item came this morning well happy with how it was packed...",
      "stars": "4"
    },
  ];

  final Map<int, int> ratingCount = {
    5: 12,
    4: 5,
    3: 4,
    2: 2,
    1: 0,
  };

  double get averageRating {
    int totalStars = 0;
    int totalRatings = 0;
    ratingCount.forEach((stars, count) {
      totalStars += stars * count;
      totalRatings += count;
    });
    return totalRatings > 0 ? totalStars / totalRatings : 0.0;
  }

  int get totalRatings {
    return ratingCount.values.reduce((a, b) => a + b);
  }

  void _showReviewPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ReviewForm(),
    );
  }

  Widget _buildRatingBar(int stars, int count) {
    double maxWidth = 200;
    double percent = totalRatings > 0 ? count / totalRatings : 0;

    return Row(
      children: [
        Icon(Icons.star, size: 16, color: Colors.orange),
        SizedBox(width: 2),
        Text('$stars', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Stack(
          children: [
            Container(width: maxWidth, height: 8, color: Colors.grey[300]),
            Container(width: maxWidth * percent, height: 8, color: Colors.green),
          ],
        ),
        SizedBox(width: 8),
        Text(count.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rating & Reviews')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rating & Reviews", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(averageRating.toStringAsFixed(1),
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ratingCount.keys.map((star) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: _buildRatingBar(star, ratingCount[star]!),
                    );
                  }).toList(),
                )
              ],
            ),
            SizedBox(height: 16),
            Text("${reviews.length} reviews", style: TextStyle(fontSize: 16)),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (_, index) {
                  final review = reviews[index];
                  return ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text(review['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            int.parse(review['stars']!),
                            (_) => Icon(Icons.star, size: 16, color: Colors.orange),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(review['review']!),
                        Text(review['date']!, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () => _showReviewPopup(context),
                icon: Icon(Icons.edit),
                label: Text('Write a review'),
              ),
            )
          ],
        ),
      ),
    );
  }
}