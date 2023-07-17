import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Person {
  final String name;
  final String role;
  final String contact;
  final String photoUrl;

  Person({
    required this.name,
    required this.role,
    required this.contact,
    required this.photoUrl,
  });
}

class People extends StatelessWidget {
  final List<Person> people = [
    Person(
      name: 'Hanumantha Rao Eenadula',
      role: 'Owner',
      contact: '+91 96407 87066',
      photoUrl: 'assets/images/dad.jpg',
    ),
    Person(
      name: 'Sujatha Eenadula',
      role: 'Owner',
      contact: "+91 84649 27408",
      photoUrl: "assets/images/mom.jpg",
    ),
    Person(
      name: "Durga Rao",
      role: 'Staff Member',
      contact: "+91 95814 94145",
      photoUrl: "",
    ),
    Person(
      name: "Gowri",
      role: "Staff Member",
      contact: '+91 90145 20812',
      photoUrl: " ",
    ),
    Person(
      name: "Aparna",
      role: "Staff Member",
      contact: "+91 80088 12283",
      photoUrl: "",
    ),
    // Add more Person objects for other individuals
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'People',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0XFF003628),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          10,
          MediaQuery.of(context).size.height * 0.10,
          10,
          10,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              final bool showPhoneNumber =
                  index < 2; // Display phone number for the first two people

              return Card(
                elevation: 8,
                surfaceTintColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    style: BorderStyle.none,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(person.photoUrl),
                      backgroundColor: const Color(0XFFDEF5E5).withOpacity(0.5),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      person.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      person.role,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (showPhoneNumber)
                      Text(
                        person.contact,
                        style: const TextStyle(fontSize: 16),
                      ),
                    const SizedBox(height: 20),
                    if (showPhoneNumber)
                      ElevatedButton(
                        onPressed: () {
                          launchUrlString(
                            'tel:${person.contact}',
                            mode: LaunchMode.platformDefault,
                          );
                        },
                        child: const Text('Call'),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
