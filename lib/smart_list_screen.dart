import 'package:flutter/material.dart';

final List<Map<String, String>> MyItems = [
  {"title": "Flutter UI",
    "img": "https://scontent.fdac24-2.fna.fbcdn.net/v/t39.30808-6/480773856_629963449976801_3909225214742285651_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeHiWAAtNw-G4PbuFpsvpP3Couv4JLVO7nai6_gktU7udi9e17_QySe0ZnHBke4VkPMghMxch64ddrpWq0gzLVrS&_nc_ohc=dlkZ_5ca6jAQ7kNvwEDIbx6&_nc_oc=AdltiCJUs_V6F-zWBdgiD_mTFEyVXRq0Cv9l-Kfb0EDKLRetVqDkiUKYWrVPyjvjrTE&_nc_zt=23&_nc_ht=scontent.fdac24-2.fna&_nc_gid=bF7SjgbpqJ3xeTE3_AIlYQ&oh=00_AfSetSCI58s7Lkaq3pMNHbHDYUTbw8vVI8_xLVFRTYZINw&oe=687D64E6"},
  {"title": "Dart Basics",
    "img": "https://purepng.com/public/uploads/large/purepng.com-mario-basedmariosuper-mariovideo-gamefictional-characternintendoshigeru-miyamotomario-franchise-1701528638226uemus.png"},
  {
    "title": "State Management",
    "img": "https://purepng.com/public/uploads/large/purepng.com-mario-basedmariosuper-mariovideo-gamefictional-characternintendoshigeru-miyamotomario-franchise-1701528638226uemus.png",
  },
];

class SmartListScreen extends StatelessWidget {
  const SmartListScreen({super.key});

  void mySnackBar(context, message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart List"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to HomeActivity
          },
        ),
      ),

      body: ListView.builder(
        itemCount: MyItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mySnackBar(context, MyItems[index]['title']);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 220,
              color: Colors.amberAccent,
              child: Image.network(MyItems[index]['img']!, fit: BoxFit.fill),
            ),
          );
        },
      ),
    );
  }
}
