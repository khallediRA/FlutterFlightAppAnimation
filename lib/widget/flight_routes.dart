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
            const Positioned(
              top: 20,
              left: 20,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            Positioned(
                left: 10,
                right: 10,
                top: MediaQuery.of(context).size.height * 0.10,
                child: Column(
                  children: [
                    RouteItem(
                      duration: const Duration(milliseconds: 800),
                    ),
                    RouteItem(
                      duration: const Duration(milliseconds: 1000),
                    ),
                    RouteItem(
                      duration: const Duration(milliseconds: 1200),
                    ),
                    RouteItem(
                      duration: const Duration(milliseconds: 1400),
                    ),
                    RouteItem(
                      duration: const Duration(milliseconds: 1600),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class RouteItem extends StatelessWidget {
  final Duration duration;
  const RouteItem({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(
        begin: 1.0,
        end: 0.0,
      ),
      curve: Curves.decelerate,
      duration: duration,
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(0.0, MediaQuery.of(context).size.height * value),
          child: child,
        );
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Sahara",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "SHE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.flight,
                    color: Colors.red,
                  ),
                  Text(
                    "SE132",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Macao",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "SHE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
