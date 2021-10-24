import 'package:flight_app_with_animation/widget/flight_routes.dart';
import 'package:flutter/material.dart';

const _airPlaneSize = 30.0;
const _dotSize = 18.0;
const _cardAnimationDuration = 100;

class FlightTimeLine extends StatefulWidget {
  const FlightTimeLine({Key? key}) : super(key: key);

  @override
  _FlightTimeLineState createState() => _FlightTimeLineState();
}

class _FlightTimeLineState extends State<FlightTimeLine> {
  bool animated = false;
  bool _animatedCard = false;
  bool animatedButton = false;
  void initAnimation() async {
    setState(() {
      animated = !animated;
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      _animatedCard = true;
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      animatedButton = true;
    });
  }

  _onRoutesPressedt() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, animation1, __) {
          return FadeTransition(opacity: animation1, child: FlightRoutes());
        },
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initAnimation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      final centerDot = constraint.maxWidth / 2 - _dotSize / 2;
      print(constraint);
      return Stack(
        fit: StackFit.expand,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            left: constraint.maxWidth / 2 - _airPlaneSize / 2,
            top: animated ? 20 : constraint.maxHeight - _airPlaneSize - 10,
            bottom: 00.0,
            child: AirCraftAndLine(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            left: centerDot,
            top: animated ? 80 : constraint.maxHeight,
            child: TimeLineDot(
              selected: true,
              displayCard: _animatedCard,
              delay: const Duration(milliseconds: _cardAnimationDuration),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            right: centerDot,
            top: animated ? 140 : constraint.maxHeight,
            child: TimeLineDot(
              selected: false,
              left: true,
              displayCard: _animatedCard,
              delay: const Duration(milliseconds: _cardAnimationDuration * 2),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            left: centerDot,
            top: animated ? 200 : constraint.maxHeight,
            child: TimeLineDot(
                selected: false,
                displayCard: _animatedCard,
                delay:
                    const Duration(milliseconds: _cardAnimationDuration * 3)),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1200),
              right: centerDot,
              top: animated ? 260 : constraint.maxHeight,
              child: TimeLineDot(
                  selected: false,
                  left: true,
                  displayCard: _animatedCard,
                  delay: const Duration(
                      milliseconds: _cardAnimationDuration * 4))),
          if (animatedButton)
            Align(
              alignment: Alignment.bottomCenter,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    _onRoutesPressedt();
                  },
                  child: const Icon(Icons.check),
                ),
              ),
            ),
        ],
      );
    });
  }
}

class AirCraftAndLine extends StatelessWidget {
  const AirCraftAndLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _airPlaneSize,
      child: Column(
        children: [
          const Icon(
            Icons.flight,
            color: Colors.red,
            size: _airPlaneSize,
          ),
          Expanded(
              child: Container(
            width: 5,
            color: Colors.grey[300],
          ))
        ],
      ),
    );
  }
}

class TimeLineDot extends StatefulWidget {
  final bool displayCard;
  final bool left;
  final bool selected;
  final Duration? delay;

  const TimeLineDot(
      {Key? key,
      required this.selected,
      this.displayCard = false,
      this.left = false,
      this.delay})
      : super(key: key);

  @override
  _TimeLineDotState createState() => _TimeLineDotState();
}

class _TimeLineDotState extends State<TimeLineDot> {
  bool animated = false;

  void _animatedWithDelay() async {
    if (widget.displayCard) {
      await Future.delayed(widget.delay ?? const Duration(microseconds: 0));
      setState(() {
        animated = true;
      });
    }
  }

  @override
  void didUpdateWidget(covariant TimeLineDot oldWidget) {
    _animatedWithDelay();
    super.didUpdateWidget(oldWidget);
  }

  Widget _buildCard() => TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      child: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Here"),
        ),
      ),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (animated && widget.left) ...[
          _buildCard(),
          Container(
            height: 1,
            width: 10,
            color: Colors.grey[400],
          ),
        ],
        Container(
          height: _dotSize,
          width: _dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: (Colors.grey[100])!),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundColor: widget.selected ? Colors.red : Colors.green,
            ),
          ),
        ),
        if (animated && !widget.left) ...[
          Container(
            height: 1,
            width: 10,
            color: Colors.grey[400],
          ),
          _buildCard(),
        ],
      ],
    );
  }
}
