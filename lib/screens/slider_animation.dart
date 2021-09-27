import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderAnimation extends StatefulWidget {
  const SliderAnimation({Key? key}) : super(key: key);

  @override
  _SliderAnimationState createState() => _SliderAnimationState();
}

List<String> dataImage = [
  'https://cdn.dribbble.com/users/3281732/screenshots/16533701/media/590b31c6713f29bcbf2c59f009f5bee6.jpg?compress=1&resize=1200x900',
  'https://cdn.dribbble.com/users/63407/screenshots/16529140/media/59de9aff1992883d6ee58050e81cf4ae.png?compress=1&resize=1200x900',
  'https://cdn.dribbble.com/users/2028818/screenshots/16529592/media/72113f440d7b279051986a90f86f3d97.png?compress=1&resize=1200x900',
  'https://cdn.dribbble.com/users/1821976/screenshots/16529589/media/8897229f9cf915dab7c044757e5886dd.jpg?compress=1&resize=1200x900',
  'https://cdn.dribbble.com/users/5638/screenshots/16531842/media/b0ccd9201138ce19a3ecaa80aa579fc3.jpg?compress=1&resize=1200x900',
  'https://cdn.dribbble.com/users/2367334/screenshots/16528111/media/5595dc6b8830140e8b69efcda9c7ba46.png?compress=1&resize=1200x900',
];

int selectedPage = 0;

class _SliderAnimationState extends State<SliderAnimation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Container(
                key: ValueKey(dataImage[selectedPage]),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      dataImage[selectedPage],
                    ),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Center(
              child: FractionallySizedBox(
                heightFactor: 0.6,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      selectedPage = value;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: dataImage.length,
                  itemBuilder: (context, index) {
                    return FractionallySizedBox(
                      widthFactor: .8,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              dataImage[index],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
