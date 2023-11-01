import 'package:flutter/material.dart';
import 'package:nasa/transition_betwen_pages/routing_animatino.dart';
import 'package:nasa/transition_betwen_pages/secnd_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("First Page"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: const Text("Side Transition widget"),
            onPressed: () {
              Navigator.of(context).push(
                SideTransitionWidget(page: const SecondPage()),
              );
            },
          ),
          TextButton(
            child: const Text("Scale Transition Widet"),
            onPressed: () {
              Navigator.of(context).push(
                ScaleTransitionWidet(page: const SecondPage()),
              );
            },
          ),
          TextButton(
            child: const Text("Rotation Transition Widet"),
            onPressed: () {
              Navigator.of(context).push(
                RotationTransitionWidet(page: const SecondPage()),
              );
            },
          ),
          TextButton(
            child: const Text("Size Transition Widet"),
            onPressed: () {
              Navigator.of(context).push(
                SizeTransitionWidet(page: const SecondPage()),
              );
            },
          ),
          TextButton(
            child: const Text("Fade Transition Widet"),
            onPressed: () {
              Navigator.of(context).push(
                FadeTransitionWidet(page: const SecondPage()),
              );
            },
          ),
          TextButton(
            child: const Text("Two Transition Widet"),
            onPressed: () {
              Navigator.of(context).push(
                TwoTransitionWidet(page: const SecondPage()),
              );
            },
          ),
        ],
      )),
    );
  }
}
