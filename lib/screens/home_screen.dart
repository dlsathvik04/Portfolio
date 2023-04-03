import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/widgets/tabs_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height >
              1
          ? Container(
              color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  _ImageLayer(themeProvider: themeProvider),
                  _AnimationLayer(themeProvider: themeProvider),
                  _MainLayer(themeProvider: themeProvider),
                ],
              ),
            )
          : Container(
              color: Colors.black,
              child: const Center(
                child: Text(
                  "Not Developed for this screen yet",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
  }
}

class _ImageLayer extends StatelessWidget {
  const _ImageLayer({
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    const assetImage = AssetImage('assets/images/test1_dark_transparent.png');
    const assetImage2 = AssetImage('assets/images/test1_light_transparent.png');
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height * (4284 / 7601),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: themeProvider.isDarkTheme ? assetImage : assetImage2,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class _MainLayer extends StatelessWidget {
  const _MainLayer({
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const TabsWidget(),
    );
  }
}

class _AnimationLayer extends StatelessWidget {
  const _AnimationLayer({
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return CircularParticle(
      key: UniqueKey(),
      numberOfParticles: 300,
      speedOfParticles: 1,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      onTapAnimation: false,
      particleColor: themeProvider.isDarkTheme ? Colors.white : Colors.black,
      awayAnimationDuration: const Duration(milliseconds: 600),
      maxParticleSize: 3,
      isRandSize: true,
      isRandomColor: false,
      connectDots: false, //not recommended
    );
  }
}
