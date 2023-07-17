import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'About Me',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: const Color(0XFF003628),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.3 * screenheight,
              width: 0.5 * screenwidth,
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/pic2.jpg"),
                backgroundColor: Colors.white10,
              ),
            ),
            const Text(
              'Know more about me here!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Visit My Portfolio',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                launch(
                  "https://bhanuprakash9973.github.io",
                  // mode: LaunchMode.platformDefault,
                );
              },
              child: const Text('Open Portfolio'),
            ),
          ],
        ),
      ),
    );
  }
}
