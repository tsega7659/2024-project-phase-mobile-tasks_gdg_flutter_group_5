import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30, top: 40, bottom: 25),
          child: const Text(
            'facebook',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 60, top: 25, bottom: 25),
            child: const Icon(
              Icons.messenger_rounded,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 40,
                ),
                Icon(
                  Icons.contact_page_outlined,
                  size: 40,
                ),
                Icon(
                  Icons.person_2_outlined,
                  size: 40,
                ),
                Icon(
                  Icons.video_file_outlined,
                  size: 40,
                ),
                Icon(
                  Icons.notifications_outlined,
                  size: 40,
                ),
                Icon(
                  Icons.menu_outlined,
                  size: 40,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/assets/images/man.jpeg'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "What's on your mind? Yeab",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.photo_outlined, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.search, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
