// import 'package:flutter/material.dart';
// import 'package:s_o_s/screens/login/login_page.dart';

// // ignore: must_be_immutable
// class OnboardingScreen extends StatelessWidget {
//     OnboardingScreen({super.key});

//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const Spacer(flex: 2),
//             Expanded(
//               flex: 14,
//               child: Hero(tag: context,

//                 child: GestureDetector(
//                   onTap: (){
//                        Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const SignInScreen(),
//                           ),
//                         );
//                   },
//                   child: Image.asset("image/allcare.png" , fit: BoxFit.scaleDown))),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:s_o_s/screens/login/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Animation duration
    );

    // Define the sliding animation to move the image from down to up
    _slideAnimation = Tween<Offset>(
            begin: const Offset(0, 1), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Define the scaling animation from 0.5 to 1.0
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Define the fading animation from 0 (transparent) to 1 (fully visible)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation when the screen is first loaded
    _controller.forward();

    // Listen to the animation status to detect when it completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Move to the next screen when the animation ends
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the widget tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 14,
              child: Hero(
                tag: 'hero-image',
                child: SlideTransition(
                  position: _slideAnimation, // Slide from bottom to top
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Image.asset(
                        "image/allcare.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
