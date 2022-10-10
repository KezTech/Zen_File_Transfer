import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),

        showDoneButton: false,
        showNextButton: false,
        // next: const Icon(Icons.arrow_forward),
        showSkipButton: false,
      )),
    );
  }

  List<PageViewModel> getPages() {
    List<PageViewModel> pages = [
      PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Image.asset(
              'assets/images/splash.png',
              width: 90,
              height: 90,
            ),
          ),
          bodyWidget: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 72.0),
              child: Card(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.only(top: 60, bottom: 60),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.wifi_rounded, size: 60),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Zen File Transfer\n Just Connect To Any Network.\n(No internet connection is required!)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width > 720
                                        ? 18
                                        : 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          footer: ElevatedButton(
            onPressed: () async {
              SharedPreferences prefInst =
                  await SharedPreferences.getInstance();
              prefInst.setBool('isIntroRead', true);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacementNamed('/home');
            },
            child: const Text(
              "Let's Go !",
              style: TextStyle(color: Colors.orange),
            ),
          )),
    ];
    return pages;
  }
}
