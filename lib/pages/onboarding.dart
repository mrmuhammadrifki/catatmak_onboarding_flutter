import 'package:catatmak/config/themes/base_color.dart';
import 'package:catatmak/model/onboarding_content.dart';
import 'package:catatmak/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: BaseColor.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: BaseColor.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 222.0,
                        child: Image.asset(contents[i].image),
                      ),
                      const SizedBox(
                        height: 27.0,
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: BaseColor.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            height: 1.1),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      contents[i].description != null
                          ? Text(
                              contents[i].description!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: BaseColor.black,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDots(index, context),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0),
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const Login();
                  }));
                }
                _controller?.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: BaseColor.darkBlue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              child: const Text('LANJUT'),
            ),
          )
        ],
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      height: 12.0,
      width: 12.0,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? BaseColor.darkBlue : BaseColor.gray,
      ),
    );
  }
}
