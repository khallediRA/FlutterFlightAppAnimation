import 'package:flutter/material.dart';

class FlightForm extends StatelessWidget {
  final VoidCallback? onTap;
  const FlightForm({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.flight_takeoff,
                color: Colors.red,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: "Form"),
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.flight_land,
                color: Colors.red,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: "To"),
                ),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
              onPressed: onTap,
              backgroundColor: Colors.red,
              child: const Icon(Icons.graphic_eq))
        ],
      ),
    );
  }
}
