// import 'package:flutter/material.dart';
// import 'package:scratcher/scratcher.dart';
// import 'package:confetti/confetti.dart';
//
// class ScratchCardDemo extends StatefulWidget {
//   const ScratchCardDemo({super.key});
//
//   @override
//   ScratchCardDemoState createState() => ScratchCardDemoState();
// }
//
// class ScratchCardDemoState extends State<ScratchCardDemo>
//     with SingleTickerProviderStateMixin {
//   final GlobalKey<ScratcherState> scratchKey = GlobalKey<ScratcherState>();
//   late ConfettiController _confettiController;
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   bool _isRevealed = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(
//       duration: const Duration(seconds: 2),
//     );
//
//     _scaleController = AnimationController(
//       duration: const Duration(milliseconds: 400),
//       vsync: this,
//     );
//
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
//       CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
//     );
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose();
//     _scaleController.dispose();
//     super.dispose();
//   }
//
//   void _onScratchProgress(double value) {
//     if (value > 15 && !_isRevealed) {
//       _isRevealed = true;
//       _scaleController.forward().then((_) {
//         scratchKey.currentState?.reveal(duration: Duration(milliseconds: 400));
//         _confettiController.play();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: const Text('🎉 Scratch & Win!')),
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // 🎊 Confetti
//             ConfettiWidget(
//               confettiController: _confettiController,
//               blastDirectionality: BlastDirectionality.explosive,
//               shouldLoop: false,
//               colors: const [
//                 Colors.green,
//                 Colors.blue,
//                 Colors.pink,
//                 Colors.orange,
//                 Colors.purple,
//               ],
//             ),
//             // 🪄 Animated scale for zoom effect
//             ScaleTransition(
//               scale: _scaleAnimation,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 child: Scratcher(
//                   key: scratchKey,
//                   brushSize: 40,
//                   threshold: 75,
//                   image: Image.asset(
//                     'images/Scratchcard.png',
//                     fit: BoxFit.contain,
//                   ),
//                   onChange: _onScratchProgress,
//                   child: Container(
//                     height: 200,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       color: Colors.blueGrey.shade50,
//                       borderRadius: BorderRadius.all(Radius.circular(15)),
//                     ),
//                     child: Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 5),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 0),
//                                 child: const Center(
//                                   child: Text(
//                                     ' You have won',
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black54,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 10,right: 10),
//                                 child: Center(
//                                   child: Text(
//                                     '₹500',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           right: 25,
//                           left: 25,
//                           top: 30,
//                           bottom: 65,
//                           child: SizedBox(
//                             height: 100,
//                             width: 100,
//                             child: Image.asset('images/Won.png',
//                               fit: BoxFit.contain,),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
