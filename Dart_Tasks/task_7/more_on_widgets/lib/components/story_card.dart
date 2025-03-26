import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String storyImage;
  final String profileImage;
  final String name;
  final bool isAddStory;

  const StoryCard({
    super.key,
    required this.storyImage,
    required this.profileImage,
    required this.name,
    this.isAddStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 100, // Adjust width as needed
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue, width: 1), // Optional border
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(storyImage,
                  fit: BoxFit.cover, height: 180, width: 100),
            ),
            if (isAddStory)
              Positioned(
                bottom: 0,
                left: 35,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 15,
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            Positioned(
              bottom: 20,
              left: 20,
              child: CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 15,
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              bottom: 5,
              child: Text(name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
