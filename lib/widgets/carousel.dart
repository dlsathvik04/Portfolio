import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/current_content_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentCarousel extends StatelessWidget {
  final List<String> _certificatePaths = [
    'assets/images/cert/SIH2022.jpeg',
    'assets/images/cert/fccAPI.png',
    'assets/images/cert/udemyNode.png',
  ];
  final List<Uri> _certificateUrls = [
    Uri.parse('https://sih.gov.in/sih-2022-senior-final-result'),
    Uri.parse(
        'https://www.freecodecamp.org/certification/dlsathvik04/back-end-development-and-apis'),
    Uri.parse(
        'https://www.udemy.com/certificate/UC-58bb2611-b0ce-492e-b7cc-eea7bd39ff3c/'),
  ];
  final CarouselController _controller = CarouselController();

  ContentCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var currentContentProvider =
        Provider.of<CurrentContentProvider>(context, listen: false);
    currentContentProvider.addListener(
      () {
        _controller.animateToPage(currentContentProvider.currentContent.index);
      },
    );
    var themeProvider = Provider.of<ThemeProvider>(context);
    var isDarkTheme = themeProvider.isDarkTheme;
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 10),
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width * 0.65,
      child: CarouselSlider(
        disableGesture: true,
        items: [
          _AboutPage(isDarkTheme: isDarkTheme),
          _ProjectsPage(
              isDarkTheme: isDarkTheme,
              certificateUrls: _certificateUrls,
              certificatePaths: _certificatePaths),
          _ContactPage(isDarkTheme: isDarkTheme),
        ],
        carouselController: _controller,
        options: CarouselOptions(
          enableInfiniteScroll: true,
          scrollDirection: Axis.vertical,
          animateToClosest: true,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            if (index == 0) {
              currentContentProvider.setCurrentContent(Content.about);
            } else if (index == 1) {
              currentContentProvider.setCurrentContent(Content.projects);
            } else if (index == 2) {
              currentContentProvider.setCurrentContent(Content.connect);
            }
          },
          // pageSnapping: true,
        ),
      ),
    );
  }
}

class _ContactPage extends StatelessWidget {
  const _ContactPage({
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 20, bottom: 10),
      height: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isDarkTheme ? Colors.white24 : Colors.black12),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "ONLINE PRESENCE",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 25,
                fontWeight: FontWeight.w700,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () =>
                  launchUrl(Uri.parse('https://github.com/dlsathvik04')),
              child: Text(
                'GitHub profile.',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 60,
                  color: isDarkTheme
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => launchUrl(Uri.parse(
                  'https://www.linkedin.com/in/lekha-sathvik-devabathini-645105221/')),
              child: Text(
                'Linkedin Profile',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 60,
                  color: isDarkTheme
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => launchUrl(
                  Uri.parse('https://www.freecodecamp.org/dlsathvik04')),
              child: Text(
                'Free Code Camp profile',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 60,
                  color: isDarkTheme
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                // const Spacer(),
                const Icon(Icons.mail),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "lekhasathvikd@gmail.com",
                  style: TextStyle(
                    color: isDarkTheme
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProjectsPage extends StatelessWidget {
  const _ProjectsPage({
    required this.isDarkTheme,
    required List<Uri> certificateUrls,
    required List<String> certificatePaths,
  })  : _certificateUrls = certificateUrls,
        _certificatePaths = certificatePaths;

  final bool isDarkTheme;
  final List<Uri> _certificateUrls;
  final List<String> _certificatePaths;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 20),
      height: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isDarkTheme ? Colors.white24 : Colors.black12),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "my PROJECTS & CERTIFICATIONS",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 25,
                fontWeight: FontWeight.w700,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () => _launchUrl(Uri.parse(
                  "https://github.com/dlsathvik04/Dyslexia_Detection")),
              child: Text(
                'Dyslexia Detection using Hand Writing Samples (SIH2022).',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 60,
                  color: isDarkTheme
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'dlsathvik04.github.io (The current website).',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 60,
                color: isDarkTheme
                    ? Colors.white.withOpacity(0.5)
                    : Colors.black.withOpacity(0.5),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 1.75,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    color: isDarkTheme ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _certificateUrls.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => launchUrl(_certificateUrls[index]),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      width: 1.5 * MediaQuery.of(context).size.height / 4.5,
                      height: MediaQuery.of(context).size.height / 4.5,
                      decoration: BoxDecoration(
                          // color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(_certificatePaths[index]),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _AboutPage extends StatelessWidget {
  const _AboutPage({
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 20),
      height: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isDarkTheme ? Colors.white24 : Colors.black12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LEKHA SATHVIK DEVABATHINI",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 25,
              fontWeight: FontWeight.w700,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Student at Amrita School of Engineering, Amritapuri.',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 60,
              color: isDarkTheme
                  ? Colors.white.withOpacity(0.5)
                  : Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Currently Doing B.Tech in CSE with specialzation in AI.',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 60,
              color: isDarkTheme
                  ? Colors.white.withOpacity(0.5)
                  : Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => launchUrl(
                Uri.parse('https://amritawnaofficial.github.io/blockchain/')),
            child: Text(
              'Working as Intern at AMRITA CENTER FOR WIRELESS NETWORKS AND APPLICATIONS.',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 60,
                color: isDarkTheme
                    ? Colors.white.withOpacity(0.5)
                    : Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
