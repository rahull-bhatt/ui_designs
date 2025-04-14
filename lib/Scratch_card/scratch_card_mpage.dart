import 'dart:ui';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import 'package:ui_designs/Scratch_card/scratch_card_controller.dart';

class ScratchCardZoomPage extends StatelessWidget {
  final String tag;
  final ConfettiController confettiController = ConfettiController(
    duration: const Duration(seconds: 1),
  );
  final ScratchCardController scratchCardController = Get.find();

  ScratchCardZoomPage({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black87),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                scratchCardController.resetScratch(tag); // optional reset
                Get.back();
              },
            ),

          ),
          Obx(() {
            double height = scratchCardController.bottomSheetHeight.value;
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;

            // Maximum sheet height (same as your draggable maxChildSize)
            double maxSheetHeight = screenHeight * 0.5;
            double minSheetHeight = 100;

            // Ratio between 0 to 1, jaise jaise sheet upar ja rahi hai
            double sheetRatio = ((height - minSheetHeight) /
                (maxSheetHeight - minSheetHeight))
                .clamp(0.0, 1.0);

            // Image size will shrink slightly from 100% to 75% as sheet grows
            double imageSize = screenWidth * (1 - 0.25 * sheetRatio);

            // Card will shift upward smoothly as sheet expands
            double topPadding = screenHeight * 0.25 - (sheetRatio * 50);

            return Positioned(
              top: topPadding,
              left: (screenWidth - imageSize) / 2,
              child: SizedBox(
                width: imageSize,
                height: imageSize,
                child: scratchCard(),
              ),
            );
          }),
          DraggableScrollableSheet(
            initialChildSize: 200 / screenHeight,
            minChildSize: 200 / screenHeight,
            maxChildSize: 0.45,
            builder: (context, scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  scratchCardController.updateSheetHeight(
                    notification.extent * screenHeight,
                  );
                  return true;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Reward Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Text(
                          "500 Rs Jeet Gya Bro",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget scratchCard() {
    return Obx(() {
      bool isScratched = scratchCardController.isScratched(tag);

      return Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: tag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.white,
                child: isScratched
                    ? scratchCardResult()
                    : Scratcher(
                  brushSize: 40,
                  threshold: 25,
                  image: Image.asset('images/Scratchcard.png', fit: BoxFit.contain),
                  onThreshold: () {
                    scratchCardController.revealReward(tag);
                    confettiController.play();
                  },
                  child: scratchCardResult(),
                ),
              ),
            ),
          ),
          if (isScratched)
            ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              emissionFrequency: 0.05,
              numberOfParticles: 30,
              gravity: 0.2,
            ),
        ],
      );
    });
  }



  Widget scratchCardResult() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
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
                    fontSize: 20,
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
          bottom: 45,
          child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset('images/Won.png', fit: BoxFit.contain)),
        ),
      ],
    );
  }
}