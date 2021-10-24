import 'package:flutter/material.dart';

class FlightRoutes extends StatelessWidget {
  const FlightRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE04148), Color(0xFFD85774)],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 20,
                left: 20,
                child: BackButton(
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
