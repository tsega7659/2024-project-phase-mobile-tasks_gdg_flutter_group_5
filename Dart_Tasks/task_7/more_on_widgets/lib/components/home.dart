import 'package:flutter/material.dart';
import 'package:more_on_widgets/components/custome_button.dart';
import 'package:more_on_widgets/components/story_card.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
                    Icons.group_outlined,
                    size: 40,
                  ),
                  Icon(
                    Icons.person_2_outlined,
                    size: 40,
                  ),
                  Icon(
                    Icons.video_camera_front_outlined,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  icon: Icons.video_library,
                  text: "Reels",
                  iconColor: Colors.amber,
                  bgColor: Colors.amberAccent,
                  onTap: () => print("Reels Clicked"),
                ),
                CustomButton(
                  icon: Icons.video_call,
                  text: "Room",
                  iconColor: Colors.green,
                  bgColor: Colors.greenAccent,
                  onTap: () => print("Room Clicked"),
                ),
                CustomButton(
                  icon: Icons.group,
                  text: "Group",
                  iconColor: Colors.red,
                  bgColor: Colors.redAccent,
                  onTap: () => print("Group Clicked"),
                ),
                CustomButton(
                  icon: Icons.video_camera_front,
                  text: "Live",
                  iconColor: Colors.blue,
                  bgColor: Colors.blueAccent,
                  onTap: () => print("Live Clicked"),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        StoryCard(
                          storyImage: 'lib/assets/images/man.jpeg',
                          profileImage: 'lib/assets/images/man.jpeg',
                          name: "Your Story",
                          isAddStory: true,
                        ),
                        StoryCard(
                          storyImage: 'lib/assets/images/woman.png',
                          profileImage: 'lib/assets/images/woman1.png',
                          name: "Vish Patil",
                        ),
                        StoryCard(
                          storyImage: 'lib/assets/images/image_3.png',
                          profileImage: 'lib/assets/images/image_31.png',
                          name: "Rakesh Shetty",
                        ),
                        StoryCard(
                          storyImage: 'lib/assets/images/image_4.png',
                          profileImage: 'lib/assets/images/image_41.png',
                          name: "Akash Bolre",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('lib/assets/images/man_2.jpeg',
                        fit: BoxFit.cover, height: 100, width: 100),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Deven mestry is with Mahesh \nJoshi.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1 h .  Mumbai, Maharastra .",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.group,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Old is Gold!! ... ❤️😍",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'lib/assets/images/image_last.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 30,
                  ),
                  Icon(
                    Icons.mode_comment_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
