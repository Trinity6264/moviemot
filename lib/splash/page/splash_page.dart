import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moviemot/dashboard/page/dashboard_page.dart';
import 'package:moviemot/utils/constant.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      });
      return;
    }, []);

    return Scaffold(
      backgroundColor: Constant.splashBackground,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(height: 8),
            const GradientText(
              text: 'Moviemot',
              gradient: LinearGradient(
                colors: [
                  Color(0xff40B4C9),
                  Color(0xffF2555B),
                ],
              ),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle style;

  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
