import 'package:flight_app_with_animation/widget/flight_form.dart';
import 'package:flight_app_with_animation/widget/flight_time.dart';
import 'package:flutter/material.dart';

class FlightHomeApp extends StatefulWidget {
  const FlightHomeApp({Key? key}) : super(key: key);

  @override
  _FlightHomeAppState createState() => _FlightHomeAppState();
}

enum FlightView {
  form,
  timeline,
}

class _FlightHomeAppState extends State<FlightHomeApp> {
  FlightView flightView = FlightView.form;
  void _onFlightPressed() {
    setState(() {
      flightView = FlightView.timeline;
    });
  }

  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.height * 0.32;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              height: headerHeight,
              left: 0,
              right: 0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE04148), Color(0xFFD85774)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Text(
                        "Air Asia",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          HeaderButton(title: "One Way", selected: false),
                          HeaderButton(title: "Round", selected: false),
                          HeaderButton(title: "Multicity", selected: true)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              top: headerHeight / 2,
              bottom: 0,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: TabButton(title: "Flight", selected: true),
                        ),
                        Expanded(
                          child: TabButton(title: "Train", selected: false),
                        ),
                        Expanded(
                          child: TabButton(title: "Bus", selected: false),
                        )
                      ],
                    ),
                    Expanded(
                        child: flightView == FlightView.form
                            ? FlightForm(
                                onTap: _onFlightPressed,
                              )
                            : FlightTimeLine())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool selected;

  const TabButton({Key? key, required this.title, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: TextStyle(color: selected ? Colors.black : Colors.grey),
            ),
          ),
          if (selected)
            Container(
              height: 2,
              color: Colors.red,
            ),
        ],
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  final String title;
  final bool selected;

  const HeaderButton({Key? key, required this.title, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selected ? Colors.white : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          border: Border.all(color: Colors.white)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 13),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(color: selected ? Colors.red : Colors.white),
          ),
        ),
      ),
    );
  }
}
