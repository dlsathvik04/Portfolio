import 'package:flutter/material.dart';
import 'package:portfolio/providers/current_content_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/widgets/carousel.dart';
import 'package:provider/provider.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDarkTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width -
          MediaQuery.of(context).size.height * (4284 / 7601),
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          NavBar(themeProvider: themeProvider),
          CustomDivider(isDarkTheme: isDarkTheme),
          ContentCarousel(),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _NavBarButtons("About", Content.about),
          const _NavBarButtons("Projects", Content.projects),
          const _NavBarButtons("Connect", Content.connect),
          Container(
            padding: const EdgeInsets.all(10),
            child: Switch(
              value: themeProvider.isDarkTheme,
              activeTrackColor: Colors.white,
              thumbColor: MaterialStateProperty.all(Colors.black38),
              inactiveTrackColor: Colors.black,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: MediaQuery.of(context).size.height,
      color: isDarkTheme ? Colors.white : Colors.black,
    );
  }
}

class _NavBarButtons extends StatelessWidget {
  final String _label;
  final Content _content;
  const _NavBarButtons(this._label, this._content);

  @override
  Widget build(BuildContext context) {
    var currentContentProvider = Provider.of<CurrentContentProvider>(context);
    var currentContent = currentContentProvider.currentContent;
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.isDarkTheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 8),
        child: TextButton(
          onPressed: () {
            currentContentProvider.setCurrentContent(_content);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                isDarkTheme
                    ? (_content == currentContent ? Colors.white : Colors.black)
                    : (_content == currentContent
                        ? Colors.black
                        : Colors.white),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              _label,
              style: TextStyle(
                  color: isDarkTheme
                      ? (_content == currentContent
                          ? Colors.black
                          : Colors.white)
                      : (_content == currentContent
                          ? Colors.white
                          : Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
