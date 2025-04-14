import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_designs/Scratch_card/scratch_card_controller.dart';
import 'package:ui_designs/Scratch_card/scratch_card_mpage.dart';

class HomepageScratchcard extends StatelessWidget {
  final ScratchCardController scratchCardController = Get.put(
    ScratchCardController(),
  );

  HomepageScratchcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "Scratch Card",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: scratchCardPage(context),
    );
  }

  Widget scratchCardPage(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        final tag = "ScratchCard_$index";

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                barrierColor: Colors.black45,
                transitionDuration: Duration(milliseconds: 1000), // Reduced for less flickering
                reverseTransitionDuration: Duration(milliseconds: 1000),
                pageBuilder: (_, __, ___) => ScratchCardZoomPage(tag: tag),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Obx(() {
            bool isScratched = scratchCardController.isScratched(tag);

            return Hero(
              tag: tag,
              flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
                // Maintain exact same appearance during transition
                // Widget sourceWidget;
                //
                // if (direction == HeroFlightDirection.push) {
                //   sourceWidget = fromContext.widget;
                // } else {
                //   sourceWidget = toContext.widget;
                // }
                //
                // return Material(
                //   color: Colors.transparent,
                //   child: sourceWidget,
                // );
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    final rotateY = Tween<double>(begin: 0.0, end: 10 * 3.1416) // 360°

                        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

                    final fade = Tween<double>(begin: 0.8, end: 1.0).animate(animation);

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // Perspective
                          ..rotateY(-rotateY.value),
                        child: Opacity(
                          opacity: fade.value,
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: isScratched
                      ? scratchCardResult()
                      : Image.asset('images/Scratchcard.png', fit: BoxFit.cover),
                );

              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: isScratched
                    ? scratchCardResult()
                    : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/Scratchcard.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget scratchCardResult() {
    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                // Center(
                //   child: Text(
                //     'You have won',
                //     style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black54,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 5),
                Center(
                  child: Text(
                    'Won ₹500',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            right: 25,
            left: 25,
            top: 30,
            bottom: 35,
            child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('images/Won.png', fit: BoxFit.contain)),
          ),
        ],
      ),
    );
  }
}