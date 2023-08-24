import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondMatchScreen extends StatefulWidget {
  const SecondMatchScreen({super.key});

  @override
  State<SecondMatchScreen> createState() => _SecondMatchScreenState();
}

class _SecondMatchScreenState extends State<SecondMatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Italy Vs Spain"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("match_list")
              .doc("ItalyVsSpain")
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      data.get("match_name"),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.get("score_italy").toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              ":",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              data.get("score_spain").toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Time",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              ":",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              data.get("time"),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Time",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              ":",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              data.get("total_time"),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
