import 'package:assignment_14/screens/second_match_screen.dart';
import 'package:flutter/material.dart';

import 'first_match_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match List"),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FirstMatchScreen(),
                  ),
                );
              },
              title: const Text("Argentina VS Africa"),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.grey,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondMatchScreen(),
                  ),
                );
              },
              title: const Text("Italy VS Spain"),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
