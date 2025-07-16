import 'package:flutter/material.dart';
import 'package:test_app/smart_list_screen.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  bool showText = true;

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }

  MyAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert !"),
          content: Text("Do you want to hide the text?"),
          actions: [
            TextButton(
              onPressed: () {
                MySnackBar("Text removed", context);
                setState(() {
                  showText = false; // Hides the text
                });
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My AppBar....",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            wordSpacing: 2,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                MySnackBar("This is add button", context);
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                MySnackBar("This is search button", context);
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                MySnackBar("This is message button", context);
              },
              icon: const Icon(Icons.messenger)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.green,
        onPressed: () {
          MySnackBar("This is floating action button", context);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index) {
          if (index == 0) {
            MySnackBar("This is home bottomnavigationbar", context);
          } else if (index == 1) {
            MySnackBar("This is contact bottomnavigationbar", context);
          } else if (index == 2) {
            MySnackBar("This is profile bottomnavigationbar", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: GestureDetector(
                onTap: () {
                  MySnackBar("This is profile drawer", context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                      radius: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Shahriar Alam',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'shariar@email.com',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop(); // Close drawer

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SmartListScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0), // Slide from right
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },

            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                MySnackBar("This is profile drawer", context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                MySnackBar("This is setting drawer", context);
              },
            ),
            Padding(
              padding:  EdgeInsets.only(left: 150,right: 0,bottom: 0,top: 410),
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: Icon(Icons.close, color: Colors.green, size: 24),
                ),
                title: Text('Close'),
                onTap: () {
                  MySnackBar("Drawer closed", context);
                  Navigator.of(context).pop();
                },
              ),

            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showText)
              const Text(
                "This is a text widget which is pretty long",
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                  letterSpacing: 2,
                  fontSize: 30,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                MyAlertDialog(context); // Open dialog to confirm removal
              },
              child: const Text("Click Me"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showText = true; // Make text reappear
                });
                MySnackBar("Text restored", context);
              },
              child: const Text("Reset Text"),
            ),
          ],
        ),
      ),

    );
  }
}
