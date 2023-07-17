import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Overview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.png"),
                backgroundColor: Colors.white10,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Welcome to Hotel Sri Sai Krishna - Your Ultimate South Indian Breakfast Destination!''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''At Hotel Sri Sai Krishna, we take immense pleasure in serving you a delightful array of mouthwatering South Indian breakfast delicacies. As a renowned tiffin center, we specialize in offering an extensive menu that features all your favorite items from the rich and flavorsome South Indian breakfast repertoire. From crispy dosas to fluffy idlis, and everything in between, we guarantee a satisfying culinary experience that will leave you craving for more.''',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Exquisite South Indian Delights at Affordable Prices''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Our mission at Hotel Sri Sai Krishna is to make authentic South Indian breakfast accessible to everyone without compromising on quality or taste. We believe that enjoying a sumptuous morning meal should be a delightful and affordable experience for all. Therefore, we offer our delectable range of dishes at prices that won't break the bank, ensuring that our guests can relish the flavors of South India without any financial worries.''',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''A Gastronomic Journey of Flavors''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Prepare your taste buds for an unforgettable culinary journey as you step into Hotel Sri Sai Krishna. Our skilled and talented chefs have honed their craft over the years, perfecting the art of creating traditional South Indian breakfast dishes. From the first bite, you'll be transported to the aromatic streets of South India, savoring the authentic flavors and textures that have made these dishes beloved worldwide.''',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Whether you're in the mood for a piping hot plate of idlis accompanied by a variety of chutneys and sambar or craving the iconic crispiness of dosas with a tantalizing filling of your choice, our menu offers an extensive selection to cater to every palate. Indulge in the heavenly combination of soft and fluffy vadas paired with aromatic filter coffee, or relish the flavors of a traditional Pongal prepared with care and love.''',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Impeccable Service and Welcoming Ambience''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''At Hotel Sri Sai Krishna, we not only prioritize the quality of our food but also the comfort and satisfaction of our guests. Our dedicated staff is committed to providing impeccable service, ensuring that your visit is memorable from start to finish. The warm and inviting ambiance of our tiffin center creates the perfect setting for a relaxed and enjoyable dining experience.''',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Convenient Location''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Situated in a prime location, Hotel Sri Sai Krishna is easily accessible to both locals and travelers alike. Whether you're a resident seeking a fulfilling breakfast or a visitor eager to explore the culinary delights of South India, our tiffin center is conveniently located, making it the ideal destination to satisfy your cravings.''',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Visit Hotel Sri Sai Krishna Today''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''For an authentic and affordable South Indian breakfast experience, look no further than Hotel Sri Sai Krishna. Join us at our tiffin center and embark on a gastronomic adventure that celebrates the rich heritage and flavors of South India. Our commitment to exceptional food, outstanding service, and welcoming ambiance ensures that your visit to Hotel Sri Sai Krishna will be an experience to cherish.''',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
