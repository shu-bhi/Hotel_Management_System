import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String url =
        "https://www.google.co.in/maps/dir//Hotel+Sri+Sai+Krishna,+Near,"
        "+Kondayya+Cheruvu+St,+Ambedkar+Nagar,+Tadepalligudem,+Andhra+Pradesh+534101/"
        "@16.8154618,81.5208321,20.22z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3a37b5ee094aa857:"
        "0x202bf328c182cc4e!2m2!1d81.5205644!2d16.8156424?entry=ttu";
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reach Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0XFF003628),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 0.3 * screenheight,
                width: 0.5 * screenwidth,
                child: Image.asset(
                  'assets/images/loading.gif',
                )),
            const Text(
              'You can reach us here!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                launch(
                  url,
                  // mode: LaunchMode.platformDefault,
                );
              },
              child: const Text('Get Directions!'),
            ),
          ],
        ),
      ),
    );
  }
}
