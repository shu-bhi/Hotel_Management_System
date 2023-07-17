import 'package:flutter/material.dart';

class PageItem {
  final IconData icon;
  final String title;
  final String route;

  PageItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}

class AdminHomePage extends StatelessWidget {
  // static const String routeName = '/adminhomepage';

  final List<PageItem> pages = [
    PageItem(
      icon: Icons.person_3,
      title: 'Overview Of Sri Sai Krishna Hotel',
      route: '/about',
    ),
    PageItem(
      icon: Icons.restaurant_menu_outlined,
      title: 'Menu',
      route: '/menu',
    ),
    PageItem(
      icon: Icons.people_rounded,
      title: 'People',
      route: '/people',
    ),
    PageItem(
      icon: Icons.calculate,
      title: 'Calculator',
      route: '/calculator',
    ),
    PageItem(
      icon: Icons.location_on,
      title: 'Reach Us Here',
      route: '/map',
    ),
    PageItem(
      icon: Icons.supervised_user_circle,
      title: "User Profile",
      route: '/profile',
    ),
    PageItem(
      icon: Icons.no_food,
      title: 'Order Online',
      route: '/order',
    ),
    PageItem(
      icon: Icons.person_2,
      title: 'About Developer',
      route: '/me',
    ),
    PageItem(
      icon: Icons.logout,
      title: "LogOut",
      route: '/logout',
    ),
    // Add more PageItems for each available page
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF003628),
        title: const Center(
          child: Text(
            "Hotel Sri Sai Krishna",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 0.2 * screenHeight,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                elevation: 8,
                shadowColor: Colors.amber.shade400,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                          opacity: 0.8324,
                        ),
                      ),
                    ),
                    Center(
                      child: ListTile(
                        leading: Icon(
                          page.icon,
                          color: Colors.white,
                          size: 30,
                        ),
                        title: Text(
                          page.title,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, page.route);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
