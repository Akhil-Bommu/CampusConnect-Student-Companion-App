import 'package:flutter/material.dart';

// Exp 8b: fades and slides its child in when it first appears
class FadeSlideIn extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    // The controller is the "clock" of the animation (0.0 to 1.0)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // The curve shapes the speed of the motion
    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    // Tweens define start and end values
    _fade = Tween<double>(begin: 0, end: 1).animate(curved);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3), // starts slightly below
      end: Offset.zero,
    ).animate(curved);

    // Wait for the delay, then play the animation
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // always free the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}